# Tutorial index

These notebooks install MACE-Field from the package repository's `clean` branch. In Colab, each notebook clones the package and tutorial repositories; locally, clone them side by side or set `MACEFIELD_REPO` to the package checkout.

## MACEField course

1. [Architecture and response derivatives](macefield/01_macefield_architecture.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/01_macefield_architecture.ipynb)
2. [Train on BaTiO₃ reference data](macefield/02_train_macefield_batio3.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/02_train_macefield_batio3.ipynb)
3. [Finite-field ASE molecular dynamics](macefield/03_finite_field_mlmd_hysteresis.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/03_finite_field_mlmd_hysteresis.ipynb)

The BaTiO₃ reference set contains 59 periodic 135-atom configurations and a fixed 48/11 train/validation split. Every frame has the same small positive field vector, so the finite-field trajectory is exploratory and does not validate field reversal, hysteresis, or a coercive field. See the [course notes and data provenance](macefield/README.md).

## MACE extension lab

[Extending MACE](extending_mace.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/extending_mace.ipynb)

The longer lab compares MACEField, atomic dipoles, magnetic MACE, and MACELES. Missing toy checkpoints train on demand in Colab. The non-BTO examples use analytic teaching labels for software demonstrations, not accuracy benchmarks.
