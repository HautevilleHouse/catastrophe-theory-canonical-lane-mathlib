import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure StructuralStabilityPackage (M : Type u) [TopologicalSpace M] where
  potentialFamily : M → ℝ
  germ : M
  kDeterminacy : ℕ
  transversalityCondition : Prop
  kDeterminacyTerm : kDeterminacy
  transversalityConditionTerm : transversalityCondition

structure StabilityCondition (M : Type u) [TopologicalSpace M] (S : StructuralStabilityPackage M) where
  rightEquivalenceGroupoid : Prop
  infinitesimalStability : Prop
  finiteDeterminacyTheorem : S.kDeterminacy > 0
  rightEquivalenceGroupoidTerm : rightEquivalenceGroupoid
  infinitesimalStabilityTerm : infinitesimalStability

def StabilityConditionClosed {M : Type u} [TopologicalSpace M] {S : StructuralStabilityPackage M} (C : StabilityCondition M S) : Prop :=
  C.rightEquivalenceGroupoid ∧ C.infinitesimalStability ∧ C.finiteDeterminacyTheorem

theorem stability_condition_closed_from_evidence {M : Type u} [TopologicalSpace M] {S : StructuralStabilityPackage M} (C : StabilityCondition M S) (E : C.rightEquivalenceGroupoidTerm ∧ C.infinitesimalStabilityTerm) : StabilityConditionClosed C := by
  refine And.intro E.1 (And.intro E.2 C.finiteDeterminacyTheorem)

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse