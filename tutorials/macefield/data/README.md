# BaTiO₃ reference data

This standalone MACEField course includes a real calculated reference dataset copied from `MACEField_dev/BaTiO3/BaTiO3-preprocessed.xyz`. It contains 59 periodic configurations with 135 atoms per frame. The labels include energy, forces, stress, polarization, Born effective charges, susceptibility, and electric field. They are stored calculation results, not tutorial-generated analytic labels or experimental measurements.

The original preprocessing notebook was `MACEField_dev/BaTiO3/process-BaTiO3-data.ipynb`, and the validation split follows `MACEField_dev/BaTiO3/valid_indices_23.txt`: 48 training frames and 11 validation frames, with no independent test split. The manifest records the source SHA-256 (`d4eca5615550ef65570341f66c8313a6253b56727f74ae1d3d21ba7fbd693150`), split indices, and copied-file checksums.

All frames carry the same field vector, `[0.0036, 0.0036, 0.0036] V/Å`. These data support held-out structural evaluation at one field tag. They do not validate field reversal, field transfer, a switching path, or hysteresis. The local source files do not identify the electronic-structure code or functional, so this course makes no method attribution.
