import json

# Load words.json
with open('assets/data/words.json', 'r', encoding='utf-8') as f:
    words = json.load(f)

print(f'Total words: {len(words)}')

# TOEFL levels based on score ranges
# 0-60 (Beginner), 60-80 (Intermediate), 80-100 (Advanced), 100+ (Expert)
levels = ['0-60', '60-80', '80-100', '100+']
words_per_level = len(words) // 4

# Add id and level to each word
for i, word in enumerate(words):
    word['id'] = i + 1
    
    # Assign level based on position
    if i < words_per_level:
        word['level'] = '0-60'
    elif i < words_per_level * 2:
        word['level'] = '60-80'
    elif i < words_per_level * 3:
        word['level'] = '80-100'
    else:
        word['level'] = '100+'

# Count by level
level_counts = {}
for w in words:
    level = w['level']
    level_counts[level] = level_counts.get(level, 0) + 1

print('Words per level:')
for level, count in sorted(level_counts.items()):
    print(f'  {level}: {count}')

# Save updated words.json
with open('assets/data/words.json', 'w', encoding='utf-8') as f:
    json.dump(words, f, ensure_ascii=False, indent=2)

print('\nwords.json updated with id and level fields!')
