# MACEField course

Each lesson is independent and can be opened in Colab or run from a local clone. Setup installs MACE-Field from the package `main` branch. The material notebooks include their required input data and specialist checkpoint; the foundation lesson downloads its pinned assets from the official 1.1.0 release.

1. [MACEField architecture and response derivatives](00_macefield_architecture.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/00_macefield_architecture.ipynb)
2. [BaTiO₃ training, polarization, BECs, and field MD](01_batio3_workflow.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/01_batio3_workflow.ipynb)
3. [SiO₂ training, dielectric response, Hessian, and 300 K spectra](02_sio2_workflow.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/02_sio2_workflow.ipynb)
4. [Use and fine-tune MACEField-MH-1](03_foundation_finetuning.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/03_foundation_finetuning.ipynb)

## BaTiO₃ data and limitations

The combined BTO notebook trains on a deterministic 12/4 subset of the 59-frame, 135-atom QE response dataset. The configurations are from Flare active learning, not AIMD. The bundled checkpoint supports the Ti-displacement and short alternating-field MD examples. The available zero-field response labels and short trajectories do not establish hysteresis or switching accuracy.

## α-quartz SiO₂ data and limitations

The combined SiO₂ notebook trains on a deterministic 24/8 subset of the 201-frame, 72-atom QE response dataset. Configurations came from classical MD at 300 K and 600 K, not AIMD. Later dielectric and Hessian calculations use the bundled specialist checkpoint and full response data. The spectroscopy section runs fixed-cell, zero-field Langevin MD at 300 K; its default trajectory is short, so the spectra are exploratory and need convergence checks. Hessians are calculated from the model rather than read as dataset labels.

## Foundation model

The MH-1 lesson loads the released MACEField foundation model (MACEField-MH-1) and its replay set from release 1.1.0. Inference is the default; fine-tuning is opt-in because it requires additional download, GPU time, and memory.

The subset builder is available at [`scripts/build_training_subsets.py`](scripts/build_training_subsets.py). It records source indices and file checksums in [`training_subsets.json`](data/training_subsets.json). See [data provenance and checksums](data/README.md) and the [figure attribution](../figures/ATTRIBUTION.md).
