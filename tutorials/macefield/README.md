# MACEField course

Each lesson is independent and can be opened in Colab or run from a local clone. Setup installs MACE-Field from the package `main` branch. The material notebooks include their required input data and specialist checkpoint; the foundation lesson downloads its pinned assets from the official 1.1.0 release.

1. [MACEField architecture and response derivatives](00_macefield_architecture.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/00_macefield_architecture.ipynb)
2. [BaTiO₃ training, polarization, BECs, and field MD](01_batio3_workflow.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/01_batio3_workflow.ipynb)
3. [SiO₂ training, dielectric response, Hessian, and 300 K spectra](02_sio2_workflow.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/02_sio2_workflow.ipynb)
4. [Analyze and fine-tune MACEField-MH-1](03_foundation_finetuning.ipynb) [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/03_foundation_finetuning.ipynb)

Training cells stream per-epoch validation loss and available RMSEs; MD cells print each step and save a trajectory that is visualized in the notebook. Python warning output is suppressed in notebook cells and training subprocesses. Calculator cells filter the known MACE dtype-conversion notice, and ASE calls use the current `temperature_K` APIs.

## BaTiO₃ data and limitations

The combined BTO notebook trains on a deterministic 12/4 subset of the 59-frame, 135-atom QE response dataset. The configurations are from Flare active learning, not AIMD. Its BTO response labels reach ±0.36 V/Å. The bundled checkpoint supports Ti-displacement response and a two-cycle sinusoidal-field MD demonstration at 5 K and 300 K thermostat targets. Strong-field work can raise the instantaneous temperature; inspect the plotted trace. The finite-rate, single-cell P–E loop is not a converged coercive-field measurement.

## α-quartz SiO₂ data and limitations

The combined SiO₂ notebook trains on a deterministic 24/8 subset of the 201-frame, 72-atom QE response dataset. Configurations came from classical MD at 300 K and 600 K, not AIMD. Later dielectric and Hessian calculations use the bundled specialist checkpoint and full response data. The spectroscopy section runs fixed-cell, zero-field Langevin MD at 300 K for 10 ps on GPU or 2.5 ps on CPU by default. The longer trajectory gives finer frequency resolution; plotted spectra use 12 cm⁻¹ Gaussian broadening for readability, while raw spectral arrays are retained. These spectra remain exploratory and need convergence checks. Hessians are calculated from the model rather than read as dataset labels.

## Foundation model

The MH-1 lesson loads the released MACEField foundation model (MACEField-MH-1) and its replay set from release 1.1.0. Its `pt_head` examples analyze BTO polarization and BECs across Ti displacements, then SiO₂ electronic and harmonic ionic dielectric response using BECs and a Hessian. Inference is the default; fine-tuning is opt-in because it requires additional download, GPU time, and memory.

The subset builder is available at [`scripts/build_training_subsets.py`](scripts/build_training_subsets.py). It records source indices and file checksums in [`training_subsets.json`](data/training_subsets.json). See [data provenance and checksums](data/README.md) and the [figure attribution](../figures/ATTRIBUTION.md).
