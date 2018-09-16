/// scr_input_powerup(mouse_index, selected_powerup)

var mouse_index = argument0;
var selected_powerup = argument1;

if (device_mouse_check_button_pressed(mouse_index, mb_left)) {

    if (position_meeting(device_mouse_x(mouse_index),
        device_mouse_y(mouse_index), 
        obj_powerup)) {
        
        return instance_position(
            device_mouse_x(mouse_index),
            device_mouse_y(mouse_index), 
            obj_powerup);
              
    }
} else if (selected_powerup != noone && 
    device_mouse_check_button_released(mouse_index, mb_left)) {
    
    if (device_mouse_x(mouse_index) > room_width / 2) {
        with (selected_powerup) {
            owner = global.player2;             
            alarm_set(0, 1);
       }
    } else {
         with (selected_powerup) {
            owner = global.player1;             
            alarm_set(0, 1);
        }
    }
    return noone;
}

return selected_powerup;
