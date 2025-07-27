// ==========================
// SEÇÃO: Variáveis locais
// ==========================
var _hgui = display_get_gui_height();
var _hstr = string_height("I");
var tam_menu = array_length(menu_inicial);
var espacamento_vertical = 25;

var mudou = false;

// ==========================
// SEÇÃO: Navegação por Teclado (W/S ou setas)
// ==========================
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

// ==========================
// SEÇÃO: Seleção (Enter / Espaço)
// ==========================
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
	audio_play_sound(snd_selecionar, 1, false);
	
	switch (indice_selecionado) {
		case 0:
		room_goto(rm_jogo);
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

// ==========================
// SEÇÃO: Animação de entrada (slide)
// ==========================
for (var i = 0; i < array_length(menu_inicial); i++) {
	var destino = (_hgui / 2) - (tam_menu * (_hstr + espacamento_vertical)) / 2 + 
				  (_hstr + espacamento_vertical) / 2 + i * (_hstr + espacamento_vertical);
	pos_y_anim[i] = lerp(pos_y_anim[i], destino, 0.1);
}

// ==========================
// SEÇÃO: Fade-in e Fade-out
// ==========================
if (!iniciando_saida) {
    if (!entrada_concluida) {
        alpha_fade = lerp(alpha_fade, 1, 0.05);
        if (abs(alpha_fade - 1) < 0.01) {
            alpha_fade = 1;
            entrada_concluida = true;
        }
    }
} else {
    alpha_fade = lerp(alpha_fade, 0, 0.05);
    if (alpha_fade <= 0.01 && proxima_room != -1) {
        room_goto(proxima_room);
    }
}