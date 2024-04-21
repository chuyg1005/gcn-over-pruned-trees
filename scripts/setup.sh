# 下载glove词向量
model_name="gcn-over-pruned-trees"
rm -rf dataset/glove
ln -s /home/data_91_d/chuyg/mix-debias/glove dataset/glove
if [ ! -d "/home/data_91_d/chuyg/mix-debias/glove" ]; then
   echo "Downloading GloVe"
   mkdir /home/data_91_d/chuyg/mix-debias/glove
   bash scripts/download.sh
fi

# 清空内容
rm -rf dataset/tacred
rm -rf dataset/tacred-vocab
rm -rf dataset/retacred
rm -rf dataset/retacred-vocab
ln -s /home/data_91_d/chuyg/mix-debias/data/tacred dataset/tacred
ln -s /home/data_91_d/chuyg/mix-debias/data/retacred dataset/retacred

rm -rf saved_models
if [ ! -d "/home/data_91_d/chuyg/mix-debias/${model_name}" ]; then
    mkdir /home/data_91_d/chuyg/mix-debias/${model_name}
fi
if [ ! -d "/home/data_91_d/chuyg/mix-debias/${model_name}/saved_models" ]; then
    mkdir /home/data_91_d/chuyg/mix-debias/${model_name}/saved_models
fi
if [ ! -d "/home/data_91_d/chuyg/mix-debias/${model_name}/dataset" ]; then
    mkdir /home/data_91_d/chuyg/mix-debias/${model_name}/dataset
fi
ln -s /home/data_91_d/chuyg/mix-debias/${model_name}/saved_models saved_models
rm -rf saved_models/tacred
rm -rf saved_models/retacred

# 创建VOCAB
if [ ! -d "/home/data_91_d/chuyg/mix-debias/${model_name}/dataset/tacred-vocab" ]; then
    mkdir /home/data_91_d/chuyg/mix-debias/${model_name}/dataset/tacred-vocab
    ln -s /home/data_91_d/chuyg/mix-debias/${model_name}/dataset/tacred-vocab dataset/tacred-vocab
    python prepare_vocab.py dataset/tacred dataset/tacred-vocab --glove_dir dataset/glove
fi
if [ ! -d "/home/data_91_d/chuyg/mix-debias/${model_name}/dataset/retacred-vocab" ]; then
    mkdir /home/data_91_d/chuyg/mix-debias/${model_name}/dataset/retacred-vocab
    ln -s /home/data_91_d/chuyg/mix-debias/${model_name}/dataset/retacred-vocab dataset/retacred-vocab
    python prepare_vocab.py dataset/retacred dataset/retacred-vocab --glove_dir dataset/glove
fi
