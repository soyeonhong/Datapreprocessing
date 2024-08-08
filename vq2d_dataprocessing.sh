#!/bin/bash

#SBATCH --job-name vq2d_dataprocessing_val
#SBATCH --gres=gpu:4
#SBATCH --cpus-per-gpu=8
#SBATCH --mem-per-gpu=29G
#SBATCH --partition batch_vll
#SBATCH -w  vll4
#SBATCH -t 3-0
#SBATCH -e slurm/logs/slurm-%A_%x.err
#SBATCH -o slurm/logs/slurm-%A_%x.out

# Extract clips (should take 12-24 hours on a machine with 80 CPU cores)
python convert_videos_to_clips.py \
    --annot-paths /data/dataset/ego4d_temp/ego4d_data/v2/annotations/vq_val.json \
    --save-root /data/dataset/ego4d_temp/ego4d_data/v2/vq2d_clips \
    --ego4d-videos-root /data/dataset/ego4d_temp/ego4d_data/v2/video_540ss \
    --num-workers 16 \
    --video-batch-size 20


# python convert_videos_to_images.py \
#     --annot-paths /data/dataset/ego4d_temp/ego4d_data/v2/annotations/vq_train.json \
#     --save-root /data/dataset/ego4d_temp/ego4d_data/v2/vq2d_images \
#     --ego4d-videos-root /data/dataset/ego4d_temp/ego4d_data/v2/video_540ss \
#     --num-workers 16
