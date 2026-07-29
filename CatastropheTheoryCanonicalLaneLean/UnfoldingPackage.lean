import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CatastropheTheoryCanonicalLaneLean.ElementryCatastrophes

/-!
# Universal Unfolding Package
-/

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure UnfoldingPackage {P : PotentialFunctionPDEPackage}
    {E : PotentialFunctionPDEEvidence P} {C : ElementaryCatastrophesPackage E}
    (Ev : ElementaryCatastrophesEvidence C) where
  unfoldingDimension : Nat
  universalUnfoldingExists : Prop
  stabilityUnderSmallDeformations : Prop
  bifurcationSetDescribed : Prop

structure UnfoldingEvidence {P : PotentialFunctionPDEPackage}
    {E : PotentialFunctionPDEEvidence P} {C : ElementaryCatastrophesPackage E}
    {Ev : ElementaryCatastrophesEvidence C} (U : UnfoldingPackage Ev) where
  unfoldingDimensionClosed : U.unfoldingDimension = 4 ∨ U.unfoldingDimension = 5 ∨ U.unfoldingDimension = 6 ∨ U.unfoldingDimension = 7
  universalUnfoldingExistsClosed : U.universalUnfoldingExists
  stabilityUnderSmallDeformationsClosed : U.stabilityUnderSmallDeformations
  bifurcationSetDescribedClosed : U.bifurcationSetDescribed

def UnfoldingClosed {P : PotentialFunctionPDEPackage}
    {E : PotentialFunctionPDEEvidence P} {C : ElementaryCatastrophesPackage E}
    {Ev : ElementaryCatastrophesEvidence C} (U : UnfoldingPackage Ev) : Prop :=
  (U.unfoldingDimension = 4 ∨ U.unfoldingDimension = 5 ∨ U.unfoldingDimension = 6 ∨ U.unfoldingDimension = 7) ∧
  U.universalUnfoldingExists ∧ U.stabilityUnderSmallDeformations ∧ U.bifurcationSetDescribed

theorem unfolding_closed_from_evidence
    {P : PotentialFunctionPDEPackage} {E : PotentialFunctionPDEEvidence P}
    {C : ElementaryCatastrophesPackage E} {Ev : ElementaryCatastrophesEvidence C}
    (U : UnfoldingPackage Ev) (Uev : UnfoldingEvidence U) :
    UnfoldingClosed U := by
  exact And.intro Uev.unfoldingDimensionClosed
    (And.intro Uev.universalUnfoldingExistsClosed
      (And.intro Uev.stabilityUnderSmallDeformationsClosed Uev.bifurcationSetDescribedClosed))

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse