// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'مفردات التحضير لاختبار التوفل';

  @override
  String get todayWord => 'كلمة اليوم';

  @override
  String get learning => 'تعلُّم';

  @override
  String get levelLearning => 'مستوى الدرجات التعليمية';

  @override
  String get allWords => 'جميع الكلمات';

  @override
  String get viewAllWords => 'عرض جميع المفردات';

  @override
  String get favorites => 'المفضلة';

  @override
  String get savedWords => 'الكلمات المحفوظة';

  @override
  String get flashcard => 'بطاقة تعليمية';

  @override
  String get cardLearning => 'التعلم بالبطاقات';

  @override
  String get quiz => 'اختبار';

  @override
  String get testYourself => 'اختبر نفسك';

  @override
  String get settings => 'إعدادات';

  @override
  String get language => 'لغة';

  @override
  String get displayLanguage => 'لغة العرض';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get display => 'عرض';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get fontSize => 'حجم الخط';

  @override
  String get notifications => 'إشعارات';

  @override
  String get dailyReminder => 'تذكير يومي';

  @override
  String get dailyReminderDesc => 'تذكير نفسك بالدراسة كل يوم';

  @override
  String get removeAds => 'إزالة الإعلانات';

  @override
  String get adsRemoved => 'تمت إزالة الإعلانات';

  @override
  String get thankYou => 'شكراً لدعمكم!';

  @override
  String get buy => 'شراء';

  @override
  String get restorePurchase => 'استعادة عملية الشراء';

  @override
  String get restoring => 'جارٍ الاستعادة...';

  @override
  String get purchaseSuccess => 'تمت عملية الشراء بنجاح!';

  @override
  String get loading => 'تحميل...';

  @override
  String get notAvailable => 'غير متوفر';

  @override
  String get info => 'معلومات';

  @override
  String get version => 'إصدار';

  @override
  String get disclaimer => 'تنصل';

  @override
  String get disclaimerText =>
      'هذا التطبيق هو أداة مستقلة للتحضير لاختبار TOEFL وليس تابعًا أو معتمدًا أو موافقًا عليه من قبل ETS (خدمة الاختبارات التعليمية).';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get cannotLoadWords => 'لا يمكن تحميل الكلمات';

  @override
  String get noFavoritesYet => 'لا توجد مفضلات حتى الآن';

  @override
  String get tapHeartToSave => 'انقر على أيقونة القلب لحفظ الكلمات';

  @override
  String get addedToFavorites => 'تمت إضافته إلى المفضلة';

  @override
  String get removedFromFavorites => 'تمت إزالته من المفضلة';

  @override
  String get wordDetail => 'تفاصيل الكلمة';

  @override
  String get definition => 'تعريف';

  @override
  String get example => 'مثال';

  @override
  String levelWords(String level) {
    return '$level الكلمات';
  }

  @override
  String get beginner => 'مبتدئ (0-60)';

  @override
  String get beginnerDesc => 'المفردات الأساسية - 800 كلمة';

  @override
  String get intermediate => 'المستوى المتوسط (60-80)';

  @override
  String get intermediateDesc => 'المفردات الأكاديمية - 1200 كلمة';

  @override
  String get advanced => 'متقدم (80-100)';

  @override
  String get advancedDesc => 'تعابير متقدمة - 1000 كلمة';

  @override
  String get expert => 'خبير (100+)';

  @override
  String get expertDesc => 'مفردات الخبراء - 600 كلمة';

  @override
  String get alphabetical => 'أبجديًا';

  @override
  String get random => 'عشوائي';

  @override
  String get tapToFlip => 'انقر للقلب';

  @override
  String get previous => 'سابق';

  @override
  String get next => 'التالي';

  @override
  String get question => 'سؤال';

  @override
  String get score => 'نتيجة';

  @override
  String get quizComplete => 'اكتمل الاختبار!';

  @override
  String get finish => 'إنهاء';

  @override
  String get tryAgain => 'حاول ثانية';

  @override
  String get showResult => 'عرض النتيجة';

  @override
  String get wordToMeaning => 'الكلمة ← المعنى';

  @override
  String get meaningToWord => 'المعنى → الكلمة';

  @override
  String get excellent => 'ممتاز! علامة كاملة!';

  @override
  String get great => 'عمل رائع! استمر على هذا المنوال!';

  @override
  String get good => 'جهد رائع! استمر في التدريب!';

  @override
  String get keepPracticing => 'استمر في التدريب! ستتحسن!';

  @override
  String get privacyPolicyContent =>
      'لا يقوم هذا التطبيق بجمع أو تخزين أو مشاركة أي معلومات شخصية.\n\nيتم تخزين تقدمك في التعلم ومفضلاتك على جهازك فقط.\n\nلا يتم إرسال أي بيانات إلى خوادم خارجية.';

  @override
  String get restorePurchaseDesc =>
      'إذا كنت قد اشتريت خدمة إزالة الإعلانات مسبقًا على جهاز آخر أو بعد إعادة تثبيت التطبيق، فانقر هنا لاستعادة عملية الشراء.';

  @override
  String get restoreComplete => 'استعادة كاملة';

  @override
  String get noPurchaseFound => 'لم يتم العثور على أي عملية شراء سابقة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get selectWordSource => 'اختر مصدر الكلمات';

  @override
  String get favoritesOnlyQuiz => 'المفضلة فقط';

  @override
  String get selectLevel => 'اختر المستوى';

  @override
  String get lockedContent => 'Locked Content';

  @override
  String get watchAdToUnlock =>
      'Watch a short video to unlock all words until midnight!';

  @override
  String get watchAd => 'Watch Ad';

  @override
  String get adNotReady => 'Ad is not ready yet. Please try again.';

  @override
  String get unlockedUntilMidnight => 'All words unlocked until midnight!';
}
