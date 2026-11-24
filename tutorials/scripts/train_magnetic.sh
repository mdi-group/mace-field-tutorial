#!/usr/bin/env bash
set -euo pipefail
TUTORIAL_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
MACEFIELD_REPO="${MACEFIELD_REPO:-$TUTORIAL_ROOT/../mace-field}"
DATA="$TUTORIAL_ROOT/tutorials/data"
PYTHON="${PYTHON:-python}"
export MACEFIELD_REPO
export PYTHONPATH="$MACEFIELD_REPO:$TUTORIAL_ROOT${PYTHONPATH:+:$PYTHONPATH}"
"$PYTHON" "$TUTORIAL_ROOT/tutorials/scripts/bootstrap.py" --feature=base,magnetic
OUT="${OUT_DIR:-$TUTORIAL_ROOT/tutorials/models/magnetic}"
mkdir -p "$OUT"

"$PYTHON" "$MACEFIELD_REPO/mace/cli/run_train.py" \
  --name=MagneticMACE-toy --model=MagneticScaleShiftMACE \
  --interaction_first=MagneticRealAgnosticSpinOrbitCoupledDensityInteractionBlock \
  --interaction=MagneticRealAgnosticSpinOrbitCoupledDensityInteractionBlock \
  --hidden_irreps=32x0e --num_interactions=2 --r_max=4.8 \
  --train_file="$DATA/magnetic_fe2_train.extxyz" \
  --valid_file="$DATA/magnetic_fe2_valid.extxyz" --valid_fraction=0 \
  --E0s="{26: 0.0}" \
  --energy_key=REF_energy --forces_key=REF_forces \
  --magmom_key=REF_magmom --magforces_key=REF_magforces \
  --m_max=4.0 --max_m_ell=1 --num_mag_radial_basis=8 \
  --loss=universal --energy_weight=1 --forces_weight=10 --magforces_weight=1 \
  --compute_magforces=True --compute_stress=False --stress_weight=0 \
  --batch_size="${BATCH_SIZE:-8}" --valid_batch_size=8 \
  --max_num_epochs="${EPOCHS:-100}" --eval_interval=10 --default_dtype=float64 \
  --device="${DEVICE:-cpu}" --seed=22 \
  --model_dir="$OUT" --checkpoints_dir="$OUT" --log_dir="$OUT" \
  --results_dir="$OUT" --work_dir="$OUT"
