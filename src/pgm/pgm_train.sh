#!/bin/bash
model_name='pgm_mimicg'
exp_name=$model_name'-pgmg'
parents='a_r_s_f'
mkdir -p "../../checkpoints/$parents/$exp_name"


run_cmd="python train_pgm.py \
    --exp_name=$exp_name \
    --dataset mimic \
    --data_dir=/home/ubuntu/mimic/ \
    --hps mimic384 \
    --setup sup_pgm \
    --parents_x age race sex finding \
    --context_dim=16 \
    --concat_pa \
    --lr=0.001 \
    --bs=32 \ "

if [ "$2" = "nohup" ]
then
  nohup ${run_cmd} > $exp_name.out 2>&1 &
  echo "Started training in background with nohup, PID: $!"
else
  ${run_cmd}
fi