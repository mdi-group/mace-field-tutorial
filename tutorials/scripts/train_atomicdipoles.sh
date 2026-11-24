#!/usr/bin/env bash
set -euo pipefail
TUTORIAL_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
MACEFIELD_REPO="${MACEFIELD_REPO:-$TUTORIAL_ROOT/../mace-field}"
DATA="$TUTORIAL_ROOT/tutorials/data"
PYTHON="${PYTHON:-python}"
export MACEFIELD_REPO
export PYTHONPATH="$MACEFIELD_REPO:$TUTORIAL_ROOT${PYTHONPATH:+:$PYTHONPATH}"
"$PYTHON" "$TUTORIAL_ROOT/tutorials/scripts/bootstrap.py" --feature=base
OUT="${OUT_DIR:-$TUTORIAL_ROOT/tutorials/models/atomicdipoles}"
mkdir -p "$OUT"

"$PYTHON" "$MACEFIELD_REPO/mace/cli/run_train.py" \
  --name=AtomicDipolesMACE-toy \
  --model=AtomicDipolesMACE --loss=dipole --error_table=DipoleRMSE \
  --train_file="$DATA/atomicdipoles_water_train.extxyz" \
  --valid_file="$DATA/atomicdipoles_water_valid.extxyz" --valid_fraction=0 \
  --E0s="{1: 0.0, 8: 0.0}" \
  --dipole_key=REF_dipoles --dipole_weight=1 \
  --compute_atomic_dipole=True --num_channels=32 --max_L=1 --r_max=4.5 \
  --batch_size="${BATCH_SIZE:-8}" --valid_batch_size=8 \
  --max_num_epochs="${EPOCHS:-100}" --eval_interval=10 --default_dtype=float64 \
  --device="${DEVICE:-cpu}" --seed=21 \
  --model_dir="$OUT" --checkpoints_dir="$OUT" --log_dir="$OUT" \
  --results_dir="$OUT" --work_dir="$OUT"
