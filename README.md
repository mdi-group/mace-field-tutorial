# MACE-Field tutorials

This repository contains runnable MACE-Field notebooks, tutorial datasets, figures, scripts, and Colab launchers. The notebooks install the MACE-Field package from its [`clean` branch](https://github.com/mdi-group/mace-field/tree/clean).

## Start here

- [MACE-Field introduction](MACE_Field_Tutorial.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/MACE_Field_Tutorial.ipynb)
- [MACEField architecture and response derivatives](tutorials/macefield/01_macefield_architecture.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/01_macefield_architecture.ipynb)
- [Train on BaTiO₃ reference data](tutorials/macefield/02_train_macefield_batio3.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/02_train_macefield_batio3.ipynb)
- [Finite-field ASE molecular dynamics](tutorials/macefield/03_finite_field_mlmd_hysteresis.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/03_finite_field_mlmd_hysteresis.ipynb)
- [Extending MACE lab](tutorials/extending_mace.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/extending_mace.ipynb)

The notebooks clone the package and tutorial repositories in Colab. For local use, clone both repositories side by side or set `MACEFIELD_REPO` to the package checkout. The MACEField course data are documented in [the course notes](tutorials/macefield/README.md); they cover 59 periodic 135-atom structures in a 48/11 training/validation split at one small positive field vector. The finite-field trajectory is a software workflow demonstration, not a validated hysteresis or coercive-field prediction.

The broader extension lab compares field-conditioned MACE, atomic dipoles, magnetic MACE, and MACELES on small teaching examples. Those analytic toy fits exercise software interfaces and are not accuracy benchmarks. Missing teaching checkpoints train on demand in Colab and are stored in its temporary runtime unless downloaded.
