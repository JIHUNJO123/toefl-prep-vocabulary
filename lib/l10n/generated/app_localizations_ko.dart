// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'TOEFL 준비 어휘';

  @override
  String get todayWord => '오늘의 단어';

  @override
  String get learning => '학습';

  @override
  String get levelLearning => '점수 수준 학습';

  @override
  String get allWords => '모든 단어';

  @override
  String get viewAllWords => '모든 어휘 보기';

  @override
  String get favorites => '즐겨찾기';

  @override
  String get savedWords => '저장된 단어';

  @override
  String get flashcard => '플래시카드';

  @override
  String get cardLearning => '카드 학습';

  @override
  String get quiz => '퀴즈';

  @override
  String get testYourself => '실력 테스트';

  @override
  String get settings => '설정';

  @override
  String get language => '언어';

  @override
  String get displayLanguage => '표시 언어';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get display => '디스플레이';

  @override
  String get darkMode => '다크 모드';

  @override
  String get fontSize => '글꼴 크기';

  @override
  String get notifications => '알림';

  @override
  String get dailyReminder => '매일 알림';

  @override
  String get dailyReminderDesc => '매일 공부하라는 알림을 받으세요';

  @override
  String get removeAds => '광고 제거';

  @override
  String get adsRemoved => '광고 제거됨';

  @override
  String get thankYou => '구매해 주셔서 감사합니다!';

  @override
  String get buy => '구매';

  @override
  String get restorePurchase => '구매 복원';

  @override
  String get restoring => '복원 중...';

  @override
  String get purchaseSuccess => '구매가 완료되었습니다!';

  @override
  String get loading => '로딩 중...';

  @override
  String get notAvailable => '이용 불가';

  @override
  String get info => '정보';

  @override
  String get version => '버전';

  @override
  String get disclaimer => '면책 조항';

  @override
  String get disclaimerText => '이 앱은 독립적인 TOEFL 준비 도구이며, ETS(Educational Testing Service)와 제휴, 보증 또는 승인 관계가 없습니다.';

  @override
  String get privacyPolicy => '개인정보처리방침';

  @override
  String get cannotLoadWords => '단어를 불러올 수 없습니다';

  @override
  String get noFavoritesYet => '아직 즐겨찾기가 없습니다';

  @override
  String get tapHeartToSave => '하트 아이콘을 탭하여 단어를 저장하세요.';

  @override
  String get addedToFavorites => '즐겨찾기에 추가됨';

  @override
  String get removedFromFavorites => '즐겨찾기에서 삭제됨';

  @override
  String get wordDetail => '단어 상세 정보';

  @override
  String get definition => '정의';

  @override
  String get example => '예문';

  @override
  String levelWords(String level) {
    return '$level 단어';
  }

  @override
  String get beginner => '초급 (0-60)';

  @override
  String get beginnerDesc => '기본 어휘 - 800단어';

  @override
  String get intermediate => '중급 (60-80)';

  @override
  String get intermediateDesc => '학술 어휘 - 1,200단어';

  @override
  String get advanced => '고급 (80-100)';

  @override
  String get advancedDesc => '고급 표현 - 1,000단어';

  @override
  String get expert => '전문가 (100+)';

  @override
  String get expertDesc => '전문 어휘 - 600단어';

  @override
  String get alphabetical => '알파벳순';

  @override
  String get random => '랜덤';

  @override
  String get tapToFlip => '탭하여 뒤집기';

  @override
  String get previous => '이전';

  @override
  String get next => '다음';

  @override
  String get question => '문제';

  @override
  String get score => '점수';

  @override
  String get quizComplete => '퀴즈 완료!';

  @override
  String get finish => '완료';

  @override
  String get tryAgain => '다시 풀기';

  @override
  String get showResult => '결과 보기';

  @override
  String get wordToMeaning => '단어 → 의미';

  @override
  String get meaningToWord => '의미 → 단어';

  @override
  String get excellent => '훌륭해요! 만점입니다!';

  @override
  String get great => '정말 잘했어요! 계속 이렇게 해주세요!';

  @override
  String get good => '잘했어요! 계속 연습하세요!';

  @override
  String get keepPracticing => '계속 연습하세요! 실력이 늘 거예요!';

  @override
  String get privacyPolicyContent => '이 앱은 어떠한 개인 정보도 수집, 저장 또는 공유하지 않습니다.\n\n학습 진행 상황과 즐겨찾기는 사용자의 기기에만 저장됩니다.\n\n외부 서버로 데이터가 전송되지 않습니다.';

  @override
  String get restorePurchaseDesc => '다른 기기에서 또는 앱을 다시 설치한 후 광고 제거 기능을 구매한 경우, 여기를 탭하여 구매 내역을 복원하세요.';

  @override
  String get restoreComplete => '복원 완료';

  @override
  String get noPurchaseFound => '이전 구매 내역이 없습니다.';

  @override
  String get cancel => '취소';

  @override
  String get selectWordSource => '단어 소스 선택';

  @override
  String get favoritesOnlyQuiz => '즐겨찾기만';

  @override
  String get selectLevel => '레벨 선택';
}
