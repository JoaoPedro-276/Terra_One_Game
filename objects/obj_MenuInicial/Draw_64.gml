// Configuração de fonte e alinhamento
draw_set_font(f_MenuInicial);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha_fade);

// Cálculos de posição do menu
var espacamento_vertical = 15;
var _wgui = display_get_gui_width();
var _hgui = display_get_gui_height();
var _hstr = string_height("I");

var tam_menu = array_length(menu_inicial);
var altura_menu = tam_menu * (_hstr + espacamento_vertical);
var y_base = (_hgui / 2) - (altura_menu / 2) + (_hstr + espacamento_vertical) / 2;

// Desenho do menu com animação
for (var i = 0; i < tam_menu; i++) {
	var y_offset = i * (_hstr + espacamento_vertical);
	
	var alvo_escala = (i == indice_selecionado) ? 1.4 : 1;
	esc[i] = lerp(esc[i], alvo_escala, 0.15);
	
	if (i == indice_selecionado){
		draw_set_color(c_yellow);
	} else {
		draw_set_color(c_white);
	}
	
	draw_text_transformed(_wgui / 2, pos_y_anim[i], menu_inicial[i], esc[i], esc[i], 0);
	
}

// Reset das configurações gráficas
draw_set_color(c_white);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_alpha(1);