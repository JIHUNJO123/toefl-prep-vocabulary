import json
import os

base_path = r"c:\Users\hooni\Desktop\TOEFL Prep Essential Vocabulary\lib\l10n"

# 수정할 내용 정리
fixes = {
    "app_ja.arb": {
        "buy": "購入",
        "finish": "完了",
        "display": "表示",
        "todayWord": "今日の単語",
        "previous": "前へ",
        "wordDetail": "単語の詳細"
    },
    "app_ar.arb": {
        "quiz": "اختبار",
        "buy": "شراء",
        "finish": "إنهاء"
    },
    "app_fr.arb": {
        "finish": "Terminer"
    },
    "app_id.arb": {
        "buy": "Beli",
        "finish": "Selesai",
        "display": "Tampilan",
        "todayWord": "Kata Hari Ini",
        "learning": "Belajar"
    },
    "app_zh.arb": {
        "buy": "购买",
        "todayWord": "今日单词",
        "display": "显示",
        "previous": "上一个",
        "wordDetail": "单词详情",
        "random": "随机"
    }
}

for filename, corrections in fixes.items():
    filepath = os.path.join(base_path, filename)
    
    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    for key, value in corrections.items():
        if key in data:
            old_value = data[key]
            data[key] = value
            print(f"{filename}: {key}: '{old_value}' -> '{value}'")
    
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

print("\n모든 l10n 번역 오류 수정 완료!")
