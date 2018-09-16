/// scr_show_message(player, text)

var player = argument0;
var text = argument1;

var message_controller = instance_find(obj_message_controller, 0);

if (player == global.player1) {
    var queue = message_controller.map_msg[? global.player1];
    ds_queue_enqueue(queue, text);
} else {
    var queue = message_controller.map_msg[? global.player2];
    ds_queue_enqueue(queue, text);
}

