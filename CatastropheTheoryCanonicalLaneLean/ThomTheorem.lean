import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CatastropheTheoryCanonicalLaneLean.UnfoldingPackage

/-!
# Thom's Classification Theorem Package
-/

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure ThomTheoremPackage {P : PotentialFunctionPDEPackage}
    {E : PotentialFunctionPDEEvidence P} {C : ElementaryCatastrophesPackage E}
    {Ev : ElementaryCatastrophesEvidence C} {U : UnfoldingPackage Ev}
    (Uev : UnfoldingEvidence U) where
  classificationListed : Prop
  genericityCondition : Prop
  sevenElementaryCatastrophes : Prop
  structuralStability : Prop

structure ThomTheoremEvidence {P : PotentialFunctionPDEPackage}
    {E : PotentialFunctionPDEEvidence P} {C : ElementaryCatastrophesPackage E}
    {Ev : ElementaryCatastrophesEvidence C} {U : UnfoldingPackage Ev}
    {Uev : UnfoldingEvidence U} (T : ThomTheoremPackage Uev) where
  classificationListedClosed : T.classificationListed
  genericityConditionClosed : T.genericityCondition
  sevenElementaryCatastrophesClosed : T.sevenElementaryCatastrophes
  structuralStabilityClosed : T.structuralStability

def ThomTheoremClosed {P : PotentialFunctionPDEPackage}
    {E : PotentialFunctionPDEEvidence P} {C : ElementaryCatastrophesPackage E}
    {Ev : ElementaryCatastrophesEvidence C} {U : UnfoldingPackage Ev}
    {Uev : UnfoldingEvidence U} (T : ThomTheoremPackage Uev) : Prop :=
  T.classificationListed ∧ T.genericityCondition ∧ T.sevenElementaryCatastrophes ∧ T.structuralStability

theorem thom_theorem_closed_from_evidence
    {P : PotentialFunctionPDEPackage} {E : PotentialFunctionPDEEvidence P}
    {C : ElementaryCatastrophesPackage E} {Ev : ElementaryCatastrophesEvidence C}
    {U : UnfoldingPackage Ev} {Uev : UnfoldingEvidence U}
    (T : ThomTheoremPackage Uev) (Tev : ThomTheoremEvidence T) :
    ThomTheoremClosed T := by
  exact And.intro Tev.classificationListedClosed
    (And.intro Tev.genericityConditionClosed
      (And.intro Tev.sevenElementaryCatastrophesClosed Tev.structuralStabilityClosed))

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse