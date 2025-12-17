// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '托福备考词汇';

  @override
  String get todayWord => '今日经文';

  @override
  String get learning => '学习';

  @override
  String get levelLearning => '分数水平学习';

  @override
  String get allWords => '所有单词';

  @override
  String get viewAllWords => '查看所有词汇';

  @override
  String get favorites => '收藏夹';

  @override
  String get savedWords => '已保存的词语';

  @override
  String get flashcard => '闪卡';

  @override
  String get cardLearning => '卡片学习';

  @override
  String get quiz => '测验';

  @override
  String get testYourself => '测试一下自己';

  @override
  String get settings => '设置';

  @override
  String get language => '语言';

  @override
  String get displayLanguage => '显示语言';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get display => '展示';

  @override
  String get darkMode => '深色模式';

  @override
  String get fontSize => '字体大小';

  @override
  String get notifications => '通知';

  @override
  String get dailyReminder => '每日提醒';

  @override
  String get dailyReminderDesc => '每天提醒自己学习';

  @override
  String get removeAds => '移除广告';

  @override
  String get adsRemoved => '广告已移除';

  @override
  String get thankYou => '感谢您的支持！';

  @override
  String get buy => '买';

  @override
  String get restorePurchase => '恢复购买';

  @override
  String get restoring => '正在恢复……';

  @override
  String get purchaseSuccess => '购买成功！';

  @override
  String get loading => '加载中...';

  @override
  String get notAvailable => '无法使用';

  @override
  String get info => '信息';

  @override
  String get version => '版本';

  @override
  String get disclaimer => '免责声明';

  @override
  String get disclaimerText => '本应用是一款独立的托福备考工具，与 ETS（美国教育考试服务中心）没有任何关联，也未获得其认可或批准。';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get cannotLoadWords => '无法加载单词';

  @override
  String get noFavoritesYet => '暂无收藏';

  @override
  String get tapHeartToSave => '点击心形图标保存单词';

  @override
  String get addedToFavorites => '已添加到收藏夹';

  @override
  String get removedFromFavorites => '已从收藏夹中移除';

  @override
  String get wordDetail => '文字细节';

  @override
  String get definition => '定义';

  @override
  String get example => '例子';

  @override
  String levelWords(String level) {
    return '$level 所有单词';
  }

  @override
  String get beginner => '初级（0-60）';

  @override
  String get beginnerDesc => '基础词汇 - 800 个单词';

  @override
  String get intermediate => '中级（60-80）';

  @override
  String get intermediateDesc => '学术词汇 - 1200 个单词';

  @override
  String get advanced => '高级（80-100）';

  @override
  String get advancedDesc => '高级表达方式 - 1000字';

  @override
  String get expert => '专家（100+）';

  @override
  String get expertDesc => '专业词汇量 - 600 字';

  @override
  String get alphabetical => '按字母顺序排列';

  @override
  String get random => '随机的';

  @override
  String get tapToFlip => '点击翻转';

  @override
  String get previous => '以前的';

  @override
  String get next => '下一个';

  @override
  String get question => '问题';

  @override
  String get score => '分数';

  @override
  String get quizComplete => '测验完成！';

  @override
  String get finish => '结束';

  @override
  String get tryAgain => '重试';

  @override
  String get showResult => '显示结果';

  @override
  String get wordToMeaning => '词语 → 含义';

  @override
  String get meaningToWord => '含义 → 词';

  @override
  String get excellent => '太棒了！满分！';

  @override
  String get great => '干得好！继续保持！';

  @override
  String get good => '做得不错！继续练习！';

  @override
  String get keepPracticing => '坚持练习！你会进步的！';

  @override
  String get privacyPolicyContent => '本应用不会收集、存储或分享任何个人信息。\n\n您的学习进度和收藏夹仅存储在您的设备上。\n\n不会向外部服务器传输任何数据。';

  @override
  String get restorePurchaseDesc => '如果您之前在其他设备上购买过广告移除服务，或者在重新安装应用后购买过，请点击此处恢复您的购买。';

  @override
  String get restoreComplete => '完全恢复';

  @override
  String get noPurchaseFound => '未找到之前的购买记录';
}
