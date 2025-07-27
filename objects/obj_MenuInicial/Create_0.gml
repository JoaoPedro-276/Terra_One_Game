// Inicialização do Menu e Estado do Menu
estado_menu = "principal";

menu_principal = ["Jogar", "Opções", "Créditos", "Sair"];
menu_opcoes = ["Áudio", "Controles", "Voltar"];

menu_inicial = menu_principal;
esc = array_create(array_length(menu_inicial), 1);

indice_selecionado = 0;

// Animação (Fade e Slide) e Saída
alpha_fade = 0;
entrada_concluida = false;

pos_y_anim = array_create(array_length(menu_inicial), display_get_gui_height());

mudando_de_menu = false;