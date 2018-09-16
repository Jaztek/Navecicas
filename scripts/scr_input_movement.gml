/// scr_movement(mouse_index)

var mouse_index = argument0;

var player;

if (device_mouse_x(mouse_index) > room_width / 2) {
    player = player2_inst;
} else {
    player = player1_inst;
}
    
if (device_mouse_check_button(mouse_index, mb_left)) {
 
    if (device_mouse_y(mouse_index) > room_height / 2 + ULT_BTN_HEIGHT / 2) {
 
        // FLECHA ABAJO
        with (player) {
            facing_direction -= 8;
            vspd += 1;
        }
    } else if(device_mouse_y(mouse_index) < room_height / 2 - ULT_BTN_HEIGHT / 2) {
    
        // FLECHA ARRIBA
        with (player) {
            facing_direction += 8;
            vspd += 1;
        }
    } else {
     
        // BOTON
        
        var obj_boton = instance_position(device_mouse_x(mouse_index),
            device_mouse_y(mouse_index), obj_bt_center);
            
        if(obj_boton != noone) {
            with(obj_boton){
                 alarm_set(0, 1);
            }
        }
    }
}
