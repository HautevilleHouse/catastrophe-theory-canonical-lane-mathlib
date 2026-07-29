import canonicalLaneMathlib.AdmissibleClass

/-!
# Potential Function PDE Package
-/

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure PotentialFunctionPDEPackage where
  stateSpace : Type u
  controlParameters : Type v
  potential : stateSpace → controlParameters → ℝ
  gradientCondition : Prop
  hessianNondegeneracy : Prop
  morseCondition : Prop

structure PotentialFunctionPDEEvidence (P : PotentialFunctionPDEPackage) where
  gradientConditionClosed : P.gradientCondition
  hessianNondegeneracyClosed : P.hessianNondegeneracy
  morseConditionClosed : P.morseCondition

def PotentialFunctionPDEClosed (P : PotentialFunctionPDEPackage) : Prop :=
  P.gradientCondition ∧ P.hessianNondegeneracy ∧ P.morseCondition

theorem potential_function_pde_closed_from_evidence
    (P : PotentialFunctionPDEPackage) (E : PotentialFunctionPDEEvidence P) :
    PotentialFunctionPDEClosed P := by
  exact And.intro E.gradientConditionClosed
    (And.intro E.hessianNondegeneracyClosed E.morseConditionClosed)

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse