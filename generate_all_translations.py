# Generate all TOEFL vocabulary words with translations using Google Cloud Translation API
# 10 Languages: ko, ja, zh, es, pt, de, fr, vi, ar, id
import json
import requests
import time
import os

GOOGLE_API_KEY = "AIzaSyCWW8OXnc7QwIUTs_W0FCEVrZEm3qliDzk"
TRANSLATE_URL = f"https://translation.googleapis.com/language/translate/v2?key={GOOGLE_API_KEY}"

# Target languages based on TOEFL market + purchasing power
TARGET_LANGUAGES = [
    ('ko', '한국어'),      # Top TOEFL country, high purchasing power
    ('ja', '日本語'),      # High purchasing power, English learning boom
    ('zh', '中文'),        # World's largest TOEFL test-taking country
    ('es', 'Español'),     # 500M+ speakers, Latin America
    ('pt', 'Português'),   # Brazil 210M population
    ('de', 'Deutsch'),     # High purchasing power
    ('fr', 'Français'),    # 300M+ speakers
    ('vi', 'Tiếng Việt'),  # Southeast Asia high English learning demand
    ('ar', 'العربية'),     # Middle East 400M+ speakers
    ('id', 'Indonesia'),   # 270M population, growing market
]

def batch_translate(texts, target_lang, batch_size=100):
    """Translate texts in batches using Google Cloud Translation API"""
    translations = []
    
    for i in range(0, len(texts), batch_size):
        batch = texts[i:i + batch_size]
        
        response = requests.post(TRANSLATE_URL, json={
            'q': batch,
            'source': 'en',
            'target': target_lang,
            'format': 'text'
        })
        
        if response.status_code == 200:
            result = response.json()
            for t in result['data']['translations']:
                translations.append(t['translatedText'])
        else:
            print(f"Error: {response.status_code} - {response.text}")
            translations.extend(batch)  # Keep original on error
    
    return translations

def generate_words(words_list, level_name, output_file):
    """Generate words.json with translations for a specific level"""
    print(f"\n{'='*60}")
    print(f"Processing {level_name} level: {len(words_list)} words")
    print(f"{'='*60}")
    
    # Extract texts to translate
    definitions = [w[2] for w in words_list]
    examples = [w[3] for w in words_list]
    all_texts = definitions + examples
    
    # Translate to all target languages
    all_translations = {}
    
    for lang_code, lang_name in TARGET_LANGUAGES:
        print(f"Translating to {lang_name} ({lang_code})...", end=" ", flush=True)
        start = time.time()
        all_translations[lang_code] = batch_translate(all_texts, lang_code)
        print(f"✓ {time.time()-start:.1f}s")
    
    # Build word entries
    words_data = []
    num_words = len(words_list)
    
    for i, (word, pos, definition, example) in enumerate(words_list):
        translations = {}
        for lang_code, _ in TARGET_LANGUAGES:
            translations[lang_code] = {
                "definition": all_translations[lang_code][i],
                "example": all_translations[lang_code][num_words + i]
            }
        
        entry = {
            "word": word,
            "partOfSpeech": pos,
            "definition": definition,
            "example": example,
            "translations": translations
        }
        words_data.append(entry)
    
    # Save to file
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(words_data, f, ensure_ascii=False, indent=2)
    
    print(f"✓ Saved {len(words_data)} words to {output_file}")
    return words_data

def main():
    # Import all word lists
    print("Loading word lists...")
    
    # 0-60 Level
    from words_0_60_part1 import WORDS_0_60_PART1
    from words_0_60_part2 import WORDS_0_60_PART2
    from words_0_60_part3 import WORDS_0_60_PART3
    from words_0_60_part4 import WORDS_0_60_PART4
    words_0_60 = WORDS_0_60_PART1 + WORDS_0_60_PART2 + WORDS_0_60_PART3 + WORDS_0_60_PART4
    
    # 60-80 Level
    from words_60_80_part1 import WORDS_60_80_PART1
    from words_60_80_part2 import WORDS_60_80_PART2
    from words_60_80_part3 import WORDS_60_80_PART3
    from words_60_80_part4 import WORDS_60_80_PART4
    words_60_80 = WORDS_60_80_PART1 + WORDS_60_80_PART2 + WORDS_60_80_PART3 + WORDS_60_80_PART4
    
    # 80-100 Level
    from words_80_100_part1 import WORDS_80_100_PART1
    from words_80_100_part2 import WORDS_80_100_PART2
    from words_80_100_part3 import WORDS_80_100_PART3
    from words_80_100_part4 import WORDS_80_100_PART4
    words_80_100 = WORDS_80_100_PART1 + WORDS_80_100_PART2 + WORDS_80_100_PART3 + WORDS_80_100_PART4
    
    # 100+ Level
    from words_100_plus_part1 import WORDS_100_PLUS_PART1
    from words_100_plus_part2 import WORDS_100_PLUS_PART2
    from words_100_plus_part3 import WORDS_100_PLUS_PART3
    words_100_plus = WORDS_100_PLUS_PART1 + WORDS_100_PLUS_PART2 + WORDS_100_PLUS_PART3
    
    total = len(words_0_60) + len(words_60_80) + len(words_80_100) + len(words_100_plus)
    print(f"\nTotal words loaded: {total}")
    print(f"  0-60 Level: {len(words_0_60)} words")
    print(f"  60-80 Level: {len(words_60_80)} words")
    print(f"  80-100 Level: {len(words_80_100)} words")
    print(f"  100+ Level: {len(words_100_plus)} words")
    print(f"\nTarget languages ({len(TARGET_LANGUAGES)}):")
    for code, name in TARGET_LANGUAGES:
        print(f"  - {name} ({code})")
    
    # Create output directory
    output_dir = "assets/data"
    os.makedirs(output_dir, exist_ok=True)
    
    # Generate translations for each level
    all_words = []
    
    data_0_60 = generate_words(words_0_60, "0-60", f"{output_dir}/0_60_words.json")
    all_words.extend(data_0_60)
    
    data_60_80 = generate_words(words_60_80, "60-80", f"{output_dir}/60_80_words.json")
    all_words.extend(data_60_80)
    
    data_80_100 = generate_words(words_80_100, "80-100", f"{output_dir}/80_100_words.json")
    all_words.extend(data_80_100)
    
    data_100_plus = generate_words(words_100_plus, "100+", f"{output_dir}/100_plus_words.json")
    all_words.extend(data_100_plus)
    
    # Save combined file
    with open(f"{output_dir}/words.json", 'w', encoding='utf-8') as f:
        json.dump(all_words, f, ensure_ascii=False, indent=2)
    
    print(f"\n{'='*60}")
    print(f"✓ ALL DONE!")
    print(f"  Total words: {len(all_words)}")
    print(f"  Languages: {len(TARGET_LANGUAGES)}")
    print(f"  Saved to {output_dir}/words.json")
    print(f"{'='*60}")

if __name__ == "__main__":
    main()
