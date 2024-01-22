#!/bin/bash
exp_name="mimic1"
run_cmd="python main.py \
    --exp_name=$exp_name \
    --data_dir=/home/ubuntu/mimic/ \
    --csv_dir=/home/ubuntu/mimic/ \
    --hps mimic192 \
    --parents_x age race sex finding \
    --context_dim=6 \
    --concat_pa \
    --lr=0.001 \
    --bs=24 \
    --wd=0.05 \
    --beta=9 \
    --x_like=ydiag_dgauss \
    --z_max_res=96 \
    --eval_freq=4"
# srun python main.py \
#     --data_dir='mimic-cxr-jpg-224/data/' \
#     --csv_dir='mimic_meta' \
#     --use_dataset='mimic' \
#     --hps mimic192 \
#     --exp_name=$exp_name \
#     --parents_x age race sex finding\
#     --context_dim=6 \
#     --lr=1e-3 \
#     --bs=24 \
#     --wd=0.05 \
#     --beta=9 \
#     --x_like='diag_dgauss' \
#     --z_max_res=96 \
#     --eval_freq=2
# run_cmd="python main.py \
#     --exp_name=$exp_name \
#     --data_dir=/data2/ukbb \
#     --hps ukbb192 \
#     --parents_x mri_seq brain_volume ventricle_volume sex \
#     --context_dim=4 \
#     --concat_pa \
#     --lr=0.001 \
#     --bs=32 \
#     --wd=0.05 \
#     --beta=5 \
#     --x_like=diag_dgauss \
#     --z_max_res=96 \
#     --eval_freq=4"

if [ "$2" = "nohup" ]
then
  nohup ${run_cmd} > $exp_name.out 2>&1 &
  echo "Started training in background with nohup, PID: $!"
else
  ${run_cmd}
fi