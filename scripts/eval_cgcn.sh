DEVICE=$1
DATASET=$2
EVAL_NAME=$3
export DATASET=$DATASET
export CUDA_VISIBLE_DEVICES=$DEVICE
python eval.py saved_models/${DATASET} --data_dir dataset/${DATASET} --dataset $EVAL_NAME