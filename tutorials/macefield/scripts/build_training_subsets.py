#!/usr/bin/env python3
"""Build small, deterministic training subsets from the bundled QE data."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import numpy as np
from ase.io import read, write


HERE = Path(__file__).resolve().parents[1]
DATA = HERE / "data"


def evenly_spaced_indices(indices: list[int], count: int) -> list[int]:
    """Pick sorted, unique indices covering the full available range."""
    if count > len(indices):
        raise ValueError(f"Cannot choose {count} frames from {len(indices)} candidates")
    positions = np.rint(np.linspace(0, len(indices) - 1, count)).astype(int)
    selected = [indices[position] for position in positions]
    if len(set(selected)) != count:
        raise ValueError("Selection produced duplicate frame indices")
    return selected


def write_subset(source: Path, destination: Path, indices: list[int]) -> None:
    frames = read(source, index=":")
    write(destination, [frames[index] for index in indices], format="extxyz")


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def main() -> None:
    reference_manifest_path = DATA / "macefield_batio3_reference_split.json"
    reference_manifest = json.loads(reference_manifest_path.read_text())
    bto_source = DATA / "macefield_batio3_reference.extxyz"
    bto_train_base = sorted(reference_manifest["training_indices"])
    bto_valid_base = sorted(reference_manifest["validation_indices"])
    bto_train = evenly_spaced_indices(bto_train_base, 12)
    bto_valid = evenly_spaced_indices(bto_valid_base, 4)

    quartz_source = DATA / "sio2/SiO2-preprocessed.extxyz"
    quartz_frames = read(quartz_source, index=":")
    if len(quartz_frames) != 201:
        raise ValueError(f"Expected 201 quartz frames, found {len(quartz_frames)}")
    # The source concatenates 101 T=300 K frames with 100 T=600 K frames;
    # source frame 5 from the second trajectory was excluded during parsing.
    quartz_train = (
        evenly_spaced_indices(list(range(0, 71)), 12)
        + evenly_spaced_indices(list(range(101, 172)), 12)
    )
    quartz_valid = (
        evenly_spaced_indices(list(range(71, 101)), 4)
        + evenly_spaced_indices(list(range(172, 201)), 4)
    )

    outputs = {
        "batio3_train": DATA / "batio3/batio3_qe_train_sample.extxyz",
        "batio3_valid": DATA / "batio3/batio3_qe_valid_sample.extxyz",
        "quartz_train": DATA / "sio2/quartz_qe_train_sample.extxyz",
        "quartz_valid": DATA / "sio2/quartz_qe_valid_sample.extxyz",
    }
    write_subset(bto_source, outputs["batio3_train"], bto_train)
    write_subset(bto_source, outputs["batio3_valid"], bto_valid)
    write_subset(quartz_source, outputs["quartz_train"], quartz_train)
    write_subset(quartz_source, outputs["quartz_valid"], quartz_valid)

    manifest = {
        "description": "Deterministic, evenly spaced tutorial subsets from the bundled QE response data.",
        "sampling_rule": "Use sorted source indices spaced across each training/validation block; preserve all original labels.",
        "configuration_provenance": {
            "batio3": "Flare active-learning configurations; not AIMD.",
            "alpha_quartz": "Classical MD configurations at 300 K and 600 K; not AIMD.",
        },
        "response_label_provenance": "Quantum ESPRESSO; energy, forces, stress, and polarization from zero-field calculations, BEC from the force response to small applied fields, and polarizability from the polarization response to field on the same fixed geometries.",
        "batio3": {
            "source": "macefield_batio3_reference.extxyz",
            "source_sha256": sha256(bto_source),
            "source_train_indices": bto_train_base,
            "source_validation_indices": bto_valid_base,
            "train_indices": bto_train,
            "validation_indices": bto_valid,
            "train_file": outputs["batio3_train"].name,
            "valid_file": outputs["batio3_valid"].name,
        },
        "alpha_quartz": {
            "source": "sio2/SiO2-preprocessed.extxyz",
            "source_sha256": sha256(quartz_source),
            "source_frame_groups": {
                "T300_train_candidates": [0, 70],
                "T300_validation_candidates": [71, 100],
                "T600_train_candidates": [101, 171],
                "T600_validation_candidates": [172, 200],
                "note": "Output indices reflect the merged QE file; T600 source frame 5 was excluded during preprocessing.",
            },
            "train_indices": quartz_train,
            "validation_indices": quartz_valid,
            "train_file": outputs["quartz_train"].name,
            "valid_file": outputs["quartz_valid"].name,
        },
        "outputs": {
            path.name: {"frames": count, "sha256": sha256(path)}
            for path, count in (
                (outputs["batio3_train"], len(bto_train)),
                (outputs["batio3_valid"], len(bto_valid)),
                (outputs["quartz_train"], len(quartz_train)),
                (outputs["quartz_valid"], len(quartz_valid)),
            )
        },
    }
    manifest_path = DATA / "training_subsets.json"
    manifest_path.write_text(json.dumps(manifest, indent=2) + "\n")
    print(f"Wrote {manifest_path}")


if __name__ == "__main__":
    main()
