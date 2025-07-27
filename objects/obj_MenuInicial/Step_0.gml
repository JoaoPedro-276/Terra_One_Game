var mudou = false;

if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
	indice_selecionado -= 1;
	if (indice_selecionado < 0) indice_selecionado = array_length(menu_inicial) - 1;
	mudou = true;
}

if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
	indice_selecionado += 1;
	if (indice_selecionado >= array_length(menu_inicial)) indice_selecionado = 0;
	mudou = true;
}

if (mudou) {
	audio_play_sound(snd_mover, 1, false);
}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
	audio_play_sound(snd_selecionar, 1, false);
	
	switch (indice_selecionado) {
		case 0:
		show_message("Jogando :3");
		break;
		case 1:
		show_message("Tem que ver isso...");
		break;
		case 2:
		show_message("Feito pela equipe TerraOne!");
		break;
		case 3:
		game_end();
		break;
	}
}