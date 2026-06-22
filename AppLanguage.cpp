#include "AppLanguage.hpp"
#include "oxorany_include.h"

AppLanguage currentLanguage = AppLanguageEnglish;

std::string LocalizedString(const std::string& key) {
    if (currentLanguage == AppLanguagePortuguese) {
        if (key == oxorany("trial_text_1")) return oxorany("Esta é uma versão de avaliação destinada exclusivamente a testes e feedback.");
        if (key == oxorany("trial_text_2")) return oxorany("As funcionalidades, estabilidade e desempenho podem mudar na versão final. A sua participação ajuda a melhorar o produto final.");
        if (key == oxorany("build_prefix")) return oxorany("Compilado em: ");
        if (key == oxorany("build_suffix")) return oxorany(" para a versão do jogo ");
        if (key == oxorany("trial")) return oxorany("AVALIAÇÃO");

        if (key == oxorany("highlight_trial")) return oxorany("versão de avaliação");
        if (key == oxorany("highlight_testing")) return oxorany("testes");
        if (key == oxorany("highlight_feedback")) return oxorany("feedback");
        if (key == oxorany("highlight_release")) return oxorany("versão final");
        if (key == oxorany("highlight_improve")) return oxorany("melhorar");

        if (key == oxorany("day")) return oxorany("dia");
        if (key == oxorany("days")) return oxorany("dias");
        if (key == oxorany("hour")) return oxorany("hora");
        if (key == oxorany("hours")) return oxorany("horas");
        if (key == oxorany("minute")) return oxorany("minuto");
        if (key == oxorany("minutes")) return oxorany("minutos");
        if (key == oxorany("second")) return oxorany("segundo");
        if (key == oxorany("seconds")) return oxorany("segundos");
        if (key == oxorany("subscription_prefix")) return oxorany("Tempo restante da assinatura: ");

        // Configurações gerais
        if (key == oxorany("Streamproof")) return oxorany("Ocultar da transmissão");
        if (key == oxorany("Language")) return oxorany("Idioma");
        if (key == oxorany("English")) return oxorany("Inglês");
        if (key == oxorany("Portuguese")) return oxorany("Português");
        if (key == oxorany("Vietnamese")) return oxorany("Vietnamita");
        if (key == oxorany("Spanish")) return oxorany("Espanhol");
        if (key == oxorany("Save Changes")) return oxorany("Salvar Mudanças");
        if (key == oxorany("Menu Transparency")) return oxorany("Transparência do Menu");
        if (key == oxorany("Restore Defaults")) return oxorany("Restaurar Padrões");

        if (key == oxorany("Force 120 FPS")) return oxorany("Forçar 120 FPS");
        if (key == oxorany("Reset Guest")) return oxorany("Resetar Convidado");
        if (key == oxorany("No Recoil")) return oxorany("Sem Recuo");
        if (key == oxorany("Fast Weapon Swap")) return oxorany("Troca rápida de arma");
        if (key == oxorany("Fast Reload")) return oxorany("Recarregar Rápido");
        if (key == oxorany("Use with caution")) return oxorany("Use com cautela");

        if (key == oxorany("Purple")) return oxorany("Roxo");
        if (key == oxorany("Red")) return oxorany("Vermelho");
        if (key == oxorany("Cyan")) return oxorany("Ciano");
        if (key == oxorany("Dark Blue")) return oxorany("Azul escuro");
        if (key == oxorany("Yellow")) return oxorany("Amarelo");
        if (key == oxorany("Green")) return oxorany("Verde");
        if (key == oxorany("Orange")) return oxorany("Laranja");
        if (key == oxorany("Pink")) return oxorany("Rosa");
        if (key == oxorany("Teal")) return oxorany("Azul petróleo");
        if (key == oxorany("Indigo")) return oxorany("Índigo");
        if (key == oxorany("Lime")) return oxorany("Limão");
        if (key == oxorany("Brown")) return oxorany("Marrom");
        if (key == oxorany("Sky Blue")) return oxorany("Azul céu");
        if (key == oxorany("Rose")) return oxorany("Rosa claro");
        if (key == oxorany("Lavender")) return oxorany("Lavanda");
        if (key == oxorany("Mint")) return oxorany("Menta");
        if (key == oxorany("Coral")) return oxorany("Coral");
        if (key == oxorany("Turquoise")) return oxorany("Turquesa");
        if (key == oxorany("Gold")) return oxorany("Dourado");
        if (key == oxorany("Silver")) return oxorany("Prateado");
        if (key == oxorany("Neon Green")) return oxorany("Verde neon");
        if (key == oxorany("Neon Pink")) return oxorany("Rosa neon");
        if (key == oxorany("Deep Purple")) return oxorany("Roxo escuro");
        if (key == oxorany("Crimson")) return oxorany("Carmesim");
        if (key == oxorany("Electric Blue")) return oxorany("Azul elétrico");
        if (key == oxorany("Sunset Orange")) return oxorany("Laranja pôr do sol");  
        if (key == oxorany("Theme Color")) return oxorany("Cor do Tema");        

        // ESP
        if (key == oxorany("ESP Boxes")) return oxorany("ESP Caixas");
        if (key == oxorany("ESP Lines")) return oxorany("ESP Linhas");
        if (key == oxorany("ESP Name")) return oxorany("ESP Nome");
        if (key == oxorany("ESP Distance")) return oxorany("ESP Distância");
        if (key == oxorany("ESP Health")) return oxorany("ESP Vida");
        if (key == oxorany("ESP Skeleton")) return oxorany("ESP Esqueleto");
        if (key == oxorany("ESP Enable")) return oxorany("Ativar ESP");

        // AIMBOT
        if (key == oxorany("Aimbot")) return oxorany("Aimbot");
        if (key == oxorany("Show FOV Circle")) return oxorany("Mostrar círculo FOV");
        if (key == oxorany("Ignore Bots")) return oxorany("Ignorar bots");
        if (key == oxorany("Ignore Knocked")) return oxorany("Ignorar derrubados");
        if (key == oxorany("Only Visible")) return oxorany("Apenas visíveis");
        if (key == oxorany("Limit Aim to FOV")) return oxorany("Limitar Mira ao FOV");
    
        if (key == oxorany("Aim Mode")) return oxorany("Modo de Mira");
        if (key == oxorany("Closest to Player")) return oxorany("Mais próximo do jogador");
        if (key == oxorany("Closest to Crosshair")) return oxorany("Mais próximo da mira");
    
        if (key == oxorany("Target Bone")) return oxorany("Alvo");
        if (key == oxorany("Head")) return oxorany("Cabeça");
        if (key == oxorany("Neck")) return oxorany("Pescoço");
        if (key == oxorany("Chest")) return oxorany("Peito");
    
        if (key == oxorany("Aim Trigger")) return oxorany("Gatilho de Mira");
        if (key == oxorany("Always")) return oxorany("Sempre");
        if (key == oxorany("Only When Shooting")) return oxorany("Apenas ao atirar");
        if (key == oxorany("Only When Aiming")) return oxorany("Apenas ao mirar");
    
        if (key == oxorany("FOV")) return oxorany("FOV");
        if (key == oxorany("Max Distance")) return oxorany("Distância máxima");
        if (key == oxorany("Aim Speed")) return oxorany("Velocidade da Mira");

        // HEADER
        if (key == oxorany("AIMBOT")) return oxorany("AIMBOT");
        if (key == oxorany("VISUALS")) return oxorany("VISUAIS");
        if (key == oxorany("WEAPON")) return oxorany("ARMA");
        if (key == oxorany("MISC")) return oxorany("MISC");
        if (key == oxorany("SETTINGS")) return oxorany("AJUSTES");
        if (key == oxorany("ACCOUNT")) return oxorany("CONTA");
        if (key == oxorany("VERSION")) return oxorany("VERSÃO");
        
        if (key == oxorany("Automatically target enemies.")) return oxorany("Mire automaticamente nos inimigos.");
        if (key == oxorany("See where the enemies are.")) return oxorany("Veja onde estão os inimigos.");
        if (key == oxorany("Weapon features and behavior.")) return oxorany("Recursos e comportamento das armas.");
        if (key == oxorany("Extra features for gameplay.")) return oxorany("Recursos extras para o jogo.");
        if (key == oxorany("Configure interface preferences.")) return oxorany("Configure preferências da interface.");
        if (key == oxorany("Information about your account.")) return oxorany("Informações sobre sua conta.");
        if (key == oxorany("Build and release information.")) return oxorany("Informações da versão e compilação.");        
        
        // SIDEBAR
        if (key == oxorany("Aimbot")) return oxorany("Aimbot");
        if (key == oxorany("Visuals")) return oxorany("Visuais");
        if (key == oxorany("Weapon")) return oxorany("Arma");
        if (key == oxorany("Misc")) return oxorany("Misc");
        if (key == oxorany("Settings")) return oxorany("Ajustes");
        if (key == oxorany("Account")) return oxorany("Conta");
        if (key == oxorany("Version")) return oxorany("Versão");
    } else if (currentLanguage == AppLanguageEnglish) {
        // English (default)
        if (key == oxorany("trial_text_1")) return oxorany("This is a trial version intended solely for testing and feedback purposes.");
        if (key == oxorany("trial_text_2")) return oxorany("Features, stability, and performance may change in the final release. Your participation helps us improve the final product.");
        if (key == oxorany("build_prefix")) return oxorany("Build at: ");
        if (key == oxorany("build_suffix")) return oxorany(" for game version ");
        if (key == oxorany("trial")) return oxorany("TRIAL");

        if (key == oxorany("highlight_trial")) return oxorany("trial version");
        if (key == oxorany("highlight_testing")) return oxorany("testing");
        if (key == oxorany("highlight_feedback")) return oxorany("feedback");
        if (key == oxorany("highlight_release")) return oxorany("final release");
        if (key == oxorany("highlight_improve")) return oxorany("improve");

        if (key == oxorany("day")) return oxorany("day");
        if (key == oxorany("days")) return oxorany("days");
        if (key == oxorany("hour")) return oxorany("hour");
        if (key == oxorany("hours")) return oxorany("hours");
        if (key == oxorany("minute")) return oxorany("minute");
        if (key == oxorany("minutes")) return oxorany("minutes");
        if (key == oxorany("second")) return oxorany("second");
        if (key == oxorany("seconds")) return oxorany("seconds");
        if (key == oxorany("subscription_prefix")) return oxorany("Subscription time left: ");

        // Configs
        if (key == oxorany("Streamproof")) return oxorany("Streamproof");
        if (key == oxorany("Language")) return oxorany("Language");
        if (key == oxorany("English")) return oxorany("English");
        if (key == oxorany("Portuguese")) return oxorany("Portuguese");
        if (key == oxorany("Vietnamese")) return oxorany("Vietnamese");
        if (key == oxorany("Spanish")) return oxorany("Spanish");
        if (key == oxorany("Save Changes")) return oxorany("Save Changes");
        if (key == oxorany("Menu Transparency")) return oxorany("Menu Transparency");
        if (key == oxorany("Restore Defaults")) return oxorany("Restore Defaults");

        if (key == oxorany("Force 120 FPS")) return oxorany("Force 120 FPS");
        if (key == oxorany("Reset Guest")) return oxorany("Reset Guest");
        if (key == oxorany("No Recoil")) return oxorany("No Recoil");
        if (key == oxorany("Fast Weapon Swap")) return oxorany("Fast Weapon Swap");
        if (key == oxorany("Fast Reload")) return oxorany("Fast Reload");
        if (key == oxorany("Use with caution")) return oxorany("Use with caution");

        if (key == oxorany("Purple")) return oxorany("Purple");
        if (key == oxorany("Red")) return oxorany("Red");
        if (key == oxorany("Cyan")) return oxorany("Cyan");
        if (key == oxorany("Dark Blue")) return oxorany("Dark Blue");
        if (key == oxorany("Yellow")) return oxorany("Yellow");
        if (key == oxorany("Green")) return oxorany("Green");
        if (key == oxorany("Orange")) return oxorany("Orange");
        if (key == oxorany("Pink")) return oxorany("Pink");
        if (key == oxorany("Teal")) return oxorany("Teal");
        if (key == oxorany("Indigo")) return oxorany("Indigo");
        if (key == oxorany("Lime")) return oxorany("Lime");
        if (key == oxorany("Brown")) return oxorany("Brown");      
        if (key == oxorany("Sky Blue")) return oxorany("Sky Blue");
        if (key == oxorany("Rose")) return oxorany("Rose");
        if (key == oxorany("Lavender")) return oxorany("Lavender");
        if (key == oxorany("Mint")) return oxorany("Mint");
        if (key == oxorany("Coral")) return oxorany("Coral");
        if (key == oxorany("Turquoise")) return oxorany("Turquoise");
        if (key == oxorany("Gold")) return oxorany("Gold");
        if (key == oxorany("Silver")) return oxorany("Silver");
        if (key == oxorany("Neon Green")) return oxorany("Neon Green");
        if (key == oxorany("Neon Pink")) return oxorany("Neon Pink");
        if (key == oxorany("Deep Purple")) return oxorany("Deep Purple");
        if (key == oxorany("Crimson")) return oxorany("Crimson");
        if (key == oxorany("Electric Blue")) return oxorany("Electric Blue");
        if (key == oxorany("Sunset Orange")) return oxorany("Sunset Orange");  
        if (key == oxorany("Theme Color")) return oxorany("Theme Color");        

        // ESP
        if (key == oxorany("ESP Boxes")) return oxorany("ESP Boxes");
        if (key == oxorany("ESP Lines")) return oxorany("ESP Lines");
        if (key == oxorany("ESP Name")) return oxorany("ESP Name");
        if (key == oxorany("ESP Distance")) return oxorany("ESP Distance");
        if (key == oxorany("ESP Health")) return oxorany("ESP Health");
        if (key == oxorany("ESP Skeleton")) return oxorany("ESP Skeleton");
        if (key == oxorany("ESP Enable")) return oxorany("ESP Enable");

        // AIMBOT
        if (key == oxorany("Aimbot")) return oxorany("Aimbot");
        if (key == oxorany("Show FOV Circle")) return oxorany("Show FOV Circle");
        if (key == oxorany("Ignore Bots")) return oxorany("Ignore Bots");
        if (key == oxorany("Ignore Knocked")) return oxorany("Ignore Knocked");
        if (key == oxorany("Only Visible")) return oxorany("Only Visible");
        if (key == oxorany("Limit Aim to FOV")) return oxorany("Limit Aim to FOV");
    
        if (key == oxorany("Aim Mode")) return oxorany("Aim Mode");
        if (key == oxorany("Closest to Player")) return oxorany("Closest to Player");
        if (key == oxorany("Closest to Crosshair")) return oxorany("Closest to Crosshair");
    
        if (key == oxorany("Target Bone")) return oxorany("Target Bone");
        if (key == oxorany("Head")) return oxorany("Head");
        if (key == oxorany("Neck")) return oxorany("Neck");
        if (key == oxorany("Chest")) return oxorany("Chest");
    
        if (key == oxorany("Aim Trigger")) return oxorany("Aim Trigger");
        if (key == oxorany("Always")) return oxorany("Always");
        if (key == oxorany("Only When Shooting")) return oxorany("Only When Shooting");
        if (key == oxorany("Only When Aiming")) return oxorany("Only When Aiming");
    
        if (key == oxorany("FOV")) return oxorany("FOV");
        if (key == oxorany("Max Distance")) return oxorany("Max Distance");
        if (key == oxorany("Aim Speed")) return oxorany("Aim Speed");

        // HEADER
        if (key == oxorany("AIMBOT")) return oxorany("AIMBOT");
        if (key == oxorany("VISUALS")) return oxorany("VISUALS");
        if (key == oxorany("WEAPON")) return oxorany("WEAPON");
        if (key == oxorany("MISC")) return oxorany("MISC");
        if (key == oxorany("SETTINGS")) return oxorany("SETTINGS");
        if (key == oxorany("ACCOUNT")) return oxorany("ACCOUNT");
        if (key == oxorany("VERSION")) return oxorany("VERSION");
        
        if (key == oxorany("Automatically target enemies.")) return oxorany("Automatically target enemies.");
        if (key == oxorany("See where the enemies are.")) return oxorany("See where the enemies are.");
        if (key == oxorany("Weapon features and behavior.")) return oxorany("Weapon features and behavior.");
        if (key == oxorany("Extra features for gameplay.")) return oxorany("Extra features for gameplay.");
        if (key == oxorany("Configure interface preferences.")) return oxorany("Configure interface preferences.");
        if (key == oxorany("Information about your account.")) return oxorany("Information about your account.");
        if (key == oxorany("Build and release information.")) return oxorany("Build and release information.");

        // SIDEBAR
        if (key == oxorany("Aimbot")) return oxorany("Aimbot");
        if (key == oxorany("Visuals")) return oxorany("Visuals");
        if (key == oxorany("Weapon")) return oxorany("Weapon");
        if (key == oxorany("Misc")) return oxorany("Misc");
        if (key == oxorany("Settings")) return oxorany("Settings");
        if (key == oxorany("Account")) return oxorany("Account");
        if (key == oxorany("Version")) return oxorany("Version");    
        
    } else if (currentLanguage == AppLanguageVietnamese) {
        if (key == oxorany("trial_text_1")) return oxorany("Đây là phiên bản dùng thử chỉ dành cho mục đích thử nghiệm và phản hồi.");
        if (key == oxorany("trial_text_2")) return oxorany("Tính năng, độ ổn định và hiệu suất có thể thay đổi trong bản phát hành cuối cùng. Sự tham gia của bạn giúp cải thiện sản phẩm cuối.");
        if (key == oxorany("build_prefix")) return oxorany("Biên dịch lúc: ");
        if (key == oxorany("build_suffix")) return oxorany(" cho phiên bản trò chơi ");
        if (key == oxorany("trial")) return oxorany("DÙNG THỬ");

        if (key == oxorany("highlight_trial")) return oxorany("phiên bản dùng thử");
        if (key == oxorany("highlight_testing")) return oxorany("thử nghiệm");
        if (key == oxorany("highlight_feedback")) return oxorany("phản hồi");
        if (key == oxorany("highlight_release")) return oxorany("phiên bản cuối");
        if (key == oxorany("highlight_improve")) return oxorany("cải thiện");

        if (key == oxorany("day")) return oxorany("ngày");
        if (key == oxorany("days")) return oxorany("ngày");
        if (key == oxorany("hour")) return oxorany("giờ");
        if (key == oxorany("hours")) return oxorany("giờ");
        if (key == oxorany("minute")) return oxorany("phút");
        if (key == oxorany("minutes")) return oxorany("phút");
        if (key == oxorany("second")) return oxorany("giây");
        if (key == oxorany("seconds")) return oxorany("giây");
        if (key == oxorany("subscription_prefix")) return oxorany("Thời gian còn lại của gói: ");

        // Configs
        if (key == oxorany("Streamproof")) return oxorany("Ẩn khỏi truyền phát");
        if (key == oxorany("Language")) return oxorany("Ngôn ngữ");
        if (key == oxorany("English")) return oxorany("Tiếng Anh");
        if (key == oxorany("Portuguese")) return oxorany("Tiếng Bồ Đào Nha");
        if (key == oxorany("Vietnamese")) return oxorany("Tiếng Việt");
        if (key == oxorany("Spanish")) return oxorany("Tiếng Tây Ban Nha");
        if (key == oxorany("Save Changes")) return oxorany("Lưu thay đổi");
        if (key == oxorany("Menu Transparency")) return oxorany("Độ trong suốt của Menu");
        if (key == oxorany("Restore Defaults")) return oxorany("Khôi phục mặc định");

        if (key == oxorany("Force 120 FPS")) return oxorany("Ép 120 FPS");
        if (key == oxorany("Reset Guest")) return oxorany("Đặt lại tài khoản khách");
        if (key == oxorany("No Recoil")) return oxorany("Không giật");
        if (key == oxorany("Fast Weapon Swap")) return oxorany("Đổi vũ khí nhanh");
        if (key == oxorany("Fast Reload")) return oxorany("Tải đạn nhanh");
        if (key == oxorany("Use with caution")) return oxorany("Sử dụng cẩn thận");

        if (key == oxorany("Purple")) return oxorany("Tím");
        if (key == oxorany("Red")) return oxorany("Đỏ");
        if (key == oxorany("Cyan")) return oxorany("Xanh lơ");
        if (key == oxorany("Dark Blue")) return oxorany("Xanh đậm");
        if (key == oxorany("Yellow")) return oxorany("Vàng");
        if (key == oxorany("Green")) return oxorany("Xanh lá");
        if (key == oxorany("Orange")) return oxorany("Cam");
        if (key == oxorany("Pink")) return oxorany("Hồng");
        if (key == oxorany("Teal")) return oxorany("Xanh lam");
        if (key == oxorany("Indigo")) return oxorany("Chàm");
        if (key == oxorany("Lime")) return oxorany("Xanh chanh");
        if (key == oxorany("Brown")) return oxorany("Nâu");
        if (key == oxorany("Sky Blue")) return oxorany("Xanh da trời");
        if (key == oxorany("Rose")) return oxorany("Hồng nhạt");
        if (key == oxorany("Lavender")) return oxorany("Tím oải hương");
        if (key == oxorany("Mint")) return oxorany("Xanh bạc hà");
        if (key == oxorany("Coral")) return oxorany("San hô");
        if (key == oxorany("Turquoise")) return oxorany("Ngọc lam");
        if (key == oxorany("Gold")) return oxorany("Vàng kim");
        if (key == oxorany("Silver")) return oxorany("Bạc");
        if (key == oxorany("Neon Green")) return oxorany("Xanh neon");
        if (key == oxorany("Neon Pink")) return oxorany("Hồng neon");
        if (key == oxorany("Deep Purple")) return oxorany("Tím đậm");
        if (key == oxorany("Crimson")) return oxorany("Đỏ tươi");
        if (key == oxorany("Electric Blue")) return oxorany("Xanh điện");
        if (key == oxorany("Sunset Orange")) return oxorany("Cam hoàng hôn");
        if (key == oxorany("Theme Color")) return oxorany("Màu chủ đề");

        // ESP
        if (key == oxorany("ESP Boxes")) return oxorany("Hộp ESP");
        if (key == oxorany("ESP Lines")) return oxorany("Đường ESP");
        if (key == oxorany("ESP Name")) return oxorany("Tên ESP");
        if (key == oxorany("ESP Distance")) return oxorany("Khoảng cách ESP");
        if (key == oxorany("ESP Health")) return oxorany("Máu ESP");
        if (key == oxorany("ESP Skeleton")) return oxorany("Khung xương ESP");
        if (key == oxorany("ESP Enable")) return oxorany("Bật ESP");

        // AIMBOT
        if (key == oxorany("Aimbot")) return oxorany("Aimbot");
        if (key == oxorany("Show FOV Circle")) return oxorany("Hiển thị vòng FOV");
        if (key == oxorany("Ignore Bots")) return oxorany("Bỏ qua bot");
        if (key == oxorany("Ignore Knocked")) return oxorany("Bỏ qua bị hạ gục");
        if (key == oxorany("Only Visible")) return oxorany("Chỉ kẻ địch nhìn thấy");
        if (key == oxorany("Limit Aim to FOV")) return oxorany("Giới hạn tầm ngắm FOV");

        if (key == oxorany("Aim Mode")) return oxorany("Chế độ ngắm");
        if (key == oxorany("Closest to Player")) return oxorany("Gần người chơi nhất");
        if (key == oxorany("Closest to Crosshair")) return oxorany("Gần tâm ngắm nhất");

        if (key == oxorany("Target Bone")) return oxorany("Bộ phận ngắm");
        if (key == oxorany("Head")) return oxorany("Đầu");
        if (key == oxorany("Neck")) return oxorany("Cổ");
        if (key == oxorany("Chest")) return oxorany("Ngực");

        if (key == oxorany("Aim Trigger")) return oxorany("Điều kiện ngắm");
        if (key == oxorany("Always")) return oxorany("Luôn luôn");
        if (key == oxorany("Only When Shooting")) return oxorany("Chỉ khi bắn");
        if (key == oxorany("Only When Aiming")) return oxorany("Chỉ khi ngắm");

        if (key == oxorany("FOV")) return oxorany("FOV");
        if (key == oxorany("Max Distance")) return oxorany("Khoảng cách tối đa");
        if (key == oxorany("Aim Speed")) return oxorany("Tốc độ ngắm");

        // HEADER
        if (key == oxorany("AIMBOT")) return oxorany("AIMBOT");
        if (key == oxorany("VISUALS")) return oxorany("HÌNH ẢNH");
        if (key == oxorany("WEAPON")) return oxorany("VŨ KHÍ");
        if (key == oxorany("MISC")) return oxorany("KHÁC");
        if (key == oxorany("SETTINGS")) return oxorany("CÀI ĐẶT");
        if (key == oxorany("ACCOUNT")) return oxorany("TÀI KHOẢN");
        if (key == oxorany("VERSION")) return oxorany("PHIÊN BẢN");

        if (key == oxorany("Automatically target enemies.")) return oxorany("Tự động nhắm kẻ địch.");
        if (key == oxorany("See where the enemies are.")) return oxorany("Xem vị trí kẻ địch.");
        if (key == oxorany("Weapon features and behavior.")) return oxorany("Tính năng và hành vi vũ khí.");
        if (key == oxorany("Extra features for gameplay.")) return oxorany("Tính năng phụ trợ trong game.");
        if (key == oxorany("Configure interface preferences.")) return oxorany("Tùy chỉnh giao diện.");
        if (key == oxorany("Information about your account.")) return oxorany("Thông tin tài khoản của bạn.");
        if (key == oxorany("Build and release information.")) return oxorany("Thông tin biên dịch và phát hành.");

        // SIDEBAR
        if (key == oxorany("Visuals")) return oxorany("Hình ảnh");
        if (key == oxorany("Weapon")) return oxorany("Vũ khí");
        if (key == oxorany("Misc")) return oxorany("Khác");
        if (key == oxorany("Settings")) return oxorany("Cài đặt");
        if (key == oxorany("Account")) return oxorany("Tài khoản");
        if (key == oxorany("Version")) return oxorany("Phiên bản");

    }
    else if (currentLanguage == AppLanguageSpanish) {
        if (key == oxorany("trial_text_1")) return oxorany("Esta es una versión de prueba destinada únicamente a pruebas y comentarios.");
        if (key == oxorany("trial_text_2")) return oxorany("Las funciones, estabilidad y rendimiento pueden cambiar en la versión final. Tu participación ayuda a mejorar el producto final.");
        if (key == oxorany("build_prefix")) return oxorany("Compilado en: ");
        if (key == oxorany("build_suffix")) return oxorany(" para la versión del juego ");
        if (key == oxorany("trial")) return oxorany("PRUEBA");
    
        if (key == oxorany("highlight_trial")) return oxorany("versión de prueba");
        if (key == oxorany("highlight_testing")) return oxorany("pruebas");
        if (key == oxorany("highlight_feedback")) return oxorany("comentarios");
        if (key == oxorany("highlight_release")) return oxorany("versión final");
        if (key == oxorany("highlight_improve")) return oxorany("mejorar");
    
        if (key == oxorany("day")) return oxorany("día");
        if (key == oxorany("days")) return oxorany("días");
        if (key == oxorany("hour")) return oxorany("hora");
        if (key == oxorany("hours")) return oxorany("horas");
        if (key == oxorany("minute")) return oxorany("minuto");
        if (key == oxorany("minutes")) return oxorany("minutos");
        if (key == oxorany("second")) return oxorany("segundo");
        if (key == oxorany("seconds")) return oxorany("segundos");
        if (key == oxorany("subscription_prefix")) return oxorany("Tiempo restante de la suscripción: ");
    
        // Configs
        if (key == oxorany("Streamproof")) return oxorany("Ocultar en transmisión");
        if (key == oxorany("Language")) return oxorany("Idioma");
        if (key == oxorany("English")) return oxorany("Inglés");
        if (key == oxorany("Portuguese")) return oxorany("Portugués");
        if (key == oxorany("Vietnamese")) return oxorany("Vietnamita");
        if (key == oxorany("Spanish")) return oxorany("Español");
        if (key == oxorany("Save Changes")) return oxorany("Guardar cambios");
        if (key == oxorany("Menu Transparency")) return oxorany("Transparencia del menú");
        if (key == oxorany("Restore Defaults")) return oxorany("Restablecer valores");
    
        if (key == oxorany("Force 120 FPS")) return oxorany("Forzar 120 FPS");
        if (key == oxorany("Reset Guest")) return oxorany("Restablecer invitado");
        if (key == oxorany("No Recoil")) return oxorany("Sin retroceso");
        if (key == oxorany("Fast Weapon Swap")) return oxorany("Cambio rápido de arma");
        if (key == oxorany("Fast Reload")) return oxorany("Recarga rápida");
        if (key == oxorany("Use with caution")) return oxorany("Usar con precaución");
    
        if (key == oxorany("Purple")) return oxorany("Morado");
        if (key == oxorany("Red")) return oxorany("Rojo");
        if (key == oxorany("Cyan")) return oxorany("Cian");
        if (key == oxorany("Dark Blue")) return oxorany("Azul oscuro");
        if (key == oxorany("Yellow")) return oxorany("Amarillo");
        if (key == oxorany("Green")) return oxorany("Verde");
        if (key == oxorany("Orange")) return oxorany("Naranja");
        if (key == oxorany("Pink")) return oxorany("Rosa");
        if (key == oxorany("Teal")) return oxorany("Verde azulado");
        if (key == oxorany("Indigo")) return oxorany("Índigo");
        if (key == oxorany("Lime")) return oxorany("Lima");
        if (key == oxorany("Brown")) return oxorany("Marrón");
        if (key == oxorany("Sky Blue")) return oxorany("Celeste");
        if (key == oxorany("Rose")) return oxorany("Rosa claro");
        if (key == oxorany("Lavender")) return oxorany("Lavanda");
        if (key == oxorany("Mint")) return oxorany("Menta");
        if (key == oxorany("Coral")) return oxorany("Coral");
        if (key == oxorany("Turquoise")) return oxorany("Turquesa");
        if (key == oxorany("Gold")) return oxorany("Dorado");
        if (key == oxorany("Silver")) return oxorany("Plateado");
        if (key == oxorany("Neon Green")) return oxorany("Verde neón");
        if (key == oxorany("Neon Pink")) return oxorany("Rosa neón");
        if (key == oxorany("Deep Purple")) return oxorany("Morado oscuro");
        if (key == oxorany("Crimson")) return oxorany("Carmesí");
        if (key == oxorany("Electric Blue")) return oxorany("Azul eléctrico");
        if (key == oxorany("Sunset Orange")) return oxorany("Naranja atardecer");
        if (key == oxorany("Theme Color")) return oxorany("Color del tema");
    
        // ESP
        if (key == oxorany("ESP Boxes")) return oxorany("Cajas ESP");
        if (key == oxorany("ESP Lines")) return oxorany("Líneas ESP");
        if (key == oxorany("ESP Name")) return oxorany("Nombre ESP");
        if (key == oxorany("ESP Distance")) return oxorany("Distancia ESP");
        if (key == oxorany("ESP Health")) return oxorany("Salud ESP");
        if (key == oxorany("ESP Skeleton")) return oxorany("Esqueleto ESP");
        if (key == oxorany("ESP Enable")) return oxorany("Activar ESP");
    
        // AIMBOT
        if (key == oxorany("Aimbot")) return oxorany("Aimbot");
        if (key == oxorany("Show FOV Circle")) return oxorany("Mostrar círculo FOV");
        if (key == oxorany("Ignore Bots")) return oxorany("Ignorar bots");
        if (key == oxorany("Ignore Knocked")) return oxorany("Ignorar derribados");
        if (key == oxorany("Only Visible")) return oxorany("Solo visibles");
        if (key == oxorany("Limit Aim to FOV")) return oxorany("Limitar puntería a FOV");
    
        if (key == oxorany("Aim Mode")) return oxorany("Modo de puntería");
        if (key == oxorany("Closest to Player")) return oxorany("Más cercano al jugador");
        if (key == oxorany("Closest to Crosshair")) return oxorany("Más cercano a la mira");
    
        if (key == oxorany("Target Bone")) return oxorany("Parte del cuerpo");
        if (key == oxorany("Head")) return oxorany("Cabeza");
        if (key == oxorany("Neck")) return oxorany("Cuello");
        if (key == oxorany("Chest")) return oxorany("Pecho");
    
        if (key == oxorany("Aim Trigger")) return oxorany("Activación de puntería");
        if (key == oxorany("Always")) return oxorany("Siempre");
        if (key == oxorany("Only When Shooting")) return oxorany("Solo al disparar");
        if (key == oxorany("Only When Aiming")) return oxorany("Solo al apuntar");
    
        if (key == oxorany("FOV")) return oxorany("FOV");
        if (key == oxorany("Max Distance")) return oxorany("Distancia máxima");
        if (key == oxorany("Aim Speed")) return oxorany("Velocidad de puntería");
    
        // HEADER
        if (key == oxorany("AIMBOT")) return oxorany("AIMBOT");
        if (key == oxorany("VISUALS")) return oxorany("VISUALES");
        if (key == oxorany("WEAPON")) return oxorany("ARMA");
        if (key == oxorany("MISC")) return oxorany("VARIOS");
        if (key == oxorany("SETTINGS")) return oxorany("AJUSTES");
        if (key == oxorany("ACCOUNT")) return oxorany("CUENTA");
        if (key == oxorany("VERSION")) return oxorany("VERSIÓN");
    
        if (key == oxorany("Automatically target enemies.")) return oxorany("Apunta automáticamente a los enemigos.");
        if (key == oxorany("See where the enemies are.")) return oxorany("Mira dónde están los enemigos.");
        if (key == oxorany("Weapon features and behavior.")) return oxorany("Características y comportamiento del arma.");
        if (key == oxorany("Extra features for gameplay.")) return oxorany("Funciones adicionales para el juego.");
        if (key == oxorany("Configure interface preferences.")) return oxorany("Configura tus preferencias de interfaz.");
        if (key == oxorany("Information about your account.")) return oxorany("Información sobre tu cuenta.");
        if (key == oxorany("Build and release information.")) return oxorany("Información de compilación y lanzamiento.");
    
        // SIDEBAR
        if (key == oxorany("Aimbot")) return oxorany("Aimbot");
        if (key == oxorany("Visuals")) return oxorany("Visuales");
        if (key == oxorany("Weapon")) return oxorany("Arma");
        if (key == oxorany("Misc")) return oxorany("Varios");
        if (key == oxorany("Settings")) return oxorany("Ajustes");
        if (key == oxorany("Account")) return oxorany("Cuenta");
        if (key == oxorany("Version")) return oxorany("Versión");
    }        
    
    return key;
}
