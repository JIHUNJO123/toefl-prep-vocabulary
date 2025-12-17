import os
import re

base_path = r"c:\Users\hooni\Desktop\TOEFL Prep Essential Vocabulary\lib"

replacements = [
    # Package imports
    ("ielts_vocab_app", "toefl_vocab_app"),
    # Database
    ("ielts_words.db", "toefl_words.db"),
    # IELTS -> TOEFL
    ("IELTS", "TOEFL"),
    ("ielts", "toefl"),
    # Product ID
    ("ielts_vocab_app_remove_ads", "toefl_vocab_app_remove_ads"),
    # Band level -> TOEFL Score level
    ("Band 4.5-5.5", "61-80"),
    ("Band 6.0-6.5", "81-100"),
    ("Band 7.0-7.5", "101-110"),
    ("Band 8.0+", "111-120"),
    # l10n keys for bands
    ("band45", "beginner"),
    ("band45Desc", "beginnerDesc"),
    ("band60", "intermediate"),
    ("band60Desc", "intermediateDesc"),
    ("band70", "advanced"),
    ("band70Desc", "advancedDesc"),
    ("band80", "expert"),
    ("band80Desc", "expertDesc"),
    # Color
    ("0xFF1E88E5", "0xFFFF6B35"),
]

for root, dirs, files in os.walk(base_path):
    for filename in files:
        if filename.endswith('.dart'):
            filepath = os.path.join(root, filename)
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
            
            original = content
            for old, new in replacements:
                content = content.replace(old, new)
            
            if content != original:
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(content)
                print(f"Updated: {filename}")

print("Done!")
