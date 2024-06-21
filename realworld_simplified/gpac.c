// https://www.cvedetails.com/cve/CVE-2022-4202/
// extract of: src/laser/lsr_dec.c
// integer overflow and it was fixed here https://github.com/gpac/gpac/commit/b3d821c4ae9ba62b3a194d9dcb5e99f17bd56908

#include <stdio.h>
#include <stdint.h>

#define gf_divfix(_a, _b) (((_b != 0)) ? (_a) / (_b) : __FLT_MAX__)
#define INT2FIX(v) ((float)(v))

float lsr_translate_coords(float res_factor, uint32_t val, uint32_t nb_bits)
{
	if (!nb_bits)
	{
		return 0;
	}

	if (val >> (nb_bits - 1))
	{
		int32_t neg = (int32_t)val - (1 << nb_bits);
		if (neg < -0.5f)
			return 2 * gf_divfix(INT2FIX(neg / 2), res_factor); // Problem: (Probably) if res_factor is 0 then __FLT_MAX__ is multiplied by 2 meaning that it overflows.
		return gf_divfix(INT2FIX(neg), res_factor);
	}
	else
	{
		if (val > -0.5f)
			return 2 * gf_divfix(INT2FIX(val / 2), res_factor); // Problem: (Probably) if res_factor is 0 then __FLT_MAX__ is multiplied by 2 meaning that it overflows.
		return gf_divfix(INT2FIX(val), res_factor);
	}
}

float lsr_translate_coords_2(float res_factor, uint32_t val, uint32_t nb_bits)
{
	if (!nb_bits)
	{
		return 0;
	}

	if (val >> (nb_bits - 1))
	{
		int32_t neg = (int32_t)val - (1 << nb_bits);
		return gf_divfix(INT2FIX(neg), res_factor);
	}
	else
	{
		return gf_divfix(INT2FIX(val), res_factor);
	}
}

int main(int argc, char *argv[])
{
	printf("%f\n", lsr_translate_coords(0, 50, 6));
	printf("%f\n", 2 * __FLT_MAX__);
}
