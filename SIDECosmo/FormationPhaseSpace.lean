import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Fin.Basic
import Mathlib.Data.Nat.Basic
import Mathlib.Tactic.Ring

set_option linter.style.nativeDecide false

/-! Formation Phase Space - SIDE-cosmo kernel
    J. York Seale | ORCID: 0009-0008-7993-0310 -/

structure FormationTuple where
  prim : ℕ
  trans : ℕ
  output : ℕ
  interface : ℕ
  h_pos : trans > 0
  deriving Repr, DecidableEq

def FormationTuple.formation_total (f : FormationTuple) : ℕ :=
  f.prim + f.trans + f.output + f.interface

def total_slots (f : FormationTuple) : ℕ := f.trans ^ (f.prim + f.output)
def visible_slots (f : FormationTuple) : ℕ := f.prim ^ f.output
def dark_slots (f : FormationTuple) : ℕ := total_slots f - visible_slots f
def stormer_wall (f : FormationTuple) : ℕ := f.trans ^ f.prim

-- Silence: interface absent from total_slots
theorem silence (f f' : FormationTuple)
    (h1 : f.prim = f'.prim) (h2 : f.trans = f'.trans)
    (h3 : f.output = f'.output) :
    total_slots f = total_slots f' := by
  simp [total_slots, h1, h2, h3]

-- Dark sector theorem: prim < trans → dark exists
-- Two steps: prim^out < trans^out ≤ trans^(prim+out)
theorem dark_sector_exists (f : FormationTuple)
    (h : f.prim < f.trans) (h3 : f.output > 0) :
    visible_slots f < total_slots f := by
  simp [visible_slots, total_slots]
  calc f.prim ^ f.output
      < f.trans ^ f.output := Nat.pow_lt_pow_left h (by omega)
    _ ≤ f.trans ^ (f.prim + f.output) := by
        apply Nat.pow_le_pow_right (by omega)
        omega

-- Wall² when balanced: prim = output → total = wall²
theorem wall_squared (f : FormationTuple) (h : f.prim = f.output) :
    total_slots f = (stormer_wall f) ^ 2 := by
  simp [total_slots, stormer_wall]
  rw [h, sq, ← Nat.pow_add]

-- Instances
def xi : FormationTuple := ⟨2, 3, 2, 0, by omega⟩
def shannon : FormationTuple := ⟨2, 2, 2, 0, by omega⟩
def ym : FormationTuple := ⟨3, 3, 2, 0, by omega⟩
def prop_logic : FormationTuple := ⟨2, 1, 2, 0, by omega⟩

-- Computations for xi = (2,3,2,0)
theorem xi_total : total_slots xi = 81 := by native_decide
theorem xi_visible : visible_slots xi = 4 := by native_decide
theorem xi_dark : dark_slots xi = 77 := by native_decide
theorem xi_balanced : xi.prim = xi.output := by native_decide
theorem xi_wall_sq : total_slots xi = (stormer_wall xi) ^ 2 :=
  wall_squared xi xi_balanced
theorem xi_form_total : xi.formation_total = 7 := by native_decide
theorem xi_77 : dark_slots xi = 7 * 11 := by native_decide

-- Propositional logic is decidable: visible ≥ total
theorem prop_dec : total_slots prop_logic ≤ visible_slots prop_logic := by
  native_decide
