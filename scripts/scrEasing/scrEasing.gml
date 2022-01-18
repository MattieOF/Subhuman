function ease_out_quad(input, outputmin, outputmax, inputmax)
{
	input /= inputmax;
	return -outputmax * input * (input - 2) + outputmin;
}
