/// scr_draw_outline_text(x, y, text, angle, color, outline_color)

var xx = argument0;  
var yy = argument1;  
var text = argument2;
var angle = argument3;
var color = argument4;
var outline_color = argument5;

draw_set_halign(fa_center);
draw_set_font(fnt_space_superstar);

for (var i = 0; i < 360; i += 10) {
    draw_text_transformed_color(xx + lengthdir_x(2, i), 
        yy + lengthdir_y(2, i), text, 0.7, 1, angle,
        outline_color, outline_color, outline_color, outline_color, 1);
}

draw_text_transformed_color(xx, yy, text, 0.7, 1, angle,
        color, color, color, color, 1);

draw_set_halign(fa_left);

