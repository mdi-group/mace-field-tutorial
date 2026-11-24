#!/usr/bin/env bash
set -euo pipefail
TUTORIAL_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
MACEFIELD_REPO="${MACEFIELD_REPO:-$TUTORIAL_ROOT/../mace-field}"
DATA="$TUTORIAL_ROOT/tutorials/data"
PYTHON="${PYTHON:-python}"
export MACEFIELD_REPO
export PYTHONPATH="$MACEFIELD_REPO:$TUTORIAL_ROOT${PYTHONPATH:+:$PYTHONPATH}"
"$PYTHON" "$TUTORIAL_ROOT/tutorials/scripts/bootstrap.py" --feature=base
OUT="${OUT_DIR:-$TUTORIAL_ROOT/tutorials/models/maceles_short_range}"
mkdir -p "$OUT"

# Matched local control for the LES comparison: same structures, labels,
# cutoff, hidden irreps, interactions, seed, optimizer defaults, and schedule.
"$PYTHON" "$MACEFIELD_REPO/mace/cli/run_train.py" \
  --name=MACELES-short-range-control --model=MACE --loss=weighted \
  --hidden_irreps="32x0e + 32x1o + 32x2e" --num_interactions=2 --r_max=5.0 \
  --train_file="$DATA/maceles_water_dimer_train.extxyz" \
  --valid_file="$DATA/maceles_water_dimer_valid.extxyz" --valid_fraction=0 \
  --E0s="{1: 0.0, 8: 0.0}" \
  --energy_key=REF_energy --forces_key=REF_forces \
  --energy_weight=1 --forces_weight=10 --stress_weight=0 \
  --batch_size="${BATCH_SIZE:-8}" --valid_batch_size=8 \
  --max_num_epochs="${EPOCHS:-100}" --eval_interval=10 --default_dtype=float64 \
  --device="${DEVICE:-cpu}" --seed=24 \
  --model_dir="$OUT" --checkpoints_dir="$OUT" --log_dir="$OUT" \
  --results_dir="$OUT" --work_dir="$OUT"
