// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'TOEFL対策語彙';

  @override
  String get todayWord => '今日の単語';

  @override
  String get learning => '学ぶ';

  @override
  String get levelLearning => 'スコアレベル学習';

  @override
  String get allWords => 'すべての単語';

  @override
  String get viewAllWords => 'すべての語彙を表示';

  @override
  String get favorites => 'お気に入り';

  @override
  String get savedWords => '保存した単語';

  @override
  String get flashcard => 'フラッシュカード';

  @override
  String get cardLearning => 'カード学習';

  @override
  String get quiz => 'クイズ';

  @override
  String get testYourself => '自分でテストする';

  @override
  String get settings => '設定';

  @override
  String get language => '言語';

  @override
  String get displayLanguage => '表示言語';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get display => '表示';

  @override
  String get darkMode => 'ダークモード';

  @override
  String get fontSize => 'フォントサイズ';

  @override
  String get notifications => '通知';

  @override
  String get dailyReminder => '毎日のリマインダー';

  @override
  String get dailyReminderDesc => '毎日勉強することを思い出させる';

  @override
  String get removeAds => '広告を削除する';

  @override
  String get adsRemoved => '広告を削除しました';

  @override
  String get thankYou => 'ご支援ありがとうございます！';

  @override
  String get buy => '購入';

  @override
  String get restorePurchase => '購入を復元';

  @override
  String get restoring => '復元中...';

  @override
  String get purchaseSuccess => '購入成功しました！';

  @override
  String get loading => '読み込み中...';

  @override
  String get notAvailable => '利用不可';

  @override
  String get info => '情報';

  @override
  String get version => 'バージョン';

  @override
  String get disclaimer => '免責事項';

  @override
  String get disclaimerText =>
      'このアプリは独立した TOEFL 準備ツールであり、ETS (Educational Testing Service) と提携、推奨、承認されていません。';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get cannotLoadWords => '単語を読み込めません';

  @override
  String get noFavoritesYet => 'お気に入りはまだありません';

  @override
  String get tapHeartToSave => 'ハートアイコンをタップして単語を保存します';

  @override
  String get addedToFavorites => 'お気に入りに追加されました';

  @override
  String get removedFromFavorites => 'お気に入りから削除されました';

  @override
  String get wordDetail => '単語の詳細';

  @override
  String get definition => '意味';

  @override
  String get example => '例';

  @override
  String levelWords(String level) {
    return '$level すべての単語';
  }

  @override
  String get beginner => '初心者（0～60）';

  @override
  String get beginnerDesc => '基本語彙 - 800語';

  @override
  String get intermediate => '中級（60～80）';

  @override
  String get intermediateDesc => '学術用語 - 1,200語';

  @override
  String get advanced => '上級（80～100）';

  @override
  String get advancedDesc => '上級表現 - 1,000語';

  @override
  String get expert => 'エキスパート（100以上）';

  @override
  String get expertDesc => '専門家の語彙 - 600語';

  @override
  String get alphabetical => 'アルファベット順';

  @override
  String get random => 'ランダム';

  @override
  String get tapToFlip => 'タップしてめくる';

  @override
  String get previous => '前へ';

  @override
  String get next => '次';

  @override
  String get question => '質問';

  @override
  String get score => 'スコア';

  @override
  String get quizComplete => 'クイズ完了！';

  @override
  String get finish => '完了';

  @override
  String get tryAgain => 'もう一度やり直してください';

  @override
  String get showResult => '結果を表示';

  @override
  String get wordToMeaning => '単語 → 意味';

  @override
  String get meaningToWord => '意味 → 単語';

  @override
  String get excellent => '素晴らしい！満点です！';

  @override
  String get great => '素晴らしいですね！これからも頑張ってください！';

  @override
  String get good => 'よく頑張りました！練習を続けてください！';

  @override
  String get keepPracticing => '練習を続けてください！上達しますよ！';

  @override
  String get privacyPolicyContent =>
      'このアプリは、個人情報を収集、保存、共有することはありません。\n\n学習の進捗状況やお気に入りは、お使いのデバイスにのみ保存されます。\n\n外部サーバーにデータが送信されることはありません。';

  @override
  String get restorePurchaseDesc =>
      '以前に別のデバイスで、またはアプリを再インストールした後に広告削除を購入した場合は、ここをタップして購入を復元してください。';

  @override
  String get restoreComplete => '復元完了';

  @override
  String get noPurchaseFound => '以前の購入は見つかりません';

  @override
  String get cancel => 'キャンセル';

  @override
  String get selectWordSource => '単語ソースを選択';

  @override
  String get favoritesOnlyQuiz => 'お気に入りのみ';

  @override
  String get selectLevel => 'レベルを選択';

  @override
  String get lockedContent => 'ロックされたコンテンツ';

  @override
  String get watchAdToUnlock => '短い動画を見て、真夜中まですべての単語をロック解除しましょう！';

  @override
  String get watchAd => '広告を見る';

  @override
  String get adNotReady => '広告の準備ができていません。もう一度お試しください。';

  @override
  String get unlockedUntilMidnight => '真夜中まですべての単語がロック解除されました！';
}
