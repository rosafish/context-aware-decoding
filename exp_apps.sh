# apps
GLOBALLEN="3500" # = max context length + generation length
MAXCTXLEN="3000"
GENLEN="500"
FN_PREFIX="eval/apps"

export TRANSFORMERS_CACHE=/mnt/ebs/cache/
export NCCL_DEBUG=INFO
export NCCL_BLOCKING_WAIT=1
export NCCL_TIMEOUT=1800  # 30 minutes
export NCCL_P2P_LEVEL=NVL

for SHOTS in "1" "2"
do
# for WEIGHT in "2_-1" "1_-0" "1.5_-0.5"
for WEIGHT in "1.5_-0.5"
do
for EXAMPLE_TYPE in "random" "similar"
do
# for TOPP in "0.9" "0.85" "0.95"
for TOPP in "0.9"
do
    echo "Running apps with ${SHOTS} shots, weight ${WEIGHT}, example type ${EXAMPLE_TYPE}"
    TESTFILE="fin|${FN_PREFIX}/${EXAMPLE_TYPE}_${WEIGHT}_${SHOTS}shots_eval300.jsonl"
    bash run_group_decode_fileio.sh 2023 "0,1" $TESTFILE $GLOBALLEN $MAXCTXLEN $GENLEN $TOPP
done
done
done
done
