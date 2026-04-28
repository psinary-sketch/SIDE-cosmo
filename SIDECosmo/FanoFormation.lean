import SIDECosmo.FormationPhaseSpace
import SIDECosmo.FanoPlane

set_option linter.style.nativeDecide false

/-! # Bridge: Formation ↔ Fano
  J. York Seale | ORCID: 0009-0008-7993-0310 -/

/-! ## Identification: Formation total = Fano points -/

theorem xi_total_eq_fano : xi.formation_total = 7 := xi_form_total

theorem formation_fano_match : xi.formation_total = 7 ∧ True :=
  ⟨xi_form_total, trivial⟩

/-! ## Coupling via Fano lines -/

def b2n_local (b : Bool) : Nat := if b then 1 else 0

/-- Two mechanism classes are coupled if they share a Fano line. -/
def coupled (i j : Fin 7) : Bool :=
  if i = j then false
  else
    onLine i 0 && onLine j 0 ||
    onLine i 1 && onLine j 1 ||
    onLine i 2 && onLine j 2 ||
    onLine i 3 && onLine j 3 ||
    onLine i 4 && onLine j 4 ||
    onLine i 5 && onLine j 5 ||
    onLine i 6 && onLine j 6

/-- Coupling is symmetric. -/
theorem coupled_symm : ∀ i j : Fin 7, coupled i j = coupled j i := by native_decide

/-- Each class couples to exactly 6 others. -/
theorem coupling_count : ∀ i : Fin 7,
    b2n_local (coupled i 0) + b2n_local (coupled i 1) + b2n_local (coupled i 2) +
    b2n_local (coupled i 3) + b2n_local (coupled i 4) + b2n_local (coupled i 5) +
    b2n_local (coupled i 6) = 6 := by native_decide

/-! ## Code parameters -/

theorem block_length : xi.formation_total = 7 := xi_form_total
theorem visible_dim : visible_slots xi = 4 := xi_visible
theorem dark_dim : dark_slots xi = 77 := xi_dark
theorem formation_rate : 2 ^ 2 = visible_slots xi := by native_decide
theorem block_match_steane : xi.formation_total = 7 := xi_form_total
