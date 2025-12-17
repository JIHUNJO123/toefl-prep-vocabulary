import json
import requests
import time
import concurrent.futures
from words_0_60_part1 import WORDS_0_60_PART1
from words_0_60_part2 import WORDS_0_60_PART2
from words_0_60_part3 import WORDS_0_60_PART3
from words_0_60_part4 import WORDS_0_60_PART4

API_KEY = "AIzaSyCWW8OXnc7QwIUTs_W0FCEVrZEm3qliDzk"

def translate_batch(texts, target_lang):
    """Google Cloud Translation API로 배치 번역"""
    url = f"https://translation.googleapis.com/language/translate/v2?key={API_KEY}"
    results = []
    
    # 최대 128개씩 배치 처리
    for i in range(0, len(texts), 100):
        batch = texts[i:i+100]
        payload = {
            "q": batch,
            "source": "en",
            "target": target_lang,
            "format": "text"
        }
        try:
            response = requests.post(url, json=payload)
            data = response.json()
            if "data" in data and "translations" in data["data"]:
                results.extend([t["translatedText"] for t in data["data"]["translations"]])
            else:
                print(f"Error: {data}")
                results.extend(batch)
        except Exception as e:
            print(f"Exception: {e}")
            results.extend(batch)
    
    return results

def generate_words_fast(words_list, level, start_id):
    """빠른 배치 번역으로 단어 생성"""
    definitions = [w[2] for w in words_list]
    examples = [w[3] for w in words_list]
    
    print(f"Translating {len(words_list)} words for level {level}...")
    
    # 병렬 번역
    print("  Korean...")
    ko_defs = translate_batch(definitions, 'ko')
    ko_exs = translate_batch(examples, 'ko')
    
    print("  Japanese...")
    ja_defs = translate_batch(definitions, 'ja')
    ja_exs = translate_batch(examples, 'ja')
    
    print("  Chinese...")
    zh_defs = translate_batch(definitions, 'zh')
    zh_exs = translate_batch(examples, 'zh')
    
    all_words = []
    for i, word_data in enumerate(words_list):
        word, pos, definition, example = word_data
        word_entry = {
            "id": start_id + i,
            "word": word,
            "level": level,
            "partOfSpeech": pos,
            "definition": definition,
            "example": example,
            "category": "Academic",
            "translations": {
                "ko": {"definition": ko_defs[i], "example": ko_exs[i]},
                "ja": {"definition": ja_defs[i], "example": ja_exs[i]},
                "zh": {"definition": zh_defs[i], "example": zh_exs[i]}
            }
        }
        all_words.append(word_entry)
    
    return all_words

if __name__ == "__main__":
    print("=== TOEFL 0-60 Level Words Generation ===")
    all_words = WORDS_0_60_PART1 + WORDS_0_60_PART2 + WORDS_0_60_PART3 + WORDS_0_60_PART4
    print(f"Total words to process: {len(all_words)}")
    
    result = generate_words_fast(all_words, "0-60", 1)
    
    with open('assets/data/0_60_words.json', 'w', encoding='utf-8') as f:
        json.dump(result, f, ensure_ascii=False, indent=2)
    
    print(f"\nDone! Created 0_60_words.json with {len(result)} words")
