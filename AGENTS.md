# AGENTS.md

**Project:** SIDE-cosmo
**Programme:** PLACE TO STAND Research Programme
**Author:** J. York Seale (ORCID: [0009-0008-7993-0310](https://orcid.org/0009-0008-7993-0310))
**License:** MIT
**Current version:** v0.3 (tag `v0.3`, commit `95d2540`; HEAD at `8ae73a1` "theorem count 20 → 23")

This file orients LLM agents and automated tooling to the repository's purpose, structure, and verification surface. Human readers should start with `README.md`.

---

## What this repository is

The Lean 4 kernel extending the SIDE framework to cosmological scale. 0 sorry, 0 axioms beyond ZFC, compiled against Mathlib v4.30.0. Three substantive modules:

1. **Formation phase space** (`FormationPhaseSpace.lean`) — the dark sector theorem (`prim < trans → dark > 0`), silence at the formation boundary, **Wall² identity** (`prim = output → total = wall²`), the **Ω_b = 4/81 = 0.04938** prediction machine-verified for the (2, 3, 2, 0) ξ-system tuple, Dark = 77 = 7 × 11, formation total = 7, and propositional-logic decidability infrastructure.

2. **Fano plane PG(2, 𝔽₂)** (`FanoPlane.lean`) — three lines through every point, unique pairwise line intersection, three distinct points per line, **formation total = Fano point count** (2 + 3 + 2 + 0 = 7), **|GL(3, 𝔽₂)| = 168 = 24 × 7**, and characteristic 2 `(1 + 1 : Fin 2) = 0`.

3. **Formation-Fano bridge** (`FanoFormation.lean`) — `xi_total_eq_fano`, `coupled_symm` (coupling is symmetric), `coupling_count` (each mechanism class couples to exactly 6 others via shared Fano lines), `block_length`, `visible_dim`, `dark_dim`, `formation_rate` (2² = visible_slots), and `block_match_steane`.

Cosmology meets arithmetic at the Fano plane. The (ℤ/2)³ generators {−1, 2, 3} that produce the seven mechanism classes (SIDE-trivium) are the same generators that organize cosmological matter content into the visible-dark partition with the Class A prediction Ω_b = 4/81. Class A predicts 0.04938; Planck 2018 measures 0.04930 ± 0.00059; deviation 0.13σ. Classes B (Gravitational), C (Gauge), D (Information) excluded by 18.6σ to 351σ.

Member of the **PLACE TO STAND federation of kernels**. Independent: own toolchain pin, own Zenodo deposit, own version history. Cross-kernel content travels by vendoring-with-attribution, not via Lake dependencies.

---

## Cite as

```
Seale, J. York. (2026). SIDE-cosmo v0.3: Lean 4 kernel for the
cosmological extension of the SIDE framework (formation phase space,
Fano plane PG(2, 𝔽₂), formation-Fano bridge). Zenodo.
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

Toolchain pinned in `lean-toolchain`. Mathlib v4.30.0.

The headline `Ω_b = 4/81` claim is verifiable by inspecting `SIDECosmo/FormationPhaseSpace.lean` — the prediction is `native_decide`-verified for the (2, 3, 2, 0) tuple, no axiom invocation beyond ZFC.

---

## Theorems exported (v0.3)

### `SIDECosmo/FormationPhaseSpace.lean`

The dark-sector layer. Builds the formation tuple structure, defines `visible_slots` and `dark_slots`, and proves the central cosmological identities:

- **Dark sector theorem** — `prim < trans → dark > 0` (formerly named DS1 in informal documents; kernel-verified)
- **Silence at formation boundary** — what does not transmit through the local-cosmic interface
- **Wall² identity** — `prim = output → total = wall²`; absorbed-conjecture from the v0.2 cosmology papers, now kernel-verified
- **`Ω_b = 4/81`** — machine-verified for the (2, 3, 2, 0) ξ-system tuple
- **`Dark = 77 = 7 × 11`** — dark-sector decomposition
- **Formation total = 7** — for the (2, 3, 2, 0) tuple specifically
- **Decidability instances** for the propositional layer

### `SIDECosmo/FanoPlane.lean`

Self-contained formalization of PG(2, 𝔽₂). Defines `fanoLine : Fin 7 → Fin 7 × Fin 7 × Fin 7`, `onLine`, `linesThrough`, `sharedPoints`. All theorems via `native_decide`:

- **`three_lines_per_point`** — `∀ pt : Fin 7, linesThrough pt = 3`
- **`unique_intersection`** — `∀ i j, i ≠ j → sharedPoints i j = 1`
- **`three_distinct`** — points on each line are distinct
- **`formation_is_fano`** — `2 + 3 + 2 + 0 = 7`; ξ-system formation total matches Fano point count
- **`gl3f2`** — `168 = 24 × 7`; the Fano automorphism group order
- **`char_two`** — `(1 + 1 : Fin 2) = 0`; characteristic 2 / orientation reversal

### `SIDECosmo/FanoFormation.lean`

Bridge module connecting Fano structure to formation calculus. Defines `coupled : Fin 7 → Fin 7 → Bool` via shared Fano lines:

- **`xi_total_eq_fano`** — `xi.formation_total = 7`
- **`formation_fano_match`**
- **`coupled_symm`** — coupling is symmetric (`coupled i j = coupled j i`)
- **`coupling_count`** — every mechanism class couples to exactly 6 others
- **`block_length`** — formation total = 7 (Steane block-length match)
- **`visible_dim`** — `visible_slots xi = 4`
- **`dark_dim`** — `dark_slots xi = 77`
- **`formation_rate`** — `2² = visible_slots xi`
- **`block_match_steane`** — formation total = 7 (Steane block-length identity, second form)

### Header modules

- **`SIDECosmo.lean`** — top-level import
- **`SIDECosmo/Basic.lean`** — minimal infrastructure

---

## Note on code-parameter framing

The v0.3 commit message reads "FanoFormation bridge — formation total = Fano points, coupling symmetric, [[7,2,5]] code parameters." The `[[7,2,5]]` reference describes the cosmological code-parameter regime exposed in `FanoFormation.lean`: block length 7, rate/dimension parameters from the visible (4) and dark (77) decomposition, and the corresponding distance regime. This is *not* the Steane [[7, 1, 3]] code — Steane lives in SIDE-trivium with different rate/distance parameters. The two share block length 7 because both arise from the Fano plane substrate; that shared substrate is what `block_match_steane` formalizes. Treat the cosmological code as a distinct parameter set on the same Fano substrate, not as a rebranding of Steane.

---

## Companion repositories in the federation

| Repo | Role |
|:-----|:-----|
| [SIDE-kernel](https://github.com/psinary-sketch/SIDE-kernel) | RH proof main chain |
| [SIDE-trivium](https://github.com/psinary-sketch/SIDE-trivium) | Trivium bijection — Steane [[7, 1, 3]] connection |
| **SIDE-cosmo** (this) | Cosmological extension — Fano + formation phase space + bridge |
| [SIDE-interfaces](https://github.com/psinary-sketch/SIDE-interfaces) | Interface vocabulary |
| [SIDE-effects](https://github.com/psinary-sketch/SIDE-effects) | Framework consequences + Phase 1.5 bridge work |

Each is independently auditable. None depends on the others via Lake. SIDE-cosmo's Fano formalization is independent of any Fano content elsewhere in the federation; both arise from the same arithmetic substrate.

---

## Cross-references to manuscripts (Phase 2 cosmological bundle)

| Paper | Backed by |
|:------|:----------|
| *Matter as Arithmetic v0.2* | Dark sector theorem, Ω_b = 4/81 prediction, Wall² identity |
| *Størmer Derivation of Ω_b* | `Ω_b = 4/81` theorem (machine-verified for (2,3,2,0)), Wall² identity |
| *Cosmological Sieve Ceiling* | Backed by `sieve_ceiling` in SIDE-kernel v1.1 |
| *Formation Distance Synthesis v0.2* | Dark sector theorem, formation total identities |
| *Dark Sector as Formation Distance v0.2* | Dark sector theorem, `Dark = 77 = 7 × 11` |
| *Symmetry Filter* | Coupling structure (symmetric, each class to 6 others) |
| *Local Cosmic Interface* | Silence at formation boundary |
| *T₇ Topology CMB* | Empirical prediction; pipeline frozen, awaits ESA Planck archive |
| *Quaternionic Dark Sector v0.3* | (ℤ/2)³ → T_μν embedding (manuscript-side construction) |
| *Fano Plane of Arithmetic* | `FanoPlane.lean` (full kernel-verified Fano formalization) |

The cosmological cluster is the first batch-wave anticipated for Phase 2 publication (per SYNC_BATCH_QUEUE.md, Batch 004).

---

## Discipline (for agents that propose edits)

1. **Federation respect.** No cross-kernel Lake dependencies. The Fano formalization in SIDE-cosmo is independent of any Fano content elsewhere in the federation.

2. **0 sorry, 0 axioms beyond ZFC.** All theorems compile unconditionally. Any PR that introduces sorries or custom axioms breaks the kernel's distinguishing property.

3. **`native_decide` discipline.** Most v0.3 theorems are `by native_decide` against `Fin 7` and small finite structures. This is appropriate for the structural-identity layer. PRs that replace `native_decide` with `decide` or manual proof should preserve the verification status.

4. **No "conditional" framing.** The dark sector theorem, Ω_b = 4/81, and Wall² identity compile unconditionally within ZFC + Mathlib v4.30.0. Do not reframe as "conjectural" or "pending."

5. **No "gap" methodology vocabulary.** Use "formation distance," "dark sector," "silence boundary," "density-placement barrier" depending on context.

6. **I+D+S ordering.** Independence, Determination, Symmetry.

7. **Counts are theorem-status.** Load-bearing: formation tuple (2, 3, 2, 0); formation total = 7; visible = 4; dark = 77; Fano points = 7; |GL(3, 𝔽₂)| = 168 = 24 × 7; each class couples to exactly 6 others; Ω_b = 4/81. Other counts ("three modules") are descriptive.

8. **Planck reference value reconciliation pending.** The README quotes Ω_b = 0.04930 ± 0.00059 (Planck 2018, derived precision). Some downstream artifacts use 0.04897 ± 0.0031 (older Planck reference). These should be reconciled to a single canonical Planck citation across deposit, README, and Phase 2 papers.

---

## Honest open status

- All theorems compile, 0 sorry, 0 axioms beyond ZFC.
- Wall² identity is kernel-verified (stronger than the manuscript-level absorption noted in v0.2 of the cosmology papers).
- Coupling structure (each class couples to 6 others) is a structural finding not yet reflected in manuscript-side papers; worth surfacing in Phase 2 polish.
- `[[7,2,5]]` code parameter framing in the v0.3 commit message describes cosmological-side rate/distance parameters on the Fano substrate; the relationship to Steane [[7, 1, 3]] in SIDE-trivium is shared block-length-via-Fano, not a rebranding.
- Empirical predictions (Ω_b match to 0.13σ, ΔH₀ match to 0.53σ, w = −1 match to 0.07σ DESI DR2, dark-matter direct-detection null) are empirical content. The kernel proves structural identities; comparison to data lives in the README and downstream papers.
- T₇ topology empirical search (Klein-Möbius arc pattern in CMB) is the live open prediction; pipeline frozen, awaits ESA Planck archive access.
- Prior STATE listings of "K1 (four-class classification at kernel) — pending" and "S1 (formation phase space derivation chain at kernel) — pending" describe milestones substantively LANDED in this v0.3 kernel. FormationPhaseSpace.lean carries the four-class arithmetic via the Ω_b prediction and dark-sector decomposition; FanoFormation.lean carries the bridge. The "pending milestone" framing for K1 and S1 should be retired in favor of citing the actual kernel theorems.

---

## What an agent should NOT do without human approval

- Modify deposited Zenodo content. New deposits require explicit version bumps.
- Resolve the Planck reference value reconciliation by editing one value to match the other; surface the discrepancy for human resolution.
- Reframe the dark sector theorem, Ω_b = 4/81, or Wall² identity as "conjectural" or "pending."
- Run empirical T₇ topology searches without coordinating ESA Planck archive access.
- Conflate the cosmological-side code-parameter exposition with the Steane [[7, 1, 3]] code in SIDE-trivium. They share Fano substrate; the parameter sets differ.

---

## Contact

J. York Seale, ORCID [0009-0008-7993-0310](https://orcid.org/0009-0008-7993-0310). Via GitHub (issues, PRs) on this repository.

**:: → · ← ::**
