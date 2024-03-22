#!/bin/bash
model_name='cf_mimic'
exp_name=$model_name'-cfg10'
parents='a_r_s_f'
mkdir -p "../../checkpoints/$parents/$exp_name"


run_cmd="python train_cf.py \
    --exp_name=$exp_name \
    --dataset mimic \
    --data_dir=/home/ubuntu/mimic/ \
    --pgm_path=/home/ubuntu/a_r_s_f/pgm_mimicg-pgmg/checkpoint.pt \
    --predictor_path=/home/ubuntu/a_r_s_f/aux_mimic-aux-g/checkpoint.pt \
    --vae_path=/home/ubuntu/causal-geng/checkpoints/a_r_s_f/mimic1g192/checkpoint.pt \
    --parents_x = age race sex finding \
    --lr=5e-5 \
    --bs=8 \
    --wd=0.1 \
    --eval_freq=1 \
    --plot_freq=2 \
    --do_pa=None \
    --alpha=0.1 \
    --seed=7"

${run_cmd}

# if [ "$2" = "nohup" ]
# then
#   nohup ${run_cmd} > $exp_name.out 2>&1 &
#   echo "Started training in background with nohup, PID: $!"
# else
#   ${run_cmd}
# fi

# srun python train_cf.py \
#     --data_dir='../ukbb' \
#     --exp_name=$exp_name \
#     --pgm_path='../../checkpoints/sup_pgm/checkpoint.pt' \
#     --predictor_path='../../checkpoints/sup_aux_prob/checkpoint.pt' \
#     --vae_path='../../checkpoints/$parents/$model_name/checkpoint.pt' \
#     --lr=1e-4 \
#     --bs=32 \
#     --wd=0.1 \
#     --eval_freq=1 \
#     --plot_freq=500 \
#     --do_pa=None \
#     --alpha=0.1 \
#     --seed=7