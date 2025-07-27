// Variáveis locais
var _hgui = display_get_gui_height();
var _hstr = string_height("I");
var espacamento_vertical = 25;
var tam_menu = array_length(menu_inicial);

// Entrada (fade-in)
if (!entrada_concluida) {
	alpha_fade = lerp(alpha_fade, 1, 0.05);
	if (abs(alpha_fade - 1) < 0.01) {
		alpha_fade = 1;
		entrada_concluida = true;
	}
}

// Navegação por Teclado (w/s ou setas)
if (!mudando_de_menu){
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
		indice_selecionado = (indice_selecionado - 1 + tam_menu) mod tam_menu;
		audio_play_sound(snd_mover, 1, false);
	}
	
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
		indice_selecionado = (indice_selecionado + 1) mod tam_menu;
		audio_play_sound(snd_mover, 1, false);
	}
	
	// Seleção (Enter / Espaço) + Mudança de Menu Principal e Menu opções
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
		audio_play_sound(snd_mover, 1, false);
		
		if (estado_menu == "principal") {
			switch (indice_selecionado) {
				case 0: // Vamo joga um game
					mudando_de_menu = true;
					break;
				case 1: // Opções
					estado_menu = "opcoes";
					menu_inicial = menu_opcoes;
					esc = array_create(array_length(menu_inicial), 1);
					pos_y_anim = array_create(array_length(menu_inicial), _hgui);
					indice_selecionado = 0;
					break;
				case 2: // Créditos
						show_message("Feito pela equipe TerraOne!");
						break;
				case 3: // Sair
						mudando_de_menu = true;
						break;
				}
			} else if (estado_menu == "opcoes") {
				switch (indice_selecionado) {
					case 0:
						show_message("Áudio ainda não implementado");
						break;
					case 1: 
						show_message("Controles ainda não implementados");
						break;
					case 2: //Volta
						estado_menu = "principal";
						menu_inicial = menu_principal;
						esc = array_create(array_length(menu_inicial), 1);
						pos_y_anim = array_create(array_length(menu_inicial), _hgui);
						indice_selecionado = 0;
						break;
			}
		}
	}
}

// Animação Vrtical de entrada dos itens
for (var i = 0; i < array_length(menu_inicial); i++) {
	var destino = (_hgui / 2) - (tam_menu * (_hstr + espacamento_vertical)) / 2 +
				  (_hstr + espacamento_vertical) / 2 + i * (_hstr + espacamento_vertical);
	pos_y_anim[i] = lerp(pos_y_anim[i], destino, 0.1);
}

// Fade-in e Fade-out
if (mudando_de_menu) {
	alpha_fade = lerp(alpha_fade, 0, 0.05);
		if (alpha_fade <= 0.01) {
			if (estado_menu == "principal" && indice_selecionado == 0){
				room_goto(rm_jogo);
			} else if (estado_menu == "principal" && indice_selecionado == 3) {
				game_end()
		}		
	}
}	