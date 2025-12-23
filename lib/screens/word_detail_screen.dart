import 'package:flutter/material.dart';
import 'package:toefl_vocab_app/l10n/generated/app_localizations.dart';
import '../db/database_helper.dart';
import '../models/word.dart';
import '../services/translation_service.dart';

class WordDetailScreen extends StatefulWidget {
  final Word word;
  final List<Word>? wordList;
  final int? currentIndex;

  const WordDetailScreen({
    super.key,
    required this.word,
    this.wordList,
    this.currentIndex,
  });

  @override
  State<WordDetailScreen> createState() => _WordDetailScreenState();
}

class _WordDetailScreenState extends State<WordDetailScreen> {
  late Word _word;
  late int _currentIndex;
  String? _translatedDefinition;
  String? _translatedExample;

  @override
  void initState() {
    super.initState();
    _word = widget.word;
    _currentIndex = widget.currentIndex ?? 0;
    _loadTranslations();
  }

  Future<void> _loadTranslations() async {
    final translationService = TranslationService.instance;
    await translationService.init();

    if (!translationService.needsTranslation) return;

    // 내장 번역만 사용 (API 호출 없음)
    final langCode = translationService.currentLanguage;
    final embeddedDef = _word.getEmbeddedTranslation(langCode, 'definition');
    final embeddedEx = _word.getEmbeddedTranslation(langCode, 'example');

    if (mounted) {
      setState(() {
        _translatedDefinition = embeddedDef;
        _translatedExample = embeddedEx;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    await DatabaseHelper.instance.toggleFavorite(_word.id, !_word.isFavorite);
    setState(() {
      _word = _word.copyWith(isFavorite: !_word.isFavorite);
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _word.isFavorite
                ? AppLocalizations.of(context)!.addedToFavorites
                : AppLocalizations.of(context)!.removedFromFavorites,
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  Color _getLevelColor(String level) {
    switch (level) {
      case 'Band 5':
        return Colors.green;
      case 'Band 6':
        return Colors.lightGreen;
      case 'Band 7':
        return Colors.orange;
      case 'Band 8+':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  void _goToPreviousWord() {
    if (widget.wordList != null && _currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _word = widget.wordList![_currentIndex];
        _translatedDefinition = null;
        _translatedExample = null;
      });
      _loadTranslations();
    }
  }

  void _goToNextWord() {
    if (widget.wordList != null &&
        _currentIndex < widget.wordList!.length - 1) {
      setState(() {
        _currentIndex++;
        _word = widget.wordList![_currentIndex];
        _translatedDefinition = null;
        _translatedExample = null;
      });
      _loadTranslations();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final levelColor = _getLevelColor(_word.level);
    final bool canGoPrevious = widget.wordList != null && _currentIndex > 0;
    final bool canGoNext =
        widget.wordList != null &&
        _currentIndex < (widget.wordList?.length ?? 1) - 1;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.of(context).pop(_currentIndex);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(_currentIndex),
          ),
          title: Text(l10n.wordDetail),
          actions: [
            IconButton(
              icon: Icon(
                _word.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _word.isFavorite ? Colors.red : null,
              ),
              onPressed: _toggleFavorite,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        levelColor,
                        levelColor.withAlpha((0.7 * 255).toInt()),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(
                                (0.2 * 255).toInt(),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _word.partOfSpeech,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(
                                    (0.2 * 255).toInt(),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  _word.level,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _word.word,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Definition Section - 번역 위 (큰 글씨), 영어 아래 (회색)
              _buildDefinitionSection(
                title: l10n.definition,
                icon: Icons.book,
                content: _word.definition,
                translation: _translatedDefinition,
              ),
              const SizedBox(height: 16),

              // Example Section - 영어 위 (검은색), 번역 아래 (회색)
              _buildExampleSection(
                title: l10n.example,
                icon: Icons.format_quote,
                content: _word.example,
                translation: _translatedExample,
              ),
              if (widget.wordList != null) ...[
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: canGoPrevious ? _goToPreviousWord : null,
                      icon: const Icon(Icons.arrow_back),
                      label: Text(l10n.previous),
                    ),
                    Text(
                      '${_currentIndex + 1} / ${widget.wordList!.length}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: canGoNext ? _goToNextWord : null,
                      icon: const Icon(Icons.arrow_forward),
                      label: Text(l10n.next),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // 정의용: 번역 먼저 (큰 글씨), 영어 아래 (회색)
  Widget _buildDefinitionSection({
    required String title,
    required IconData icon,
    required String content,
    String? translation,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 번역이 있으면 번역 먼저 (큰 글씨), 영어 아래 (회색)
            if (translation != null) ...[
              Text(
                translation,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
            ] else
              Text(content, style: const TextStyle(fontSize: 16, height: 1.5)),
          ],
        ),
      ),
    );
  }

  // 예문용: 영어 먼저 (검은색), 번역 아래 (회색)
  Widget _buildExampleSection({
    required String title,
    required IconData icon,
    required String content,
    String? translation,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 영어 먼저 (검은색), 번역 아래 (회색)
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
            if (translation != null) ...[
              const SizedBox(height: 8),
              Text(
                translation,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
