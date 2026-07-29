import CatastropheTheoryCanonicalLaneLean.Surgery

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure GeometrizationPackage {P : CatastrophePotentialPackage} {C : CanonicalNeighborhoodsPackage P} (U : SurgeryPackage C) where
  finiteExtinctionAlternative : Prop
  thickThinDecomposition : Prop
  geometrizedPiecesClassified : Prop
  simplyConnectedCaseForcesSpherePiece : Prop

structure GeometrizationEvidence {P : CatastrophePotentialPackage} {C : CanonicalNeighborhoodsPackage P} {U : SurgeryPackage C} (Z : GeometrizationPackage U) where
  finiteExtinctionAlternativeClosed : Z.finiteExtinctionAlternative
  thickThinDecompositionClosed : Z.thickThinDecomposition
  geometrizedPiecesClassifiedClosed : Z.geometrizedPiecesClassified
  simplyConnectedCaseForcesSpherePieceClosed : Z.simplyConnectedCaseForcesSpherePiece

def GeometrizationClosed {P : CatastrophePotentialPackage} {C : CanonicalNeighborhoodsPackage P} {U : SurgeryPackage C} (Z : GeometrizationPackage U) : Prop :=
  Z.finiteExtinctionAlternative ∧ Z.thickThinDecomposition ∧ Z.geometrizedPiecesClassified ∧ Z.simplyConnectedCaseForcesSpherePiece

theorem geometrization_closed_from_evidence {P : CatastrophePotentialPackage} {C : CanonicalNeighborhoodsPackage P} {U : SurgeryPackage C} (Z : GeometrizationPackage U) (E : GeometrizationEvidence Z) : GeometrizationClosed Z := by
  exact And.intro E.finiteExtinctionAlternativeClosed
    (And.intro E.thickThinDecompositionClosed
      (And.intro E.geometrizedPiecesClassifiedClosed E.simplyConnectedCaseForcesSpherePieceClosed))

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse