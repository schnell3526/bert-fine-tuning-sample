#!/bin/bash

# 計算ノード(V)
# sever name  CPUs GPUs RAM Cost
# rt_F        40   4    360 1.0
# rt_G.large  20   4    240 0.9
# rt_G.small  5    1    60  0.3
# rt_C.large  20   0    120 0.6
# rt_C.small  5    0    30  0.2

# 計算ノード(A)
# sever name  CPUs GPUs RAM Cost
# rt_AF       72   8    480 3.0
# rt_AG.small 9    1    60  0.5

# メモリインテンシブノード
# sever name  CPUs GPUs RAM Cost
# rt_M.large  8    0    800 0.4
# rt_M.small  4    0    400 0.2

#$-l rt_G.small=1
#$-l h_rt=6:00:00
#$-j y
#$-cwd
#$-m abe

source /etc/profile.d/modules.sh
module load gcc/9.3.0
module load python/3.8/3.8.7
source /groups/gcc50435/ito/bert-fine-tuning-sample/venv/bin/activate
module load cuda/11.0
module load cudnn/8.2/8.2.1
# module load nccl/2.9/2.9.9-1
# module load julia/1.5

# write exec command
python run_swag.py config.json
