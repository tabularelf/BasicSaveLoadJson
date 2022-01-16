// Step Event
if (keyboard_check_pressed(vk_space)) {

	x = random(room_width);
	y = random(room_height);

}

if (keyboard_check_released(ord("S"))) {

	var _struct = {
		x: obj_player.x,
		y: obj_player.y
	}

	var _json = json_stringify(_struct);

	var _buff = buffer_create(string_byte_length(_json), buffer_fixed, 1);
	buffer_write(_buff, buffer_text, _json);
	buffer_save(_buff, "player.json");
	buffer_delete(_buff);
}	
		
if (keyboard_check_released(ord("L"))) && (file_exists("player.json")) { 
	var _buff = buffer_load("player.json");
	var _json = buffer_read(_buff, buffer_text);
	var _struct = undefined;
	buffer_delete(_buff);
	try {
		var _struct = json_parse(_json);
	} catch(_ex) {
		show_debug_message(_ex.message);
	}
	
	if (is_struct(_struct)) {
		obj_player.x = !is_undefined(_struct[$ "x"]) ? _struct[$ "x"] : obj_player.x;
		obj_player.y = !is_undefined(_struct[$ "y"]) ? _struct[$ "y"] : obj_player.y;	
	}
}

