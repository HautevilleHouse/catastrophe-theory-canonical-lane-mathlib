import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure PotentialFunction (M : Type u) [TopologicalSpace M] where
  stateSpace : M
  smoothFunction : M → ℝ
  gradient : M → M
  hessian : M → (M → M → ℝ)
  morseCondition : Prop
  morseConditionTerm : morseCondition

structure MorsePotential (M : Type u) [TopologicalSpace M] (P : PotentialFunction M) where
  nondegenerateCriticals : Prop
  isolatedSingularities : Prop
  nondegenerateCriticalsTerm : nondegenerateCriticals
  isolatedSingularitiesTerm : isolatedSingularities

def MorsePotentialClosed {M : Type u} [TopologicalSpace M] {P : PotentialFunction M} (MP : MorsePotential M P) : Prop :=
  MP.nondegenerateCriticals ∧ MP.isolatedSingularities

theorem morse_potential_closed_from_evidence {M : Type u} [TopologicalSpace M] {P : PotentialFunction M} (MP : MorsePotential M P) :
    MorsePotentialClosed MP := by
  exact And.intro MP.nondegenerateCriticalsTerm MP.isolatedSingularitiesTerm

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse