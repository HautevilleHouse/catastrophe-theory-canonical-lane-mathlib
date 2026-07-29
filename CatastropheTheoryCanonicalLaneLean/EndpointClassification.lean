import CatastropheTheoryCanonicalLaneLean.Geometrization

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure EndpointClassificationPackage {P : CatastrophePotentialPackage} {C : CanonicalNeighborhoodsPackage P} {U : SurgeryPackage C} (Z : GeometrizationPackage U) where
  targetManifold : Type u
  targetTopology : TopologicalSpace targetManifold
  simplyConnectedClosedThreeManifold : Prop
  sphereEndpoint : ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere targetManifold 3
  endpointMatchesCatastropheStatement : Prop

structure EndpointClassificationEvidence {P : CatastrophePotentialPackage} {C : CanonicalNeighborhoodsPackage P} {U : SurgeryPackage C} {Z : GeometrizationPackage U} (Epkg2 : EndpointClassificationPackage Z) where
  simplyConnectedClosedThreeManifoldClosed : Epkg2.simplyConnectedClosedThreeManifold
  endpointMatchesCatastropheStatementClosed : Epkg2.endpointMatchesCatastropheStatement

def EndpointClassificationClosed {P : CatastrophePotentialPackage} {C : CanonicalNeighborhoodsPackage P} {U : SurgeryPackage C} {Z : GeometrizationPackage U} (Epkg2 : EndpointClassificationPackage Z) : Prop :=
  Epkg2.simplyConnectedClosedThreeManifold ∧ Epkg2.endpointMatchesCatastropheStatement

theorem endpoint_classification_closed_from_evidence {P : CatastrophePotentialPackage} {C : CanonicalNeighborhoodsPackage P} {U : SurgeryPackage C} {Z : GeometrizationPackage U} (Epkg2 : EndpointClassificationPackage Z) (E : EndpointClassificationEvidence Epkg2) : EndpointClassificationClosed Epkg2 := by
  exact And.intro E.simplyConnectedClosedThreeManifoldClosed E.endpointMatchesCatastropheStatementClosed

theorem endpoint_classification_supplies_mathlib_statement {P : CatastrophePotentialPackage} {C : CanonicalNeighborhoodsPackage P} {U : SurgeryPackage C} {Z : GeometrizationPackage U} (Epkg2 : EndpointClassificationPackage Z) : @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere Epkg2.targetManifold Epkg2.targetTopology 3 := Epkg2.sphereEndpoint

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse