// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'TOEFL Prep Vocabulary';

  @override
  String get todayWord => 'Today\'s Word';

  @override
  String get learning => 'Learning';

  @override
  String get levelLearning => 'Score Level Learning';

  @override
  String get allWords => 'All Words';

  @override
  String get viewAllWords => 'View all vocabulary';

  @override
  String get favorites => 'Favorites';

  @override
  String get savedWords => 'Saved words';

  @override
  String get flashcard => 'Flashcard';

  @override
  String get cardLearning => 'Card learning';

  @override
  String get quiz => 'Quiz';

  @override
  String get testYourself => 'Test yourself';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get displayLanguage => 'Display Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get display => 'Display';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get fontSize => 'Font Size';

  @override
  String get notifications => 'Notifications';

  @override
  String get dailyReminder => 'Daily Reminder';

  @override
  String get dailyReminderDesc => 'Get reminded to study every day';

  @override
  String get removeAds => 'Remove Ads';

  @override
  String get adsRemoved => 'Ads Removed';

  @override
  String get thankYou => 'Thank you for your support!';

  @override
  String get buy => 'Buy';

  @override
  String get restorePurchase => 'Restore Purchase';

  @override
  String get restoring => 'Restoring...';

  @override
  String get purchaseSuccess => 'Purchase successful!';

  @override
  String get loading => 'Loading...';

  @override
  String get notAvailable => 'Not available';

  @override
  String get info => 'Info';

  @override
  String get version => 'Version';

  @override
  String get disclaimer => 'Disclaimer';

  @override
  String get disclaimerText => 'This app is an independent TOEFL preparation tool and is not affiliated with, endorsed by, or approved by ETS (Educational Testing Service).';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get cannotLoadWords => 'Cannot load words';

  @override
  String get noFavoritesYet => 'No favorites yet';

  @override
  String get tapHeartToSave => 'Tap the heart icon to save words';

  @override
  String get addedToFavorites => 'Added to favorites';

  @override
  String get removedFromFavorites => 'Removed from favorites';

  @override
  String get wordDetail => 'Word Detail';

  @override
  String get definition => 'Definition';

  @override
  String get example => 'Example';

  @override
  String levelWords(String level) {
    return '$level Words';
  }

  @override
  String get beginner => 'Beginner (0-60)';

  @override
  String get beginnerDesc => 'Basic vocabulary - 800 words';

  @override
  String get intermediate => 'Intermediate (60-80)';

  @override
  String get intermediateDesc => 'Academic vocabulary - 1,200 words';

  @override
  String get advanced => 'Advanced (80-100)';

  @override
  String get advancedDesc => 'Advanced expressions - 1,000 words';

  @override
  String get expert => 'Expert (100+)';

  @override
  String get expertDesc => 'Expert vocabulary - 600 words';

  @override
  String get alphabetical => 'Alphabetical';

  @override
  String get random => 'Random';

  @override
  String get tapToFlip => 'Tap to flip';

  @override
  String get previous => 'Previous';

  @override
  String get next => 'Next';

  @override
  String get question => 'Question';

  @override
  String get score => 'Score';

  @override
  String get quizComplete => 'Quiz Complete!';

  @override
  String get finish => 'Finish';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get showResult => 'Show Result';

  @override
  String get wordToMeaning => 'Word → Meaning';

  @override
  String get meaningToWord => 'Meaning → Word';

  @override
  String get excellent => 'Excellent! Perfect score!';

  @override
  String get great => 'Great job! Keep it up!';

  @override
  String get good => 'Good effort! Keep practicing!';

  @override
  String get keepPracticing => 'Keep practicing! You\'ll improve!';

  @override
  String get privacyPolicyContent => 'This app does not collect, store, or share any personal information.\n\nYour learning progress and favorites are stored only on your device.\n\nNo data is transmitted to external servers.';

  @override
  String get restorePurchaseDesc => 'If you have previously purchased ad removal on another device or after reinstalling the app, tap here to restore your purchase.';

  @override
  String get restoreComplete => 'Restore complete';

  @override
  String get noPurchaseFound => 'No previous purchase found';
}
