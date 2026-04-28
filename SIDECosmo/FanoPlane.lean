import Mathlib.Data.Fin.Basic

set_option linter.style.nativeDecide false

/-! # The Fano Plane PG(2, 𝔽₂)
  J. York Seale | ORCID: 0009-0008-7993-0310 -/

def fanoLine : Fin 7 → Fin 7 × Fin 7 × Fin 7
  | 0 => (0, 1, 3)
  | 1 => (1, 2, 4)
  | 2 => (2, 3, 5)
  | 3 => (3, 4, 6)
  | 4 => (4, 5, 0)
  | 5 => (5, 6, 1)
  | 6 => (6, 0, 2)

def onLine (pt : Fin 7) (i : Fin 7) : Bool :=
  let (a, b, c) := fanoLine i
  pt == a || pt == b || pt == c

private def b2n (b : Bool) : Nat := if b then 1 else 0

def linesThrough (pt : Fin 7) : Nat :=
  b2n (onLine pt 0) + b2n (onLine pt 1) + b2n (onLine pt 2) +
  b2n (onLine pt 3) + b2n (onLine pt 4) + b2n (onLine pt 5) +
  b2n (onLine pt 6)

def sharedPoints (i j : Fin 7) : Nat :=
  b2n (onLine 0 i && onLine 0 j) + b2n (onLine 1 i && onLine 1 j) +
  b2n (onLine 2 i && onLine 2 j) + b2n (onLine 3 i && onLine 3 j) +
  b2n (onLine 4 i && onLine 4 j) + b2n (onLine 5 i && onLine 5 j) +
  b2n (onLine 6 i && onLine 6 j)

theorem three_lines_per_point : ∀ pt : Fin 7, linesThrough pt = 3 := by native_decide
theorem unique_intersection : ∀ i j : Fin 7, i ≠ j → sharedPoints i j = 1 := by native_decide
theorem three_distinct : ∀ i : Fin 7,
    let (a, b, c) := fanoLine i; a ≠ b ∧ a ≠ c ∧ b ≠ c := by native_decide
theorem formation_is_fano : 2 + 3 + 2 + 0 = 7 := by native_decide
theorem gl3f2 : 168 = 24 * 7 := by native_decide
theorem char_two : (1 + 1 : Fin 2) = 0 := by native_decide
