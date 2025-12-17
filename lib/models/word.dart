import 'dart:convert';

/// 단어 모델 (TOEFL 학습용 - 다국어 지원)
/// 영어 원본 데이터 + 내장 번역 + 동적 번역
class Word {
  final int id;
  final String word;
  final String
  level; // TOEFL Band 기준: 61-80, 81-100, 101-110, 111-120
  final String partOfSpeech;
  final String definition; // 영어 정의
  final String example; // 영어 예문
  final String
  category; // 카테고리: Academic, Environment, Technology, Health, Education 등
  bool isFavorite;

  // 내장 번역 데이터 (words.json에서 로드)
  final Map<String, Map<String, String>>? translations;

  // 번역된 텍스트 (런타임에 설정됨)
  String? translatedDefinition;
  String? translatedExample;

  Word({
    required this.id,
    required this.word,
    required this.level,
    required this.partOfSpeech,
    required this.definition,
    required this.example,
    this.category = 'General',
    this.isFavorite = false,
    this.translations,
    this.translatedDefinition,
    this.translatedExample,
  });

  /// 내장 번역 가져오기
  String? getEmbeddedTranslation(String langCode, String fieldType) {
    if (translations == null) return null;
    final langData = translations![langCode];
    if (langData == null) return null;
    return langData[fieldType];
  }

  /// JSON에서 생성 (영어 원본 + 내장 번역)
  factory Word.fromJson(Map<String, dynamic> json) {
    // translations 파싱 (두 가지 형식 지원)
    Map<String, Map<String, String>>? translations;

    // 형식 1: translations 객체
    if (json['translations'] != null) {
      translations = {};
      (json['translations'] as Map<String, dynamic>).forEach((langCode, data) {
        if (data is Map<String, dynamic>) {
          translations![langCode] = {
            'definition': data['definition']?.toString() ?? '',
            'example': data['example']?.toString() ?? '',
          };
        }
      });
    }

    // 형식 2: flat 형식 (definition_ja, example_ja 등)
    final langCodes = [
      'ko',
      'ja',
      'zh',
      'zh_cn',
      'zh_tw',
      'es',
      'fr',
      'de',
      'pt',
      'vi',
      'ar',
      'th',
      'ru',
    ];
    for (final lang in langCodes) {
      final defKey = 'definition_$lang';
      final exKey = 'example_$lang';
      if (json[defKey] != null || json[exKey] != null) {
        translations ??= {};
        // zh_cn -> zh로 매핑
        final normalizedLang = lang == 'zh_cn' ? 'zh' : lang;
        translations[normalizedLang] = {
          'definition': json[defKey]?.toString() ?? '',
          'example': json[exKey]?.toString() ?? '',
        };
      }
    }

    return Word(
      id: json['id'],
      word: json['word'],
      level: json['level'],
      partOfSpeech: json['partOfSpeech'],
      definition: json['definition'],
      example: json['example'],
      category: json['category'] ?? 'General',
      isFavorite: json['isFavorite'] == 1 || json['isFavorite'] == true,
      translations: translations,
    );
  }

  /// DB 맵에서 생성 (translations JSON 파싱 포함)
  factory Word.fromDb(Map<String, dynamic> json) {
    // DB에서 translations 필드 파싱
    Map<String, Map<String, String>>? translations;
    if (json['translations'] != null && json['translations'] is String) {
      try {
        final decoded = jsonDecode(json['translations'] as String);
        if (decoded is Map<String, dynamic>) {
          translations = {};
          decoded.forEach((langCode, data) {
            if (data is Map<String, dynamic>) {
              translations![langCode] = {
                'definition': data['definition']?.toString() ?? '',
                'example': data['example']?.toString() ?? '',
              };
            }
          });
        }
      } catch (e) {
        print('Error parsing translations JSON: $e');
      }
    }

    return Word(
      id: json['id'] as int,
      word: json['word'] as String,
      level: json['level'] as String,
      partOfSpeech: json['partOfSpeech'] as String,
      definition: json['definition'] as String,
      example: json['example'] as String,
      category: json['category'] as String? ?? 'General',
      isFavorite: (json['isFavorite'] as int) == 1,
      translations: translations,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'level': level,
      'partOfSpeech': partOfSpeech,
      'definition': definition,
      'example': example,
      'category': category,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  /// 번역된 정의 가져오기 (번역 없으면 영어 원본)
  String getDefinition(bool useTranslation) {
    if (useTranslation &&
        translatedDefinition != null &&
        translatedDefinition!.isNotEmpty) {
      return translatedDefinition!;
    }
    return definition;
  }

  /// 번역된 예문 가져오기 (번역 없으면 영어 원본)
  String getExample(bool useTranslation) {
    if (useTranslation &&
        translatedExample != null &&
        translatedExample!.isNotEmpty) {
      return translatedExample!;
    }
    return example;
  }

  Word copyWith({
    int? id,
    String? word,
    String? level,
    String? partOfSpeech,
    String? definition,
    String? example,
    String? category,
    bool? isFavorite,
    Map<String, Map<String, String>>? translations,
    String? translatedDefinition,
    String? translatedExample,
  }) {
    return Word(
      id: id ?? this.id,
      word: word ?? this.word,
      level: level ?? this.level,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      definition: definition ?? this.definition,
      example: example ?? this.example,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
      translations: translations ?? this.translations,
      translatedDefinition: translatedDefinition ?? this.translatedDefinition,
      translatedExample: translatedExample ?? this.translatedExample,
    );
  }
}
