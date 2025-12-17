// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Vocabulaire de préparation au TOEFL';

  @override
  String get todayWord => 'Le mot du jour';

  @override
  String get learning => 'Apprentissage';

  @override
  String get levelLearning => 'Niveau d\'apprentissage du score';

  @override
  String get allWords => 'Tous les mots';

  @override
  String get viewAllWords => 'Afficher tout le vocabulaire';

  @override
  String get favorites => 'Favoris';

  @override
  String get savedWords => 'Mots enregistrés';

  @override
  String get flashcard => 'Flashcard';

  @override
  String get cardLearning => 'Apprentissage des cartes';

  @override
  String get quiz => 'Questionnaire';

  @override
  String get testYourself => 'Testez-vous';

  @override
  String get settings => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get displayLanguage => 'Langue d\'affichage';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get display => 'Afficher';

  @override
  String get darkMode => 'Mode sombre';

  @override
  String get fontSize => 'Taille de la police';

  @override
  String get notifications => 'Notifications';

  @override
  String get dailyReminder => 'Rappel quotidien';

  @override
  String get dailyReminderDesc => 'Pensez à vous rappeler d\'étudier tous les jours.';

  @override
  String get removeAds => 'Supprimer les publicités';

  @override
  String get adsRemoved => 'Publicités supprimées';

  @override
  String get thankYou => 'Merci pour votre soutien !';

  @override
  String get buy => 'Acheter';

  @override
  String get restorePurchase => 'Restaurer l\'achat';

  @override
  String get restoring => 'Restauration...';

  @override
  String get purchaseSuccess => 'Achat réussi !';

  @override
  String get loading => 'Chargement...';

  @override
  String get notAvailable => 'Pas disponible';

  @override
  String get info => 'Info';

  @override
  String get version => 'Version';

  @override
  String get disclaimer => 'Clause de non-responsabilité';

  @override
  String get disclaimerText => 'Cette application est un outil indépendant de préparation au TOEFL et n\'est ni affiliée à, ni approuvée par, ni validée par ETS (Educational Testing Service).';

  @override
  String get privacyPolicy => 'politique de confidentialité';

  @override
  String get cannotLoadWords => 'Impossible de charger les mots';

  @override
  String get noFavoritesYet => 'Pas encore de favoris';

  @override
  String get tapHeartToSave => 'Appuyez sur l\'icône en forme de cœur pour enregistrer des mots';

  @override
  String get addedToFavorites => 'Ajouté aux favoris';

  @override
  String get removedFromFavorites => 'Retiré des favoris';

  @override
  String get wordDetail => 'Détail du mot';

  @override
  String get definition => 'Définition';

  @override
  String get example => 'Exemple';

  @override
  String levelWords(String level) {
    return '$level mots';
  }

  @override
  String get beginner => 'Débutant (0-60)';

  @override
  String get beginnerDesc => 'Vocabulaire de base - 800 mots';

  @override
  String get intermediate => 'Intermédiaire (60-80)';

  @override
  String get intermediateDesc => 'Vocabulaire académique - 1 200 mots';

  @override
  String get advanced => 'Avancé (80-100)';

  @override
  String get advancedDesc => 'Expressions avancées - 1 000 mots';

  @override
  String get expert => 'Expert (100+)';

  @override
  String get expertDesc => 'Vocabulaire expert - 600 mots';

  @override
  String get alphabetical => 'Alphabétique';

  @override
  String get random => 'Aléatoire';

  @override
  String get tapToFlip => 'Appuyez pour retourner';

  @override
  String get previous => 'Précédent';

  @override
  String get next => 'Suivant';

  @override
  String get question => 'Question';

  @override
  String get score => 'Score';

  @override
  String get quizComplete => 'Quiz terminé !';

  @override
  String get finish => 'Terminer';

  @override
  String get tryAgain => 'Essayer à nouveau';

  @override
  String get showResult => 'Afficher le résultat';

  @override
  String get wordToMeaning => 'Mot → Signification';

  @override
  String get meaningToWord => 'Signification → Mot';

  @override
  String get excellent => 'Excellent ! Note parfaite !';

  @override
  String get great => 'Excellent travail ! Continuez comme ça !';

  @override
  String get good => 'Bon effort ! Continuez à vous entraîner !';

  @override
  String get keepPracticing => 'Continuez à vous entraîner ! Vous allez progresser !';

  @override
  String get privacyPolicyContent => 'Cette application ne collecte, ne stocke ni ne partage aucune information personnelle.\n\nVotre progression d\'apprentissage et vos favoris sont stockés uniquement sur votre appareil.\n\nAucune donnée n\'est transmise à des serveurs externes.';

  @override
  String get restorePurchaseDesc => 'Si vous avez déjà acheté la suppression des publicités sur un autre appareil ou après avoir réinstallé l\'application, appuyez ici pour restaurer votre achat.';

  @override
  String get restoreComplete => 'Restauration complète';

  @override
  String get noPurchaseFound => 'Aucun achat précédent trouvé';
}
