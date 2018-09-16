/// scr_apply_damage(target, source, damage)
var target = argument0;
var source = argument1;
var damage = argument2;

if (object_is_ancestor(target.object_index, obj_player)) {
    if (target == global.player1) {
        target.hit_points -= damage;
        // global.player2.hit_points += damage;
    } else {
        target.hit_points -= damage;
        // global.player1.hit_points += damage;
    }
} else if (target.object_index == obj_meteorite) {
    target.hit_points -= damage;
}
