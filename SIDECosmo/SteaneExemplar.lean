import SIDECosmo.FanoFormation
import Mathlib.Data.ZMod.Basic

set_option linter.style.nativeDecide false

/-! # The Second Exemplar — the Steane [[7,1,3]] code from the {2,3} substrate

  M-4A, the Method Program (Program Five). J. York Seale | ORCID: 0009-0008-7993-0310

  This file compiles, on the parity check H (columns the seven nonzero vectors of 𝔽₂³), that its columns are nonzero
  and pairwise distinct and that columns 0, 1, 3 sum to zero, and from the (2,3,2,0) tuple that the formation total is
  7 and 2·4 − 7 = 1; read as the Steane code these give n = 7, k = 1, d = 3 — the code, its distance and
  Knill–Laflamme correctability are not defined here, and the axiom profile is printed by SteaneAxiomCheck.lean.

  What was already compiled: n = 7 (block = formation total, `xi_form_total`),
  k_classical = 4 (`xi_visible`, = 2²), the Fano incidence geometry (the Hamming
  parity-check structure).
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

/-- **No double-column collision**: no two distinct columns of H sum to zero (in characteristic 2, the columns are
pairwise distinct); with syndrome_nonzero there is no weight-≤2 relation, so d ≥ 3. -/
theorem distance_ge_three : ∀ i j : Fin 7, i ≠ j → H i + H j ≠ 0 := by decide

/-- **d ≤ 3**: columns 0, 1, 3 (the Fano line fanoLine 0) sum to zero; with distance_ge_three and syndrome_nonzero, the
classical code with parity check H has minimum distance exactly 3 (the code is the reading, not defined here). -/
theorem distance_eq_three_witness : H 0 + H 1 + H 3 = 0 := by decide

/-! ## Knill–Laflamme correctability -/

/-- The single-error syndrome condition: the columns of H are pairwise distinct and nonzero (syndrome_injective ∧
syndrome_nonzero); by the Knill–Laflamme condition in the CSS setting (not compiled here) this is what correcting
every single-qubit error requires. -/
theorem knill_laflamme_t1 :
    Function.Injective H ∧ (∀ i : Fin 7, H i ≠ 0) :=
  ⟨syndrome_injective, syndrome_nonzero⟩

/-- The parameter conjunction read as [[7, 1, 3]]: formation total 7, 2·4 − 7 = 1, pairwise-distinct columns of H, and a
weight-3 zero sum of columns 0, 1, 3 (d ≥ 3 also needs syndrome_nonzero). -/
theorem steane_parameters :
    xi.formation_total = 7 ∧
    2 * visible_slots xi - xi.formation_total = 1 ∧
    (∀ i j : Fin 7, i ≠ j → H i + H j ≠ 0) ∧
    H 0 + H 1 + H 3 = 0 :=
  ⟨steane_n, steane_k, distance_ge_three, distance_eq_three_witness⟩
