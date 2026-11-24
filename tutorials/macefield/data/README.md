# Tutorial data and checkpoints

The notebook sequence carries the inputs it needs. Generated models and trajectories are written under `tutorials/macefield/runs/`, which is ignored by Git.

## BaTiO₃ analytic teaching set

The five-atom train/validation files and `MACEField-Landau.model` are copied from the MACEField section of [Neutrino155/MACE_tutorials](https://github.com/Neutrino155/MACE_tutorials/tree/main/MACE_extensions). They contain 345 training and 132 validation structures spanning Ti displacements and positive and negative z-directed fields. Energy, force, and polarization labels come from a fixed-cell analytic Landau model. There are no BEC labels; BECs in the single-point lesson are model-derived.

| File | SHA-256 |
| --- | --- |
| `batio3/macefield_batio3_toy_train.extxyz` | `2f63e0a24e393c1d3de770bc079780eed1ac9c65a3c258c318c2a041231c70c8` |
| `batio3/macefield_batio3_toy_valid.extxyz` | `4d1a968074cccf1d352ba30d131d1343624f95c43d60111ef8d36de0373c10b2` |
| `batio3/MACEField-Landau.model` | `7c9277863364a0662ce99e84dc15a04104f341438b4260e8a0ad85758fb65fd7` |

## BaTiO₃ reference response split

The 59-frame reference file and 48/11 train/validation split are described in [macefield_batio3_reference_split.json](macefield_batio3_reference_split.json). Frames contain 135 atoms and energy, forces, stress, polarization, BEC, and polarizability labels with one shared field vector, `[0.0036, 0.0036, 0.0036] V/Å`. The source files do not identify the electronic-structure code or functional, and there is no independent test split. This dataset is used only as the target data in the foundation fine-tuning example.

## α-quartz SiO₂ response set

The preprocessed zero-field dataset and specialist checkpoint are copied from the α-quartz workflow in [mdi-group/2025-04-mace-field](https://github.com/mdi-group/2025-04-mace-field/tree/main/scripts/SiO2). The file has 201 frames of 72-atom α-quartz structures. It stores energy, forces, stress, polarization, BEC, and volume-normalized electronic susceptibility. It does not contain Hessian labels.

| File | SHA-256 |
| --- | --- |
| `sio2/SiO2-preprocessed.extxyz` | `170f4ce4ab165410f835a8c9b88447f4150ceb2974922a4baf32fd4d61bf8886` |
| `sio2/MACE-field-SiO2.model` | `d86405849cda7c892bbeeb6fc6161d219639fc0d51637604ee103b6a8e4623f8` |

## Foundation assets

The foundation lesson downloads the official [MACE-Field 1.0.2 release](https://github.com/mdi-group/mace-field/releases/tag/1.0.2) into the ignored `runs/foundation_assets/` directory and checks both files against pinned SHA-256 values before use. The model and replay dataset are therefore independent inputs to that notebook and are not copied into this tutorial repository.

## Figure

The architecture illustration attribution is recorded in [ATTRIBUTION.md](../../figures/ATTRIBUTION.md).
