import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure UnfoldingParameterSpace where
  controlDim : ℕ
  internalDim : ℕ
  controlSpace : Type u
  smoothProjection : controlSpace → ℝ ^ internalDim
  controlDimTerm : controlDim
  internalDimTerm : internalDim

structure Unfolding (M : Type v) [TopologicalSpace M] (C : UnfoldingParameterSpace) where
  potentialFamily : C.controlSpace → PotentialFunction M
  unfoldingEquation : Prop
  versalCondition : Prop
  unfoldingEquationTerm : unfoldingEquation
  versalConditionTerm : versalCondition

def UnfoldingClosed {M : Type v} [TopologicalSpace M] {C : UnfoldingParameterSpace} (U : Unfolding M C) : Prop :=
  U.unfoldingEquation ∧ U.versalCondition

theorem unfolding_closed_from_evidence {M : Type v} [TopologicalSpace M] {C : UnfoldingParameterSpace} (U : Unfolding M C) (E : U. unfoldingEquationTerm ∧ U.versalConditionTerm) : UnfoldingClosed U := by
  exact And.intro E.1 E.2

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse