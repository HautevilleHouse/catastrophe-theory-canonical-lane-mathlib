import CatastropheTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure CanonicalNeighborhoodsPackage {P : CatastrophePotentialPackage} where
  highCurvatureRegionCovered : Prop
  neckCapDecomposition : Prop
  scaleCompatibility : Prop
  persistenceUnderFlow : Prop

structure CanonicalNeighborhoodsEvidence {P : CatastrophePotentialPackage} (C : CanonicalNeighborhoodsPackage P) where
  highCurvatureRegionCoveredClosed : C.highCurvatureRegionCovered
  neckCapDecompositionClosed : C.neckCapDecomposition
  scaleCompatibilityClosed : C.scaleCompatibility
  persistenceUnderFlowClosed : C.persistenceUnderFlow

def CanonicalNeighborhoodsClosed {P : CatastrophePotentialPackage} (C : CanonicalNeighborhoodsPackage P) : Prop :=
  C.highCurvatureRegionCovered ∧ C.neckCapDecomposition ∧
  C.scaleCompatibility ∧ C.persistenceUnderFlow

theorem canonical_neighborhoods_closed_from_evidence {P : CatastrophePotentialPackage} (C : CanonicalNeighborhoodsPackage P) (E : CanonicalNeighborhoodsEvidence C) : CanonicalNeighborhoodsClosed C := by
  exact And.intro E.highCurvatureRegionCoveredClosed
    (And.intro E.neckCapDecompositionClosed
      (And.intro E.scaleCompatibilityClosed E.persistenceUnderFlowClosed))

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse