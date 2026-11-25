# Tutorial data and provenance

The training lessons use small, reproducible subsets of the bundled QE response datasets. Every subset keeps the source energy, force, stress, polarization, BEC, and polarizability labels. The source structures are not AIMD trajectories: BTO configurations came from Flare active learning, and quartz configurations came from classical MD. The [source workflow notes](https://github.com/mir-group/allegro-pol/blob/main/scripts/1.CalculatorQE/README.md) document these origins. Quantum ESPRESSO calculations provide the electronic labels through the [QE response parser](https://github.com/mir-group/allegro-pol/blob/main/scripts/2.ParseQE/parse_QE.py).

## BaTiO₃ QE response data

`macefield_batio3_reference.extxyz` contains 59 periodic structures with 135 atoms each. Energy, forces, stress, and polarization are zero-field labels. BECs and polarizability are finite-field response labels on those same fixed geometries, with the BTO response-field range reaching ±0.36 V/Å. The stored `REF_electric_field` tag is zero because the direct energy, force, and polarization labels are evaluated at zero field; it does not encode the perturbation range used to form the response derivatives. The earlier copy tagged these zero-field labels with a nonzero field and has been replaced by the coherent zero-field version.

The full file is split into 48 training and 11 validation frames for the foundation fine-tuning lesson. The combined BaTiO₃ notebook uses a smaller 12/4 subset selected evenly within those fixed splits. There is no independent test split. The BTO tutorial subset has response labels spanning the finite-field perturbation range, but it does not contain a field-cycled MD trajectory or a labeled switching path; it is not an AIMD dataset.

## α-quartz SiO₂ QE response data

`sio2/SiO2-preprocessed.extxyz` contains 201 periodic, 72-atom structures with zero-field energy, forces, stress, and polarization labels plus BEC and electronic-susceptibility derivatives computed from small finite-field QE calculations on the same fixed geometries. It combines configurations from classical MD trajectories at 300 K and 600 K, followed by QE response calculations; it is not AIMD. Hessians are not stored labels and are calculated from the bundled model in the combined SiO₂ notebook.

The combined SiO₂ notebook uses 24 training and 8 validation frames. Both temperatures occur in both splits. Validation frames are selected from later blocks of each source trajectory to reduce adjacent-frame leakage. The later dielectric, Hessian, and spectroscopy sections use the full data file and bundled specialist checkpoint; they do not depend on a model produced by the compact training demonstration. The 300 K spectroscopy run defaults to 10 ps on GPU; plotted spectra use 12 cm⁻¹ Gaussian display broadening, while the saved frequency arrays remain unbroadened.

## Reproducing the training subsets

Run `python tutorials/macefield/scripts/build_training_subsets.py` from the repository root. The script uses the fixed source split and source-frame blocks documented in [training_subsets.json](training_subsets.json). It preserves the original labels and writes the four small ExtXYZ files listed there. SHA-256 values and exact source indices are recorded in the same manifest.

## Checksums

| File | SHA-256 |
| --- | --- |
| `macefield_batio3_reference.extxyz` | `ed51b4577ad6579e129f9e23f7f0d13c42f40ae7ae9a988a8f2f8a425eb7b9c0` |
| `macefield_batio3_reference_train.extxyz` | `bf087d186722a59bcb2ff4ac81f7216cd724f6b72bc0fbb2190d44294124e470` |
| `macefield_batio3_reference_valid.extxyz` | `94b47f44df434fdf6eb066dab5da37df027655df7ef0e083d71e460df23fbe40` |
| `batio3/batio3_qe_train_sample.extxyz` | `254b0e2123025c27e2dc94925563221aae12a983e9a92e99de6f234f0d8003f6` |
| `batio3/batio3_qe_valid_sample.extxyz` | `3a3deb0f01b7ec692ff9f07f43d1617addae077125a64dd2ef9e3056042a1dc4` |
| `batio3/MACE-Field-BaTiO3.model` | `b056334519f583e58120bbf86807e0dea824fd80f32025b89571d626ec124793` |
| `sio2/SiO2-preprocessed.extxyz` | `170f4ce4ab165410f835a8c9b88447f4150ceb2974922a4baf32fd4d61bf8886` |
| `sio2/quartz_qe_train_sample.extxyz` | `22d9466afc851f2d0aea1c9d14b8aad84e96efc82f80e292543da92bf4337ff0` |
| `sio2/quartz_qe_valid_sample.extxyz` | `8937339634a40cfdb306ccad1a5a2b89f9d775a0fc1a1dc59ba1190364d8e9a9` |
| `sio2/MACE-field-SiO2.model` | `d86405849cda7c892bbeeb6fc6161d219639fc0d51637604ee103b6a8e4623f8` |

The 48/11 BTO split and its label provenance are documented in [macefield_batio3_reference_split.json](macefield_batio3_reference_split.json). The architecture illustration attribution is in [ATTRIBUTION.md](../../figures/ATTRIBUTION.md).

## Foundation assets

The foundation lesson downloads the official [MACE-Field 1.1.0 release](https://github.com/mdi-group/mace-field/releases/tag/1.1.0) and checks both files against pinned SHA-256 values before use. It places `MACEField-MH-1.model` (SHA-256 `3e654f1cd043df8df68002f7d7eec626b3e9dce7763dedbbf3710188bff048d0`) and `MACEField-MH-1-replay-set.extxyz` (SHA-256 `ecd678fff40a7e31033197bef52d39e9a2f52603532e2f5ae4e871aa368a1166`) into the ignored `runs/foundation_assets/` directory; these large release assets are not copied into this repository.
