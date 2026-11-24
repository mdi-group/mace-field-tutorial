# MACEField course

Open each notebook directly in Colab, or run locally with this tutorial checkout and a sibling MACE-Field package checkout. In Colab the setup cell clones the package's `clean` branch and the `main` branch of this repository, then installs MACE-Field in editable mode.

1. [Architecture and response derivatives](01_macefield_architecture.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/01_macefield_architecture.ipynb)
2. [Train on BaTiO₃ reference data](02_train_macefield_batio3.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/02_train_macefield_batio3.ipynb)
3. [Finite-field ASE molecular dynamics](03_finite_field_mlmd_hysteresis.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/03_finite_field_mlmd_hysteresis.ipynb)

Notebook 02 defaults to 10 epochs in Colab for a short code-path demonstration; set `MACEFIELD_TUTORIAL_EPOCHS=100` for the longer fit. Notebook 03 accepts the checkpoint from notebook 02 by upload when it runs in a separate Colab runtime. Colab files are temporary unless downloaded.

The copied reference set has 59 periodic 135-atom configurations and a fixed 48/11 train/validation split. The frames share one small positive electric-field vector, so the labels do not validate field reversal or switching. The finite-field trajectory is a software workflow example, not a physical hysteresis prediction. See [data provenance and split checksums](data/README.md).
