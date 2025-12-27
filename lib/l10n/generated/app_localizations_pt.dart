// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Vocabulário preparatório para o TOEFL';

  @override
  String get todayWord => 'Palavra do dia';

  @override
  String get learning => 'Aprendizado';

  @override
  String get levelLearning => 'Aprendizagem por Nível de Pontuação';

  @override
  String get allWords => 'Todas as palavras';

  @override
  String get viewAllWords => 'Ver todo o vocabulário';

  @override
  String get favorites => 'Favoritos';

  @override
  String get savedWords => 'Palavras salvas';

  @override
  String get flashcard => 'Cartão de memorização';

  @override
  String get cardLearning => 'Aprendizado com cartões';

  @override
  String get quiz => 'Questionário';

  @override
  String get testYourself => 'Faça o teste você mesmo';

  @override
  String get settings => 'Configurações';

  @override
  String get language => 'Linguagem';

  @override
  String get displayLanguage => 'Idioma de exibição';

  @override
  String get selectLanguage => 'Selecione o idioma';

  @override
  String get display => 'Mostrar';

  @override
  String get darkMode => 'Modo escuro';

  @override
  String get fontSize => 'Tamanho da fonte';

  @override
  String get notifications => 'Notificações';

  @override
  String get dailyReminder => 'Lembrete diário';

  @override
  String get dailyReminderDesc =>
      'Receba um lembrete para estudar todos os dias.';

  @override
  String get removeAds => 'Remover anúncios';

  @override
  String get adsRemoved => 'Anúncios removidos';

  @override
  String get thankYou => 'Obrigado pelo seu apoio!';

  @override
  String get buy => 'Comprar';

  @override
  String get restorePurchase => 'Restaurar compra';

  @override
  String get restoring => 'Restaurando...';

  @override
  String get purchaseSuccess => 'Compra realizada com sucesso!';

  @override
  String get loading => 'Carregando...';

  @override
  String get notAvailable => 'Não disponível';

  @override
  String get info => 'Informações';

  @override
  String get version => 'Versão';

  @override
  String get disclaimer => 'Isenção de responsabilidade';

  @override
  String get disclaimerText =>
      'Este aplicativo é uma ferramenta independente de preparação para o TOEFL e não é afiliado, endossado ou aprovado pelo ETS (Educational Testing Service).';

  @override
  String get privacyPolicy => 'política de Privacidade';

  @override
  String get cannotLoadWords => 'Não foi possível carregar as palavras';

  @override
  String get noFavoritesYet => 'Ainda não tenho favoritos.';

  @override
  String get tapHeartToSave =>
      'Toque no ícone de coração para salvar as palavras.';

  @override
  String get addedToFavorites => 'Adicionado aos favoritos';

  @override
  String get removedFromFavorites => 'Removido dos favoritos';

  @override
  String get wordDetail => 'Detalhes da palavra';

  @override
  String get definition => 'Definição';

  @override
  String get example => 'Exemplo';

  @override
  String levelWords(String level) {
    return '$level palavras';
  }

  @override
  String get beginner => 'Iniciante (0-60)';

  @override
  String get beginnerDesc => 'Vocabulário básico - 800 palavras';

  @override
  String get intermediate => 'Intermediário (60-80)';

  @override
  String get intermediateDesc => 'Vocabulário acadêmico - 1.200 palavras';

  @override
  String get advanced => 'Avançado (80-100)';

  @override
  String get advancedDesc => 'Expressões avançadas - 1.000 palavras';

  @override
  String get expert => 'Especialista (100+)';

  @override
  String get expertDesc => 'Vocabulário especializado - 600 palavras';

  @override
  String get alphabetical => 'Alfabético';

  @override
  String get random => 'Aleatório';

  @override
  String get tapToFlip => 'Toque para virar';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Próximo';

  @override
  String get question => 'Pergunta';

  @override
  String get score => 'Pontuação';

  @override
  String get quizComplete => 'Teste concluído!';

  @override
  String get finish => 'Terminar';

  @override
  String get tryAgain => 'Tente novamente';

  @override
  String get showResult => 'Mostrar resultado';

  @override
  String get wordToMeaning => 'Palavra → Significado';

  @override
  String get meaningToWord => 'Significado → Palavra';

  @override
  String get excellent => 'Excelente! Nota máxima!';

  @override
  String get great => 'Excelente trabalho! Continue assim!';

  @override
  String get good => 'Bom trabalho! Continue praticando!';

  @override
  String get keepPracticing => 'Continue praticando! Você vai melhorar!';

  @override
  String get privacyPolicyContent =>
      'Este aplicativo não coleta, armazena ou compartilha nenhuma informação pessoal.\n\nSeu progresso de aprendizado e seus favoritos são armazenados apenas no seu dispositivo.\n\nNenhum dado é transmitido para servidores externos.';

  @override
  String get restorePurchaseDesc =>
      'Se você já comprou a remoção de anúncios em outro dispositivo ou após reinstalar o aplicativo, toque aqui para restaurar sua compra.';

  @override
  String get restoreComplete => 'Restaurar completamente';

  @override
  String get noPurchaseFound => 'Nenhuma compra anterior encontrada';

  @override
  String get cancel => 'Cancelar';

  @override
  String get selectWordSource => 'Selecionar fonte de palavras';

  @override
  String get favoritesOnlyQuiz => 'Apenas favoritos';

  @override
  String get selectLevel => 'Selecionar nível';

  @override
  String get lockedContent => 'Conteúdo bloqueado';

  @override
  String get watchAdToUnlock =>
      'Assista a um vídeo curto para desbloquear todas as palavras até a meia-noite!';

  @override
  String get watchAd => 'Ver anúncio';

  @override
  String get adNotReady =>
      'O anúncio ainda não está pronto. Por favor, tente novamente.';

  @override
  String get unlockedUntilMidnight =>
      'Todas as palavras desbloqueadas até a meia-noite!';
}
