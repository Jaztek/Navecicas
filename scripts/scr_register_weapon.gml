/// scr_register_weapon(weapon_class, owner)

var weapon_class = argument0;
var owner = argument1;

if (ds_map_exists(owner.weapons_map, weapon_class)) {
    // Ya tiene registrada el arma -- upgrade
    var weapon = owner.weapons_map[? weapon_class];
    weapon.weapon_level += 1; 
} else {
    // No tenía este arma -- la creamos
    var weapon_inst = instance_create(owner.x, owner.y, weapon_class);
    weapon_inst.owner = owner;
    owner.weapons_map[? weapon_class] = weapon_inst;
}


