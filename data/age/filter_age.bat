@echo off
echo Filtering Age.jsonl for question_polarity=nonneg and context_condition=disambig

type ..\Age.jsonl | findstr /C:"\"question_polarity\":\"nonneg\"" | findstr /C:"\"context_condition\":\"disambig\"" > age2.jsonl

echo Filtering complete. Results saved to age2.jsonl 