/// ==========================
/// SEÇÃO: Inicialização do Menu
/// ==========================
menu_inicial = ["Jogar", "Opções", "Créditos", "Sair"];
esc = array_create(array_length(menu_inicial), 1);
indice_selecionado = 0;

/// ==========================
/// SEÇÃO: Animação (Fade e Slide)
/// ==========================
alpha_fade = 0;
entrada_concluida = false;
pos_y_anim = array_create(array_length(menu_inicial), display_get_gui_height());

/// ==========================
/// SEÇÃO: Saída
/// ==========================
iniciando_saida = false;
proxima_room = -1;
