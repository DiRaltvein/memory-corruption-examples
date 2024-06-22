// https://www.cvedetails.com/cve/CVE-2022-4202/
// repository: https://github.com/gpac/gpac
// commit: faac2ce
// extract of: src/laser/lsr_dec.c (function: lsr_translate_coords)

#include <stdint.h>
#include <limits.h>

typedef int32_t s32;
typedef uint32_t u32;

float lsr_translate_coords(u32 val, u32 nb_bits)
{
	if (!nb_bits)
		return 0;

	if (val >> (nb_bits - 1))
	{
		s32 neg = (s32)val - (1 << nb_bits); // Problem: s32 is a signed integer that has 32 bits and if nb_bits will be >= 31 then number will overflow
		return neg;
	}
	// below return 0 actually
	return (s32)val - (1 << nb_bits);
}

int main(int argc, char *argv[])
{
	lsr_translate_coords(INT_MAX, 31);
}
