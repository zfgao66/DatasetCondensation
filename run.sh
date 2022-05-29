# export WANDB_PROJECT=fermi_t5_hyperformer
function get_gpu_count() {
  str=$1
  array=(${str//,/})
  echo ${#array}
}
 
function run_task() {
    export CUDA_VISIBLE_DEVICES=$1
    COMMON_ARGS="--dataset=$2 --ipc=$3 --eval_mode=$4 $5"
    nohup python main.py \
    ${COMMON_ARGS}> log/$(date "+%Y%m%d-%H%M%S").log 2>&1 &
}

run_task 0 MNIST 10 M --data_path=/home/zfgao/work/DatasetCondensation/data/MNIST

# function run_task() {
#     export CUDA_VISIBLE_DEVICES=$1
#     nohup python main.py --data_path=/home/zfgao/work/DatasetCondensation/data/cifar > log/$(date "+%Y%m%d-%H%M%S").log 2>&1 &
# }
# run_task 1 
# nohup python main.py --data_path=/home/zfgao/work/DatasetCondensation/data/cifar > out 2>&1 &