import json
import os

# Input and output file paths
input_file = "../Age.jsonl"
output_file = "age2.jsonl"

# Filter criteria
filter_criteria = {
    "question_polarity": "nonneg",
    "context_condition": "disambig"
}

# Process the file
with open(input_file, 'r', encoding='utf-8') as infile, open(output_file, 'w', encoding='utf-8') as outfile:
    count_total = 0
    count_filtered = 0
    
    for line in infile:
        count_total += 1
        item = json.loads(line)
        
        # Check if the item matches both filter criteria
        if (item.get("question_polarity") == filter_criteria["question_polarity"] and 
            item.get("context_condition") == filter_criteria["context_condition"]):
            outfile.write(line)
            count_filtered += 1
    
    print(f"Total items processed: {count_total}")
    print(f"Items matching criteria: {count_filtered}")
    print(f"Filtered data saved to {output_file}") 