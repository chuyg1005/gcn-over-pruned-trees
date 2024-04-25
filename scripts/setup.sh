# 下载glove词向量
model_name="gcn-over-pruned-trees"
data_root="../data"
results_root="../results"
# 下载glove词向量
rm -rf dataset/glove
ln -s ${data_root}/glove dataset/glove
if [ ! -d "${data_root}/glove" ]; then
   echo "Downloading GloVe"
   mkdir ${data_root}/glove
   bash scripts/download.sh
fi

# 清空内容
rm -rf dataset/tacred
rm -rf dataset/tacred-vocab
rm -rf dataset/retacred
rm -rf dataset/retacred-vocab
ln -s ${data_root}/tacred dataset/tacred
ln -s ${data_root}/retacred dataset/retacred

rm -rf saved_models
if [ ! -d "${results_root}/${model_name}" ]; then
    mkdir ${results_root}/${model_name}
fi
if [ ! -d "${results_root}/${model_name}/saved_models" ]; then
    mkdir ${results_root}/${model_name}/saved_models
fi
if [ ! -d "${results_root}/${model_name}/dataset" ]; then
    mkdir ${results_root}/${model_name}/dataset
fi
ln -s ${results_root}/${model_name}/saved_models saved_models
rm -rf saved_models/tacred
rm -rf saved_models/retacred

# 创建VOCAB
if [ ! -d "${results_root}/${model_name}/dataset/tacred-vocab" ]; then
    mkdir ${results_root}/${model_name}/dataset/tacred-vocab
    ln -s ${results_root}/${model_name}/dataset/tacred-vocab dataset/tacred-vocab
    python prepare_vocab.py dataset/tacred dataset/tacred-vocab --glove_dir dataset/glove
fi
if [ ! -d "${results_root}/${model_name}/dataset/retacred-vocab" ]; then
    mkdir ${results_root}/${model_name}/dataset/retacred-vocab
    ln -s ${results_root}/${model_name}/dataset/retacred-vocab dataset/retacred-vocab
    python prepare_vocab.py dataset/retacred dataset/retacred-vocab --glove_dir dataset/glove
fi
