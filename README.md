# MACE-Field tutorials

This repository contains MACEField notebooks, response datasets, scripts, and Colab launchers. The notebooks install the MACE-Field package from its [`main` branch](https://github.com/mdi-group/mace-field/tree/main).

## Start here

- [MACE-Field introduction](MACE_Field_Tutorial.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/MACE_Field_Tutorial.ipynb)
- [MACEField architecture and response derivatives](tutorials/macefield/01_macefield_architecture.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/01_macefield_architecture.ipynb)
- [Train on BaTiO₃ reference data](tutorials/macefield/02_train_macefield_batio3.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/02_train_macefield_batio3.ipynb)
- [Finite-field ASE molecular dynamics](tutorials/macefield/03_finite_field_mlmd_hysteresis.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/03_finite_field_mlmd_hysteresis.ipynb)
- [Explore the dielectric and ferroelectric response datasets](tutorials/macefield/04_response_datasets.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/04_response_datasets.ipynb)

The response-data notebook inventories the existing dielectric and ferroelectric train, validation, and test files. The BaTiO₃ course data contain 59 periodic 135-atom structures in a fixed 48/11 train/validation split at one small positive field vector. The finite-field trajectory is a software workflow demonstration, not a validated hysteresis or coercive-field prediction.

In Colab, each notebook clones this package and the tutorial repository. For local use, clone both repositories side by side or set `MACEFIELD_REPO` to the package checkout.
