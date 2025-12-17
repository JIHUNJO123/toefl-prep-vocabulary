# Generate l10n files for 10 languages using Google Cloud Translation API
import json
import requests
import os
import html

GOOGLE_API_KEY = "AIzaSyCWW8OXnc7QwIUTs_W0FCEVrZEm3qliDzk"
TRANSLATE_URL = f"https://translation.googleapis.com/language/translate/v2?key={GOOGLE_API_KEY}"

# Base English content
BASE_EN = {
    "@@locale": "en",
    "appTitle": "TOEFL Prep Vocabulary",
    "todayWord": "Today's Word",
    "learning": "Learning",
    "levelLearning": "Score Level Learning",
    "allWords": "All Words",
    "viewAllWords": "View all vocabulary",
    "favorites": "Favorites",
    "savedWords": "Saved words",
    "flashcard": "Flashcard",
    "cardLearning": "Card learning",
    "quiz": "Quiz",
    "testYourself": "Test yourself",
    "settings": "Settings",
    "language": "Language",
    "displayLanguage": "Display Language",
    "selectLanguage": "Select Language",
    "display": "Display",
    "darkMode": "Dark Mode",
    "fontSize": "Font Size",
    "notifications": "Notifications",
    "dailyReminder": "Daily Reminder",
    "dailyReminderDesc": "Get reminded to study every day",
    "removeAds": "Remove Ads",
    "adsRemoved": "Ads Removed",
    "thankYou": "Thank you for your support!",
    "buy": "Buy",
    "restorePurchase": "Restore Purchase",
    "restoring": "Restoring...",
    "purchaseSuccess": "Purchase successful!",
    "loading": "Loading...",
    "notAvailable": "Not available",
    "info": "Info",
    "version": "Version",
    "disclaimer": "Disclaimer",
    "disclaimerText": "This app is an independent TOEFL preparation tool and is not affiliated with, endorsed by, or approved by ETS (Educational Testing Service).",
    "privacyPolicy": "Privacy Policy",
    "cannotLoadWords": "Cannot load words",
    "noFavoritesYet": "No favorites yet",
    "tapHeartToSave": "Tap the heart icon to save words",
    "addedToFavorites": "Added to favorites",
    "removedFromFavorites": "Removed from favorites",
    "wordDetail": "Word Detail",
    "definition": "Definition",
    "example": "Example",
    "levelWords": "{level} Words",
    "beginner": "Beginner (0-60)",
    "beginnerDesc": "Basic vocabulary - 800 words",
    "intermediate": "Intermediate (60-80)",
    "intermediateDesc": "Academic vocabulary - 1,200 words",
    "advanced": "Advanced (80-100)",
    "advancedDesc": "Advanced expressions - 1,000 words",
    "expert": "Expert (100+)",
    "expertDesc": "Expert vocabulary - 600 words",
    "alphabetical": "Alphabetical",
    "random": "Random",
    "tapToFlip": "Tap to flip",
    "previous": "Previous",
    "next": "Next",
    "question": "Question",
    "score": "Score",
    "quizComplete": "Quiz Complete!",
    "finish": "Finish",
    "tryAgain": "Try Again",
    "showResult": "Show Result",
    "wordToMeaning": "Word → Meaning",
    "meaningToWord": "Meaning → Word",
    "excellent": "Excellent! Perfect score!",
    "great": "Great job! Keep it up!",
    "good": "Good effort! Keep practicing!",
    "keepPracticing": "Keep practicing! You'll improve!",
    "privacyPolicyContent": "This app does not collect, store, or share any personal information.\n\nYour learning progress and favorites are stored only on your device.\n\nNo data is transmitted to external servers.",
    "restorePurchaseDesc": "If you have previously purchased ad removal on another device or after reinstalling the app, tap here to restore your purchase.",
    "restoreComplete": "Restore complete",
    "noPurchaseFound": "No previous purchase found"
}

# Keys to NOT translate (metadata or placeholders)
SKIP_KEYS = {"@@locale", "levelWords", "@levelWords"}

# Target languages
TARGET_LANGUAGES = {
    'ko': '한국어',
    'ja': '日本語', 
    'zh': '中文',
    'es': 'Español',
    'pt': 'Português',
    'de': 'Deutsch',
    'fr': 'Français',
    'vi': 'Tiếng Việt',
    'ar': 'العربية',
    'id': 'Indonesia'
}

def batch_translate(texts, target_lang):
    """Translate texts using Google Cloud Translation API"""
    response = requests.post(TRANSLATE_URL, json={
        'q': texts,
        'source': 'en',
        'target': target_lang,
        'format': 'text'
    })
    
    if response.status_code == 200:
        result = response.json()
        # Unescape HTML entities from Google Translate
        return [html.unescape(t['translatedText']) for t in result['data']['translations']]
    else:
        print(f"Error: {response.status_code}")
        return texts

def generate_l10n_file(lang_code, lang_name):
    """Generate l10n file for a specific language"""
    print(f"Generating {lang_name} ({lang_code})...", end=" ", flush=True)
    
    # Get texts to translate
    keys_to_translate = []
    texts_to_translate = []
    
    for key, value in BASE_EN.items():
        if key not in SKIP_KEYS and not key.startswith("@"):
            keys_to_translate.append(key)
            texts_to_translate.append(value)
    
    # Translate
    translated_texts = batch_translate(texts_to_translate, lang_code)
    
    # Build result
    result = {"@@locale": lang_code}
    
    for i, key in enumerate(keys_to_translate):
        result[key] = translated_texts[i]
    
    # Add levelWords with placeholder
    result["levelWords"] = "{level} " + translated_texts[keys_to_translate.index("allWords")].split()[-1] if lang_code != 'en' else "{level} Words"
    result["@levelWords"] = {
        "placeholders": {
            "level": {
                "type": "String"
            }
        }
    }
    
    # Save to file
    output_path = f"lib/l10n/app_{lang_code}.arb"
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(result, f, ensure_ascii=False, indent=2)
    
    print("✓")
    return result

def main():
    print("Generating l10n files for 10 languages...\n")
    
    # Save English base
    with open("lib/l10n/app_en.arb", 'w', encoding='utf-8') as f:
        # Add @levelWords metadata
        en_content = BASE_EN.copy()
        en_content["@levelWords"] = {
            "placeholders": {
                "level": {
                    "type": "String"
                }
            }
        }
        json.dump(en_content, f, ensure_ascii=False, indent=2)
    print("English (en)... ✓ (base)")
    
    # Generate for each target language
    for lang_code, lang_name in TARGET_LANGUAGES.items():
        generate_l10n_file(lang_code, lang_name)
    
    print(f"\n✓ Done! Generated {len(TARGET_LANGUAGES) + 1} l10n files.")

if __name__ == "__main__":
    main()
