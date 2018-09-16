/// scr_fire_wpn_missile()

var sprite_idx;

// Weapon lvl 0
if (weapon_level >= 0) {

    var missile = instance_create(x, y, obj_misil);
    missile.image_angle = owner.facing_direction;
    missile.owner = owner;

    with (missile) {
        motion_set(owner.facing_direction, 40);
    }
    
    //other.proyectile_speed
}


