import json
import time
from deep_translator import GoogleTranslator
from words_0_60_part1 import WORDS_0_60_PART1
from words_0_60_part2 import WORDS_0_60_PART2
from words_0_60_part3 import WORDS_0_60_PART3
from words_0_60_part4 import WORDS_0_60_PART4

def translate_text(text, target_lang):
    try:
        translator = GoogleTranslator(source='en', target=target_lang)
        return translator.translate(text)
    except Exception as e:
        print(f"Error {target_lang}: {e}")
        return text

def generate_level_words(words, level, start_id):
    all_words = []
    word_id = start_id
    
    for word_data in words:
        word, pos, definition, example = word_data
        
        ko_def = translate_text(definition, 'ko')
        ko_ex = translate_text(example, 'ko')
        ja_def = translate_text(definition, 'ja')
        ja_ex = translate_text(example, 'ja')
        zh_def = translate_text(definition, 'zh-CN')
        zh_ex = translate_text(example, 'zh-CN')
        
        word_entry = {
            "id": word_id,
            "word": word,
            "level": level,
            "partOfSpeech": pos,
            "definition": definition,
            "example": example,
            "category": "Academic",
            "translations": {
                "ko": {"definition": ko_def, "example": ko_ex},
                "ja": {"definition": ja_def, "example": ja_ex},
                "zh": {"definition": zh_def, "example": zh_ex}
            }
        }
        all_words.append(word_entry)
        word_id += 1
        
        if word_id % 50 == 0:
            print(f"Processed {word_id} words...")
            time.sleep(0.3)
    
    return all_words, word_id

if __name__ == "__main__":
    print("Generating 0-60 level words...")
    all_0_60 = WORDS_0_60_PART1 + WORDS_0_60_PART2 + WORDS_0_60_PART3 + WORDS_0_60_PART4
    print(f"Total 0-60 words: {len(all_0_60)}")
    
    words, next_id = generate_level_words(all_0_60, "0-60", 1)
    
    with open('assets/data/0_60_words.json', 'w', encoding='utf-8') as f:
        json.dump(words, f, ensure_ascii=False, indent=2)
    
    print(f"Created 0_60_words.json with {len(words)} words")
