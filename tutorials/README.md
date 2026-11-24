# MACEField tutorial index

These notebooks use the MACE-Field package from the `main` branch. In Colab, each setup cell clones the package and this tutorial repository; locally, clone them side by side or set `MACEFIELD_REPO` to the package checkout.

1. [MACE-Field introduction](../MACE_Field_Tutorial.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/MACE_Field_Tutorial.ipynb)
2. [Architecture and response derivatives](macefield/01_macefield_architecture.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/01_macefield_architecture.ipynb)
3. [Train on BaTiO₃ reference data](macefield/02_train_macefield_batio3.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/02_train_macefield_batio3.ipynb)
4. [Finite-field ASE molecular dynamics](macefield/03_finite_field_mlmd_hysteresis.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/03_finite_field_mlmd_hysteresis.ipynb)
5. [Explore the response datasets](macefield/04_response_datasets.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/04_response_datasets.ipynb)

The repository includes a copied BaTiO₃ reference split plus existing dielectric and ferroelectric dataset splits under `data/`. The response-data notebook inventories their labels and shows how to map those keys to MACEField training options. Read its coverage notes before interpreting raw polarization branches or model errors.
