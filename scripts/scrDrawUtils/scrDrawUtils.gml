/// @desc Creating this struct populates the halign and valign variables with the current draw_halign and draw_valign
function DrawAligns() constructor
{
	halign = draw_get_halign();
	valign = draw_get_valign();
}

/// @desc Set draw halign and valign to values in provided DrawAligns struct
/// @param {DrawAligns} aligns - DrawAligns struct with desired halign and valign
function draw_set_aligns(aligns)
{
	draw_set_halign(aligns.halign);
	draw_set_valign(aligns.valign);
}

/// @desc Struct containing some common draw values (DrawAligns, alpha, color, font)
function DrawValues() constructor
{
	aligns = new DrawAligns();
	alpha = draw_get_alpha();
	color = draw_get_color();
	font = draw_get_font();
}

/// @desc Sets some draw values to those given with the provided DrawValues struct
/// @param {DrawValues} values - DrawValues struct containing values to be used
function draw_set_values(values)
{
	draw_set_aligns(values.aligns);
	draw_set_alpha(values.alpha);
	draw_set_color(values.color);
	draw_set_font(values.font);
}

// Code from http://www.davetech.co.uk/gamemakercircularhealthbars
// Cleaned up and updated to use GMS2 scripts and functions
function draw_circular_bar(_x, _y, _value, _max, _colour, _radius, _transparency, _width)
{
	if (_value > 0) { // no point even running if there is nothing to display (also stops /0
	    var i, len, tx, ty, val;
    
	    var numberofsections = 60; // there is no draw_get_circle_precision() else I would use that here
	    var sizeofsection = 360 / numberofsections;
    
	    val = (_value / _max) * numberofsections;
    
	    if (val > 1) { // HTML5 version doesnt like triangle with only 2 sides 
	        var piesurface = surface_create(_radius * 2, _radius * 2)
            
	        draw_set_colour(_colour);
	        draw_set_alpha(_transparency);
        
	        surface_set_target(piesurface);
        
	        draw_clear_alpha(c_blue,  0.7);
	        draw_clear_alpha(c_black, 0);
        
	        draw_primitive_begin(pr_trianglefan);
	        draw_vertex(_radius, _radius);
        
	        for(i = 0; i <= val; i++) {
	            len = (i * sizeofsection) + 90; // the 90 here is the starting angle
	            tx = lengthdir_x(_radius, len);
	            ty = lengthdir_y(_radius, len);
	            draw_vertex(_radius + tx, _radius + ty);
	        }
        
	        draw_primitive_end();
        
	        draw_set_alpha(1);
        
			gpu_set_blendmode(bm_subtract);
	        draw_set_colour(c_black);
	        draw_circle(_radius - 1, _radius - 1, _radius - _width, false);
	        gpu_set_blendmode(bm_normal);

	        surface_reset_target();
     
	        draw_surface(piesurface, _x - _radius, _y - _radius);
        
	        surface_free(piesurface);
	    }
	}
}
