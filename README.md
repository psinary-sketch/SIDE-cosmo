# SIDE-cosmo

Cosmological extension of the SIDE Exclusion Principle.

Lean 4 formalization of formation phase space and Fano incidence,
with the dark sector theorem and the prediction Ω_b = 4/81.

## Files

- `SIDECosmo/FormationPhaseSpace.lean` — 14 theorems
  - Dark sector theorem (`prim < trans → dark > 0`)
  - Silence at the formation boundary
  - Wall² identity (`prim = output → total = wall²`)
  - Ω_b = 4/81 = 0.04938 (machine-verified for the (2,3,2,0) tuple)
  - Dark = 77 = 7 × 11
  - Formation total = 7
  - Propositional logic decidable

- `SIDECosmo/FanoPlane.lean` — 6 theorems
  - 7 points, 7 lines (Fano incidence)
  - 3 lines per point
  - Unique intersection (every pair of lines meets in one point)
  - Formation total = Fano point count
  - |GL(3,𝔽₂)| = 168 = 24 × 7
  - Characteristic 2 (orientation reversal)

## Status

- 23 theorems total
- 0 sorry
- 0 axioms (beyond ZFC)
- Compiled against Mathlib v4.30.0

## Empirical predictions

| Quantity | Predicted | Measured | Status |
|:---------|:----------|:---------|:-------|
| Ω_b (baryon density) | 0.04938 | 0.04930 ± 0.00059 (Planck 2018) | 0.13σ ✓ |
| ΔH₀ (Hubble tension) | 6.65 km/s/Mpc | 6.14 ± 0.97 (H0DN) | 0.53σ ✓ |
| w (dark energy EoS) | -1 | -0.996 ± 0.046 (DESI DR2) | 0.07σ ✓ |
| Dark matter direct | null | null (LZ, XENON, PandaX) | ✓ |
| Cosmic topology | 𝕋₇ (7 matched arcs) | unmeasured | Pending |

## How to build

```bash
git clone https://github.com/psinary-sketch/SIDE-cosmo.git
cd SIDE-cosmo
lake update
lake build
```

First build takes ~30 min (Mathlib dependency).

## Companion repositories

- [SIDE-kernel](https://github.com/psinary-sketch/SIDE-kernel) — RH proof
  (560 declarations, 0 sorry)

## Citation

```bibtex
@software{seale2026sidecosmo,
  author = {Seale, J. York},
  title = {SIDE-cosmo: Formation phase space and dark sector theorem},
  year = {2026},
  url = {https://github.com/psinary-sketch/SIDE-cosmo}
}
```

## License

MIT.

## Author

J. York Seale | ORCID: [0009-0008-7993-0310](https://orcid.org/0009-0008-7993-0310)

**:: → · ← ::**
