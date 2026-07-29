import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure CatastrophePotentialFormPackage where
  stateDimension : ℕ
  controlDimension : ℕ
  potentialFamily : String
  singularityType : String
  stabilityCondition : Prop

structure CatastrophePotentialFormEvidence (P : CatastrophePotentialFormPackage) where
  stateDimensionClosed : P.stateDimension = 1 ∨ P.stateDimension = 2
  controlDimensionClosed : P.controlDimension ≤ 5
  potentialFamilyClosed : P.potentialFamily ∈ ["cusp", "fold", "butterfly", "swallowtail", "hyperbolic umbilical", "elliptic umbilical", "parabolic umbilical"]
  singularityTypeClosed : P.singularityType = "Morse" ∨ P.singularityType = "non-Morse"
  stabilityConditionClosed : P.stabilityCondition

def CatastrophePotentialFormClosed (P : CatastrophePotentialFormPackage) : Prop :=
  P.stabilityCondition

theorem catastrophe_potential_form_closed_from_evidence
    (P : CatastrophePotentialFormPackage) (E : CatastrophePotentialFormEvidence P) :
    CatastrophePotentialFormClosed P := by
  exact E.stabilityConditionClosed

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse