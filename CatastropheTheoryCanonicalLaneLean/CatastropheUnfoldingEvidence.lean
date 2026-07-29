import canonicalLaneMathlib.AdmissibleClass
import CatastropheTheoryCanonicalLaneLean.CatastrophePotentialForm

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure CatastropheUnfoldingPackage (P : CatastrophePotentialFormPackage) where
  unfoldingFamily : Prop
  versalityCondition : Prop
  bifurcationSetComputed : Prop

structure CatastropheUnfoldingEvidence {P : CatastrophePotentialFormPackage}
    (U : CatastropheUnfoldingPackage P) where
  unfoldingFamilyClosed : U.unfoldingFamily
  versalityConditionClosed : U.versalityCondition
  bifurcationSetComputedClosed : U.bifurcationSetComputed

def CatastropheUnfoldingClosed {P : CatastrophePotentialFormPackage}
    (U : CatastropheUnfoldingPackage P) : Prop :=
  U.unfoldingFamily ∧ U.versalityCondition ∧ U.bifurcationSetComputed

theorem catastrophe_unfolding_closed_from_evidence
    {P : CatastrophePotentialFormPackage} (U : CatastropheUnfoldingPackage P)
    (E : CatastropheUnfoldingEvidence U) : CatastropheUnfoldingClosed U := by
  exact And.intro E.unfoldingFamilyClosed
    (And.intro E.versalityConditionClosed E.bifurcationSetComputedClosed)

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse