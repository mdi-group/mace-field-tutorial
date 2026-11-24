#!/usr/bin/env python3
"""Install only missing dependencies needed by the MACE extension tutorial."""

from __future__ import annotations

import argparse
import importlib
import importlib.util
import os
import subprocess
import sys
from pathlib import Path


TUTORIAL_ROOT = Path(__file__).resolve().parents[2]
MACEFIELD_REPO = Path(
    os.environ.get("MACEFIELD_REPO", TUTORIAL_ROOT.parent / "mace-field")
).resolve()
sys.path.insert(0, str(MACEFIELD_REPO))

BASE_MODULES = ("numpy", "torch", "e3nn", "ase", "matplotlib", "mace")
VISUAL_MODULES = ("py3Dmol", "ipywidgets")


def _has_module(module: str) -> bool:
    try:
        return importlib.util.find_spec(module) is not None
    except (ImportError, ValueError):
        return False


def _install(*args: str) -> None:
    command = [sys.executable, "-m", "pip", "install", *args]
    print("Installing missing tutorial dependency:", " ".join(command[3:]), flush=True)
    subprocess.run(command, check=True)
    importlib.invalidate_caches()


def ensure(feature: str) -> None:
    """Ensure base, visualization, magnetic, and/or LES dependencies exist."""
    features = {part.strip().lower() for part in feature.split(",") if part.strip()}
    if "all" in features:
        features = {"base", "visualization", "magnetic", "les"}
    unknown = features - {"base", "visualization", "magnetic", "les"}
    if unknown:
        raise ValueError(f"Unknown dependency group(s): {', '.join(sorted(unknown))}")

    if "base" in features:
        missing = [name for name in BASE_MODULES if not _has_module(name)]
        if missing:
            _install("--editable", str(MACEFIELD_REPO))
        still_missing = [name for name in BASE_MODULES if not _has_module(name)]
        if still_missing:
            raise ImportError(f"Base MACE dependencies are still missing: {still_missing}")

    if "visualization" in features:
        missing = [name for name in VISUAL_MODULES if not _has_module(name)]
        if missing:
            packages = []
            if "py3Dmol" in missing:
                packages.append("py3Dmol>=2.0")
            if "ipywidgets" in missing:
                packages.append("ipywidgets>=8.0")
            _install(*packages)
        still_missing = [name for name in VISUAL_MODULES if not _has_module(name)]
        if still_missing:
            raise ImportError(f"Visualization dependencies are still missing: {still_missing}")

    if "magnetic" in features and not _has_module("sphericart"):
        # Install just the magnetic extra. Re-resolving the entire editable
        # MACE project here can replace a student's working PyTorch build.
        _install("sphericart-torch==1.0.9")
        if not _has_module("sphericart"):
            raise ImportError("Could not install the pinned sphericart-torch magnetic extra.")

    if "les" in features and not _has_module("les"):
        requirements = MACEFIELD_REPO / "requirements" / "les.txt"
        _install("--requirement", str(requirements))
        if not _has_module("les"):
            raise ImportError("Could not install the pinned LES dependency.")

    print("Tutorial dependency check complete:", ", ".join(sorted(features)), flush=True)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--feature", default="base", help="comma-separated: base, visualization, magnetic, les, all")
    args = parser.parse_args()
    ensure(args.feature)


if __name__ == "__main__":
    main()
