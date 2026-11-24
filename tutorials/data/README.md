# Tutorial data

## Other extension-lab data

Run `python tutorials/scripts/prepare_teaching_data.py` from the repository root to regenerate the analytic extension-lab datasets. These small examples exercise software interfaces; they are not DFT or experimental labels.

| Files | Structure and target | Label source |
|---|---|---|
| `atomicdipoles_water_*.extxyz` | Neutral gas-phase water; `REF_dipoles` in e Å | Fixed charges `q(O)=-0.8e`, `q(H)=+0.4e` |
| `magnetic_fe2_*.extxyz` | Fe dimer; `REF_magmom`, `REF_magforces`, energy, forces | Exponential pair repulsion plus exchange `J(r) m1·m2` |
| `maceles_water_dimer_*.extxyz` | Two rigid water molecules; energy and forces | Fixed-charge Coulomb energy plus a short-range O–O repulsion |

The analytic labels make these labs small enough for short training exercises. They are not evidence of chemical accuracy, transferability, or a physically meaningful latent-charge partition.

The copied BaTiO₃ reference data used by the MACEField course are stored once in [`macefield/data/`](../macefield/data/README.md), alongside their split, provenance manifest, and checksums.
