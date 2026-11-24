# MACEField course

Every notebook is a standalone lesson. Open any one in Colab, or run it from this repository locally. Each setup cell installs MACE-Field from the package's `main` branch. Local users can set `MACEFIELD_REPO` to a checkout on `main`; otherwise the setup uses a sibling main checkout or clones the package into a temporary directory.

## BaTiO₃

1. [Train MACEField on BaTiO₃](01_train_batio3.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/01_train_batio3.ipynb)
2. [Ti displacement, polarization, and BECs](02_batio3_single_point.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/02_batio3_single_point.ipynb)
3. [Finite-field MD and hysteresis-style loops](03_batio3_finite_field_md.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/03_batio3_finite_field_md.ipynb)

The fast five-atom teaching set is generated from an analytic fixed-cell Landau surface. Its labels are not DFT or experiment. BECs in the single-point lesson are model derivatives without BEC supervision, and the MD loop is illustrative rather than a validated material prediction.

The foundation fine-tuning lesson uses a different, bundled 48/11 split of 135-atom BaTiO₃ response structures. All frames have the same small positive field tag; this split does not validate field reversal or switching.

## α-quartz SiO₂

4. [Train on the SiO₂ response dataset](04_train_sio2.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/04_train_sio2.ipynb)
5. [Single-point dielectric response, BECs, Hessian, and ionic dielectric](05_sio2_dielectric_hessian.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/05_sio2_dielectric_hessian.ipynb)
6. [Zero-field MD and frequency-dependent spectra](06_sio2_md_spectroscopy.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/06_sio2_md_spectroscopy.ipynb)

The 201-frame, 72-atom SiO₂ file has zero-field energy, force, stress, polarization, BEC, and electronic-susceptibility labels. The Hessian is calculated from the bundled model because it is not a stored dataset label. The MD lesson derives exploratory frequency-dependent dielectric, IR, and Raman curves from polarization and susceptibility autocorrelations. Increase trajectory length and check convergence before interpreting spectra quantitatively.

## MACEField foundation model

7. [Run the released foundation model and fine-tune a BTO head](07_foundation_finetuning.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/07_foundation_finetuning.ipynb)

The notebook downloads and checksum-verifies the official release checkpoint and replay data. Foundation inference runs by default. The multi-head fine-tuning step is opt-in and uses a new `ft_head`, replay pseudolabels, and inherited foundation energy shifts.

## Optional reference lessons

- [Architecture and response derivatives](00_macefield_architecture.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/00_macefield_architecture.ipynb)
- [Dataset catalog](08_response_dataset_catalog.ipynb) — [Open in Colab](https://colab.research.google.com/github/mdi-group/mace-field-tutorial/blob/main/tutorials/macefield/08_response_dataset_catalog.ipynb)
- [Standalone training shell script for the 135-atom BTO reference split](scripts/train_macefield.sh)

See [data provenance and checksums](data/README.md) before interpreting these outputs.
