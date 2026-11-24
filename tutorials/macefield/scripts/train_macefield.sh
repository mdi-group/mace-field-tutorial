#!/usr/bin/env bash
set -euo pipefail

TUTORIAL_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
MACEFIELD_REPO="${MACEFIELD_REPO:-$TUTORIAL_ROOT/../mace-field}"
DATA="$TUTORIAL_ROOT/tutorials/macefield/data"
PYTHON="${PYTHON:-python}"
export MACEFIELD_REPO
export PYTHONPATH="$MACEFIELD_REPO:$TUTORIAL_ROOT${PYTHONPATH:+:$PYTHONPATH}"

OUT="${OUT_DIR:-$TUTORIAL_ROOT/tutorials/macefield/runs/bto_macefield_training}"
FORCES_WEIGHT="${FORCES_WEIGHT:-100}"
COMPUTE_BECS="${COMPUTE_BECS:-False}"
COMPUTE_POLARIZABILITY="${COMPUTE_POLARIZABILITY:-False}"
BECS_WEIGHT="${BECS_WEIGHT:-0}"
POLARIZABILITY_WEIGHT="${POLARIZABILITY_WEIGHT:-0}"
mkdir -p "$OUT"

"$PYTHON" "$MACEFIELD_REPO/mace/cli/run_train.py" \
  --name=MACEField-BaTiO3-reference --model=MACEField --loss=universal_field \
  --hidden_irreps="32x0e + 32x1o" --num_interactions=2 --r_max=5.0 \
  --train_file="$DATA/macefield_batio3_reference_train.extxyz" \
  --valid_file="$DATA/macefield_batio3_reference_valid.extxyz" --valid_fraction=0 \
  --energy_key=REF_energy --forces_key=REF_forces \
  --electric_field_key=REF_electric_field --polarization_key=REF_polarization \
  --becs_key=REF_becs --polarizability_key=REF_polarizability \
  --compute_forces=True --compute_stress=False --compute_polarization=True \
  --compute_becs="$COMPUTE_BECS" --compute_polarizability="$COMPUTE_POLARIZABILITY" \
  --energy_weight=1 --forces_weight="$FORCES_WEIGHT" --polarization_weight=10 \
  --becs_weight="$BECS_WEIGHT" --polarizability_weight="$POLARIZABILITY_WEIGHT" --stress_weight=0 \
  --E0s=average \
  --batch_size="${BATCH_SIZE:-1}" --valid_batch_size=1 \
  --max_num_epochs="${EPOCHS:-100}" --eval_interval=10 --default_dtype=float64 \
  --device="${DEVICE:-cpu}" --seed=23 \
  --model_dir="$OUT" --checkpoints_dir="$OUT" --log_dir="$OUT" \
  --results_dir="$OUT" --work_dir="$OUT" --save_cpu
