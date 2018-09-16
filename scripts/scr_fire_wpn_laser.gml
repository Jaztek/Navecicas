/// scr_fire_wpn_laser()

var weapon_owner = owner;
var damage = laser_dps;

var dir = cos(degtorad(weapon_owner.facing_direction));

var first_obstacle = noone;

var rectangle_right;
var rectangle_left;

if (dir > 0) {
    rectangle_right = room_width;
    rectangle_left = x + charge_player_xoffset;
} else {
    rectangle_right = x - charge_player_xoffset;
    rectangle_left = 0;
}

var height = sin(random(1));

var laser_max_height = (height * 20) + 30;
var rectangle_up = y - laser_max_height / 2;
var rectangle_down = y + laser_max_height / 2;

with (obj_player) {
 
    if (id != weapon_owner.id && x > rectangle_left 
        && x < rectangle_right 
        && y > rectangle_up 
        && y < rectangle_down) {
        
        if (first_obstacle == noone) {
            first_obstacle = self;
        } else if (dir > 0) {
            if (x < first_obstacle.x) {
                first_obstacle = self;
            }
        } else {
            if (x > first_obstacle.x) {
                first_obstacle = self;
            }
        }
    } 
}

with (obj_misil) {

    if (owner.id != weapon_owner.id && x > rectangle_left 
        && x < rectangle_right 
        && y > rectangle_up 
        && y < rectangle_down) {
        
        if (first_obstacle == noone) {
            first_obstacle = self;
        } else if (dir > 0) {
            if (x < first_obstacle.x) {
                first_obstacle = self;
            }
        } else {
            if (x > first_obstacle.x) {
                first_obstacle = self;
            }
        }
    } 
}

with (obj_barrier) {

    if (owner.id != weapon_owner.id && x > rectangle_left 
        && x < rectangle_right 
        && y > rectangle_up 
        && y < rectangle_down) {
        
        if (first_obstacle == noone) {
            first_obstacle = self;
        } else if (dir > 0) {
            if (x < first_obstacle.x) {
                first_obstacle = self;
            }
        } else {
            if (x > first_obstacle.x) {
                first_obstacle = self;
            }
        }
    } 
}

var obj_laser_collision = collision_rectangle(rectangle_left, rectangle_up, rectangle_right, rectangle_down, obj_meteorite, false, true);

if (obj_laser_collision != noone) {

    if (first_obstacle == noone) {
        first_obstacle = obj_laser_collision;
    } else if (dir > 0) {
        if (obj_laser_collision.x < first_obstacle.x) {
            first_obstacle = obj_laser_collision;
        }
    } else {
        if (obj_laser_collision.x > first_obstacle.x) {
            first_obstacle = obj_laser_collision;
        }
    }
} 

var lx1 = rectangle_left;
var lx2 = rectangle_right;

if (first_obstacle != noone) { 

    if (dir > 0) {
        lx2 = first_obstacle.x;
    } else {
        lx1 = first_obstacle.x;
    }
    
    if (object_is_ancestor(first_obstacle.object_index, obj_player)
        || first_obstacle.object_index == obj_meteorite) {
        
        scr_apply_damage(first_obstacle, weapon_owner, damage);
        
    } else if (first_obstacle.object_index == obj_misil) {
        with (first_obstacle) {
            instance_destroy();
        }
    } 
}

draw_set_blend_mode(bm_add);
draw_set_color(c_blue);

draw_line_width(lx1, y, lx2, y, laser_max_height);
draw_set_color(c_aqua);
draw_line_width(lx1, y, lx2, y, (height * 9) + 15);
draw_set_color(c_white);
draw_line_width(lx1, y, lx2, y, (height * 5) + 20);

draw_set_blend_mode(bm_normal);
