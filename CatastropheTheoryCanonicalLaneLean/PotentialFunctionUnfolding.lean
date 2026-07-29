import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure PotentialFunctionUnfoldingPackage where
  parameterSpace : Type u
  stateSpace : Type v
  potentialFunction : parameterSpace -> stateSpace -> ℝ
  unfoldingSmooth : Prop
  morseNondegenerate : Prop
  structuralStability : Prop
  catastropheSetDefined : Prop

structure PotentialFunctionUnfoldingEvidence (P : PotentialFunctionUnfoldingPackage) where
  unfoldingSmoothClosed : P.unfoldingSmooth
  morseNondegenerateClosed : P.morseNondegenerate
  structuralStabilityClosed : P.structuralStability
  catastropheSetDefinedClosed : P.catastropheSetDefined

def PotentialFunctionUnfoldingClosed (P : PotentialFunctionUnfoldingPackage) : Prop :=
  P.unfoldingSmooth ∧ P.morseNondegenerate ∧ P.structuralStability ∧ P.catastropheSetDefined

theorem potential_function_unfolding_closed_from_evidence
    (P : PotentialFunctionUnfoldingPackage) (E : PotentialFunctionUnfoldingEvidence P) :
    PotentialFunctionUnfoldingClosed P := by
  exact And.intro E.unfoldingSmoothClosed
    (And.intro E.morseNondegenerateClosed
      (And.intro E.structuralStabilityClosed E.catastropheSetDefinedClosed))

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse
