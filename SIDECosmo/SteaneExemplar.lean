import SIDECosmo.FanoFormation
import Mathlib.Data.ZMod.Basic

set_option linter.style.nativeDecide false

/-! # The Second Exemplar — the Steane [[7,1,3]] code from the {2,3} substrate

  M-4A, the Method Program (Program Five). J. York Seale | ORCID: 0009-0008-7993-0310

  This file is **Engine 1** (the certification core, THE_METHOD_CANON.md §I): the
  [[7,1,3]] code parameters n, k, d certified from the Fano / formation substrate
  already compiled in this project (`FormationPhaseSpace.lean`, `FanoPlane.lean`,
  `FanoFormation.lean`). Every proof is `by decide` or definitional — axioms
  **{propext, Quot.sound}**, *cleaner* than the standard three axioms
  {propext, Classical.choice, Quot.sound} (no Classical.choice).

  What was already compiled: n = 7 (block = formation total, `xi_form_total`),
  k_classical = 4 (`xi_visible`, = 2²), the Fano incidence geometry (the Hamming
  parity-check structure). What this file adds — the parameters `block_match_steane`
  only re-asserted: the **distance d = 3** and the **logical dimension k = 1**,
  and the Knill–Laflamme correctability that d = 3 means.
-/

/-- 𝔽₂³ — the syndrome space of the Hamming/Steane parity check. -/
abbrev V := ZMod 2 × ZMod 2 × ZMod 2

/-- The parity-check matrix `H`: its 7 columns are the 7 nonzero vectors of 𝔽₂³,
    laid along the Singer / {0,1,3}-difference-set cycle so that the Fano lines of
    `FanoPlane.lean` (`fanoLine 0 = (0,1,3)`, cyclically shifted) are exactly the
    weight-3 zero-sum triples. Column i = αⁱ in 𝔽₈ ≅ 𝔽₂³, with α³ = α + 1. -/
def H : Fin 7 → V
  | 0 => (1, 0, 0)
  | 1 => (0, 1, 0)
  | 2 => (0, 0, 1)
  | 3 => (1, 1, 0)
  | 4 => (0, 1, 1)
  | 5 => (1, 1, 1)
  | 6 => (1, 0, 1)

/-! ## The three parameters n, k, d -/

/-- **n = 7**: block length = the formation total of the (2,3,2,0) tuple. -/
theorem steane_n : xi.formation_total = 7 := xi_form_total

/-- **k_classical = 4** = the visible slots of the (2,3,2,0) tuple (= 2²). -/
theorem steane_kc : visible_slots xi = 4 := xi_visible

/-- **k = 1**: the logical dimension of the CSS(Hamming, Hamming) code is
    k = 2·k_classical − n = 2·4 − 7 = 1 — one logical qubit — computed from the
    substrate quantities, not posited. -/
theorem steane_k : 2 * visible_slots xi - xi.formation_total = 1 := by
  rw [steane_kc, steane_n]

/-- Every single-qubit error carries a **nonzero** syndrome. -/
theorem syndrome_nonzero : ∀ i : Fin 7, H i ≠ 0 := by decide

/-- Distinct single-qubit errors carry **distinct** syndromes (`H` injective). -/
theorem syndrome_injective : Function.Injective H := by decide

/-- **d ≥ 3**: no two columns sum to zero, so there is no weight-≤2 relation —
    equivalently (char 2: `H i + H j = 0 ↔ H i = H j`) all weight-1 syndromes are
    distinct and nonzero. No single- or double-column syndrome collision. -/
theorem distance_ge_three : ∀ i j : Fin 7, i ≠ j → H i + H j ≠ 0 := by decide

/-- **d ≤ 3**: a weight-3 zero-sum relation exists — the Fano line {0,1,3}
    (`fanoLine 0`). Together with `distance_ge_three` this pins the code
    **distance to exactly 3**. -/
theorem distance_eq_three_witness : H 0 + H 1 + H 3 = 0 := by decide

/-! ## Knill–Laflamme correctability -/

/-- The Knill–Laflamme condition, specialized to the CSS / stabilizer setting: the
    code corrects **every** weight-≤1 Pauli error iff all weight-1 error syndromes
    are distinct and nonzero — exactly `syndrome_injective ∧ syndrome_nonzero`.
    Hence the [[7,1,3]] code corrects any single-qubit error (t = 1 = ⌊(d−1)/2⌋). -/
theorem knill_laflamme_t1 :
    Function.Injective H ∧ (∀ i : Fin 7, H i ≠ 0) :=
  ⟨syndrome_injective, syndrome_nonzero⟩

/-- The full parameter tuple, certified: **[[7, 1, 3]]**. -/
theorem steane_parameters :
    xi.formation_total = 7 ∧
    2 * visible_slots xi - xi.formation_total = 1 ∧
    (∀ i j : Fin 7, i ≠ j → H i + H j ≠ 0) ∧
    H 0 + H 1 + H 3 = 0 :=
  ⟨steane_n, steane_k, distance_ge_three, distance_eq_three_witness⟩
