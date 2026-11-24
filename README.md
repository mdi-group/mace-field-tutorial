# MACEField tutorials

This repository contains four MACEField-only, standalone lessons. Each notebook has a Colab badge and installs MACE-Field from its `main` branch. Data and specialist checkpoints required by the material workflows are bundled here; the foundation-model lesson downloads and checksum-verifies its release assets.

1. [MACEField architecture and response derivatives](tutorials/macefield/00_macefield_architecture.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/00_macefield_architecture.ipynb)
2. [BaTiO₃ training, polarization, BECs, and field MD](tutorials/macefield/01_batio3_workflow.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/01_batio3_workflow.ipynb)
3. [SiO₂ training, dielectric response, Hessian, and 300 K spectra](tutorials/macefield/02_sio2_workflow.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/02_sio2_workflow.ipynb)
4. [Use and fine-tune MACEField-MH-1](tutorials/macefield/03_foundation_finetuning.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/03_foundation_finetuning.ipynb)

The BTO structures are from Flare active learning, and the quartz structures are from classical MD at 300 K and 600 K; neither response dataset is AIMD. See the [course guide](tutorials/macefield/README.md) and [data provenance and checksums](tutorials/macefield/data/README.md) before interpreting the examples.
