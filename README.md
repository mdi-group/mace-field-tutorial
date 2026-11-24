# MACEField tutorials

These tutorials cover MACEField only. Each notebook can be opened and run on its own in Colab or from a local clone. It installs the package from the MACE-Field `main` branch and loads its own bundled data and checkpoint, or downloads the foundation assets inside the foundation lesson.

## BaTiO₃

1. [Train a compact model](tutorials/macefield/01_train_batio3.ipynb) — [Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/01_train_batio3.ipynb)
2. [Shift Ti and inspect polarization and BECs](tutorials/macefield/02_batio3_single_point.ipynb) — [Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/02_batio3_single_point.ipynb)
3. [Finite-field MD at two temperatures](tutorials/macefield/03_batio3_finite_field_md.ipynb) — [Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/03_batio3_finite_field_md.ipynb)

The compact BaTiO₃ train/validation set is an analytic teaching example, not DFT or experimental data. Its model-derived BECs are not supervised by BEC labels, and its hysteresis-style trajectories are not quantitative predictions.

## α-quartz SiO₂

4. [Train on the SiO₂ response data](tutorials/macefield/04_train_sio2.ipynb) — [Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/04_train_sio2.ipynb)
5. [Dielectric response, BECs, Hessian, and ionic dielectric](tutorials/macefield/05_sio2_dielectric_hessian.ipynb) — [Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/05_sio2_dielectric_hessian.ipynb)
6. [Zero-field MD, dielectric function, IR, and Raman](tutorials/macefield/06_sio2_md_spectroscopy.ipynb) — [Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/06_sio2_md_spectroscopy.ipynb)

Training reads the bundled 201-frame data. The dielectric and spectroscopy notebooks each load a separate bundled SiO₂ checkpoint, so neither needs the training notebook's model output. Hessians are computed from the model; they are not stored labels. Short MD spectra are workflow demonstrations and need longer trajectories and convergence checks for scientific use.

## Foundation model

7. [Use and fine-tune the MACEField foundation model](tutorials/macefield/07_foundation_finetuning.ipynb) — [Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/07_foundation_finetuning.ipynb)

This notebook downloads and checksum-verifies the released model and replay data before inference. Fine-tuning is opt-in because it can require substantial GPU time and memory.

See the [full tutorial guide](tutorials/macefield/README.md), [data provenance and checksums](tutorials/macefield/data/README.md), or the optional [architecture introduction](tutorials/macefield/00_macefield_architecture.ipynb) and [response-dataset catalog](tutorials/macefield/08_response_dataset_catalog.ipynb).
