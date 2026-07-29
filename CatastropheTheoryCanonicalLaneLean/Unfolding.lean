import CatastropheTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure UniversalUnfoldingPackage where
  parameterSpace : Type u
  parameterTopology : TopologicalSpace parameterSpace
  unfoldedFunction : parameterSpace → ℝ → ℝ
  unfoldingUniversal : Prop
  unfoldingStable : Prop

structure UniversalUnfoldingEvidence (U : UniversalUnfoldingPackage) where
  unfoldingUniversalClosed : U.unfoldingUniversal
  unfoldingStableClosed : U.unfoldingStable

def UniversalUnfoldingClosed (U : UniversalUnfoldingPackage) : Prop :=
  U.unfoldingUniversal ∧ U.unfoldingStable

theorem universal_unfolding_closed_from_evidence (U : UniversalUnfoldingPackage)
    (E : UniversalUnfoldingEvidence U) : UniversalUnfoldingClosed U := by
  exact And.intro E.unfoldingUniversalClosed E.unfoldingStableClosed

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse