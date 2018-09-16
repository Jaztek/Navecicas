/// scr_fire_wpn_basic()

// Weapon lvl 0
if (weapon_level == 0) {

    var projectile = instance_create(x, y, obj_bullet_basic);
    
    projectile.owner = owner;

    with (projectile) {

        if (owner == global.player2) {
            sprite_index = spr_basic_bullet_red;
        }
        image_angle = owner.facing_direction;
        motion_set(owner.facing_direction, other.proyectile_speed);
    }
} else if (weapon_level >= 1) {
    
    var yy = y + 15;
            
    for (var i = 0; i < 3; i ++) {
        var projectile = instance_create(x, yy, obj_bullet_basic);

        projectile.owner = owner;
        
        with (projectile) {       
            if (owner == global.player2) {
                sprite_index = spr_basic_bullet_red;
            }
            image_angle = owner.facing_direction;
            motion_set(owner.facing_direction, other.proyectile_speed);
        }
        yy -= 15;
    }
}



