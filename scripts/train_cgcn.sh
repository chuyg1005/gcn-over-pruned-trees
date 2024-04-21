#!/bin/bash

DEVICE=$1
DATASET=$2
export DATASET=$DATASET
export CUDA_VISIBLE_DEVICES=$DEVICE
python train.py --id $DATASET --seed 0 --prune_k 1 --lr 0.3 --rnn_hidden 200 --num_epoch 30 --pooling max --mlp_layers 2 --pooling_l2 0.003 \
 --data_dir dataset/${DATASET} --vocab_dir dataset/${DATASET}-vocab
