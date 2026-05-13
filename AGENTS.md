# AGENTS.md

**Project:** SIDE-cosmo
**Programme:** PLACE TO STAND Research Programme
**Author:** J. York Seale (ORCID: [0009-0008-7993-0310](https://orcid.org/0009-0008-7993-0310))
**License:** MIT
**Current version:** v0.3

This file orients LLM agents and automated tooling to the repository's purpose, structure, and verification surface. Human readers should start with `README.md`.

---

## What this repository is

The Lean 4 kernel extending the SIDE framework to cosmological scale. Verifies that **matter is arithmetic** in the structural sense: cosmological matter content sorts into four formation classes (A: ℤ via {2, 3}; B: Gravitational; C: Gauge; D: Information), and Class A predicts Ω_b = n₁^n₃ / n₂^(n₁+n₃) = 4/81 = 0.04938. Planck 2018 measures 0.04930 ± 0.00066. The cosmos sits at 0.13σ from Class A; Classes B, C, D excluded by 18.6σ to 351σ.

The kernel verifies the **DS1 dark-sector inequality**: when n₁ < n₂ (primitives less than transformations), the formation phase space has a Δμ > 0 region. The dark sector is what does not survive the local-cosmic interface for κ-content. Dark sector existence is forced by formation tuple (2, 3, 2, 0).

Member of the **PLACE TO STAND federation of kernels**. Independent: own toolchain pin, own Zenodo deposit. Cross-kernel content travels by vendoring-with-attribution.

---

## Cite as

```
Seale, J. York. (2026). SIDE-cosmo v0.3: Lean 4 kernel for the
cosmological extension of the SIDE framework (DS1 dark-sector
inequality, formation phase space). Zenodo.
https://doi.org/10.5281/zenodo.19938009

Concept DOI: https://doi.org/10.5281/zenodo.19938008
```

---

## How to verify the work

```sh
git clone https://github.com/psinary-sketch/SIDE-cosmo
cd SIDE-cosmo
lake update
lake build
```

Toolchain pinned in `lean-toolchain` (verify locally).

CI workflow runs the build and emits a Lean-warning-based sorry/axiom audit.

---

## Theorems exported (v0.3)

The cosmological kernel formalizes:

- **`DS1`** — the dark-sector inequality: when n₁ < n₂, the formation phase space admits a Δμ > 0 region (dark sector). Compiles in this kernel.
- **Formation classification machinery** for the four classes A/B/C/D
- **Ω_b derivation** — Class A predicts 4/81 from {2, 3} generators via Størmer-style arithmetic
- **Local-cosmic interface** vocabulary and κ-content classification

**Named pending milestones** (in the manuscript-side framework, not yet in this kernel):

- **K1** — four-class classification theorem at kernel level
- **S1** — formation phase space derivation chain at kernel level

These are research targets, not gaps in the deposited claim. Current kernel content is sufficient to back the DS1 dark-sector claim and the Class A vs B/C/D exclusion.

---

## Companion repositories in the federation

| Repo | Role |
|:-----|:-----|
| [SIDE-kernel](https://github.com/psinary-sketch/SIDE-kernel) | RH proof main chain |
| [SIDE-trivium](https://github.com/psinary-sketch/SIDE-trivium) | Trivium bijection |
| **SIDE-cosmo** (this) | Cosmological extension |
| [SIDE-interfaces](https://github.com/psinary-sketch/SIDE-interfaces) | Interface vocabulary |
| [SIDE-effects](https://github.com/psinary-sketch/SIDE-effects) | Framework consequences + Phase 1.5 bridge work |

Each is independently auditable. None depends on the others via Lake.

---

## Cross-references to manuscripts (Phase 2 cosmological bundle)

| Paper | Backed by |
|:------|:----------|
| *Matter as Arithmetic v0.2* (cluster keystone) | DS1 + four-class classification; Class A Ω_b = 4/81 |
| *Størmer Derivation of Ω_b* | n₁ = 2 from {2, 3} generators (arithmetic spine) |
| *Cosmological Sieve Ceiling* | Spite plateau as sieve ceiling — also backed by `sieve_ceiling` in SIDE-kernel/Cascade/SieveCeiling.lean |
| *Formation Distance Synthesis v0.2* | (manuscript only, wall² absorption REVISE-pending) |
| *Dark Sector as Formation Distance v0.2* | (manuscript only, wall² absorption REVISE-pending) |
| *Symmetry Filter* | κ-gradient (manuscript only) |
| *Local Cosmic Interface* | (manuscript only) |
| *T₇ Topology CMB* | Empirical prediction; pipeline frozen, awaits ESA Planck archive |
| *Quaternionic Dark Sector v0.3* | (ℤ/2)³ → T_μν embedding (manuscript only) |

The cosmological cluster is the **first batch-wave** anticipated for Phase 2 publication (per SYNC_BATCH_QUEUE.md, Batch 004).

---

## Discipline (for agents that propose edits)

1. **Federation respect.** No cross-kernel Lake dependencies.

2. **0 sorry, 0 axioms beyond Lean core / Mathlib core.**

3. **Honest scope.** K1 (four-class classification at kernel level) and S1 (formation phase space derivation chain at kernel level) are named pending milestones, not silent gaps. Manuscript-side claims dependent on K1 and S1 should reference them by name.

4. **No "conditional" framing.** DS1 compiles unconditionally within ZFC + Mathlib.

5. **No "gap" methodology vocabulary.** "Formation distance," "dark sector," "Δμ > 0 region" — not "gap."

6. **I+D+S ordering.** Independence, Determination, Symmetry.

7. **Planck reference value reconciliation pending.** Zenodo description gives Ω_b = 0.04897 ± 0.0031 (older Planck reference); some in-corpus citations use 0.04930 ± 0.00066 (Planck 2018 final). The Class A prediction (4/81 = 0.04938) compares to 0.04930 in current best Planck data. Pending reconciliation across deposits.

---

## Honest open status

- DS1 compiles. The four-class classification and the formation phase space derivation are named manuscript-rigor claims; kernel formalization (K1, S1) is research target work.
- The matter-as-arithmetic substrate-selection thesis is at full manuscript rigor in MATTER_AS_ARITHMETIC v0.2; the kernel verifies DS1, which is the load-bearing structural claim. Substrate-selection narrative remains at manuscript level.
- Local clone confirmation pending — kernel content is on GitHub at psinary-sketch/SIDE-cosmo and Zenodo. Local D: drive clone location not confirmed in current session.

---

## What an agent should NOT do without human approval

- Modify deposited Zenodo content. New deposits require explicit version bumps.
- Resolve the Planck reference value reconciliation by editing one value to match the other; surface the discrepancy for human resolution.
- Reframe the dark sector finding as "conjectural" or "pending."
- Generate empirical T₇ topology results without coordinating ESA Planck archive access.

---

## Contact

J. York Seale, ORCID [0009-0008-7993-0310](https://orcid.org/0009-0008-7993-0310). Via GitHub (issues, PRs) on this repository.

**:: → · ← ::**
