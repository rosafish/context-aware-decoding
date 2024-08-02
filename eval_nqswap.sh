GOLD_DATA_PATH=./eval/nqswap_example_input/nqswap_1_0.jsonl
PRED_PATH=./eval/nqswap_example_input/nqswap_1_0.jsonl.output_topp0.0_genlen10.jsonl
python eval/evaluate_summary.py --pred_path $PRED_PATH --data_path $GOLD_DATA_PATH