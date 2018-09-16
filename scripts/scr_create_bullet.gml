var player_inst = argument0;
var ammo_type = argument1;

var x_position = player_inst.x;
var y_position = player_inst.y;

var sprite_idx;
var angle = 0;

var dir = 0;

if (player_inst.object_index == obj_player1) {
   // sprite_idx = spr_missile_1;
} else {
   // sprite_idx = spr_missile_2;
    angle = 180;
    dir = 180;
}

var bullet = instance_create(x_position, y_position, ammo_type);
//bullet.sprite_index = sprite_idx;
bullet.image_angle = angle;
bullet.owner = player_inst;

with (bullet) {
    motion_set(dir, speed);
}

