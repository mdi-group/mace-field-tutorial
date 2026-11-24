# MACEField course

Open these MACEField notebooks in Colab or run locally from the tutorial checkout with a sibling MACE-Field package checkout. In Colab the setup cell clones the package's `clean` branch and this repository's `main` branch, then installs MACE-Field in editable mode.

1. [Architecture and response derivatives](01_macefield_architecture.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/01_macefield_architecture.ipynb)
2. [Train on BaTiO₃ reference data](02_train_macefield_batio3.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/02_train_macefield_batio3.ipynb)
3. [Finite-field ASE molecular dynamics](03_finite_field_mlmd_hysteresis.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/03_finite_field_mlmd_hysteresis.ipynb)
4. [Explore the dielectric and ferroelectric datasets](04_response_datasets.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/04_response_datasets.ipynb)

Notebook 02 defaults to a short 10-epoch Colab demonstration. Notebook 03 accepts the resulting checkpoint by upload when it runs in a fresh runtime. The response-dataset notebook uses the existing dielectric and ferroelectric train, validation, and test files in the repository root and reports their stored label keys and splits.

The BaTiO₃ reference set has 59 periodic 135-atom configurations in a fixed 48/11 train/validation split. Every frame has the same small positive field vector, so its finite-field trajectory is exploratory and does not validate field reversal, switching, or a coercive field. See [BaTiO₃ data provenance and split checksums](data/README.md).
