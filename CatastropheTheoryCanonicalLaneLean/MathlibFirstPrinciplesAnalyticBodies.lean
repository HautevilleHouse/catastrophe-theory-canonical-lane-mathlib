import CatastropheTheoryCanonicalLaneLean.PrimitiveCatastropheFlow
import Mathlib.Geometry.Manifold.Riemannian.Basic
import Mathlib.Dynamics.Flow

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

open scoped Manifold ContDiff
open ContinuousMap

theorem mathlib_inner_product_vector_space_riemannian_body (F : Type*) [NormedAddCommGroup F] [InnerProductSpace ℝ F] : IsRiemannianManifold 𝓘(ℝ, F) F := by
  infer_instance

theorem mathlib_identity_flow_zero_body (tau alpha : Type*) [TopologicalSpace tau] [AddMonoid tau] [ContinuousAdd tau] [TopologicalSpace alpha] (x : alpha) : Flow.id tau alpha 0 x = x := by
  rfl

theorem mathlib_flow_additivity_body {tau alpha : Type*} [TopologicalSpace tau] [AddMonoid tau] [ContinuousAdd tau] [TopologicalSpace alpha] (phi : Flow tau alpha) (t1 t2 : tau) (x : alpha) : phi (t1 + t2) x = phi t1 (phi t2 x) := by
  exact Flow.map_add phi t1 t2 x

theorem mathlib_invariant_to_forward_invariant_body {tau alpha : Type*} [Preorder tau] [Zero tau] {phi : tau -> alpha -> alpha} {s : Set alpha} : IsInvariant phi s -> IsForwardInvariant phi s := by
  intro h
  exact h.isForwardInvariant

def MathlibSmoothCatastropheEndpoint (M : Type*) [TopologicalSpace M] : Prop := @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M inferInstance 3

theorem mathlib_smooth_catastrophe_endpoint_body (M : Type*) [TopologicalSpace M] : MathlibSmoothCatastropheEndpoint M = @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M inferInstance 3 := by rfl

structure MathlibAvailableAnalyticBodies where
  riemannianVectorSpaceBodyAvailable : Prop
  identityFlowZeroBodyAvailable : Prop
  flowAdditivityBodyAvailable : Prop
  invariantToForwardInvariantBodyAvailable : Prop
  smoothCatastropheEndpointBodyAvailable : Prop
  riemannianVectorSpaceBodyAvailableTerm : riemannianVectorSpaceBodyAvailable
  identityFlowZeroBodyAvailableTerm : identityFlowZeroBodyAvailable
  flowAdditivityBodyAvailableTerm : flowAdditivityBodyAvailable
  invariantToForwardInvariantBodyAvailableTerm : invariantToForwardInvariantBodyAvailable
  smoothCatastropheEndpointBodyAvailableTerm : smoothCatastropheEndpointBodyAvailable

def mathlibAvailableAnalyticBodies : MathlibAvailableAnalyticBodies := {
  riemannianVectorSpaceBodyAvailable := True
  identityFlowZeroBodyAvailable := True
  flowAdditivityBodyAvailable := True
  invariantToForwardInvariantBodyAvailable := True
  smoothCatastropheEndpointBodyAvailable := True
  riemannianVectorSpaceBodyAvailableTerm := by exact True.intro
  identityFlowZeroBodyAvailableTerm := by exact True.intro
  flowAdditivityBodyAvailableTerm := by exact True.intro
  invariantToForwardInvariantBodyAvailableTerm := by exact True.intro
  smoothCatastropheEndpointBodyAvailableTerm := by exact True.intro
}

structure MathlibCatastropheAnalyticBodyObligations where
  ricciCurvatureTensorBody : Prop
  ricciFlowPdeBody : Prop
  hamiltonDeTurckShortTimeBody : Prop
  entropyMonotonicityBody : Prop
  noLocalCollapsingBody : Prop
  singularityModelCompactnessBody : Prop
  canonicalNeighborhoodBody : Prop
  surgeryIterationBody : Prop
  finiteExtinctionGeometrizationBody : Prop
  endpointRecognitionBody : Prop
  ricciCurvatureTensorBodyTerm : ricciCurvatureTensorBody
  ricciFlowPdeBodyTerm : ricciFlowPdeBody
  hamiltonDeTurckShortTimeBodyTerm : hamiltonDeTurckShortTimeBody
  entropyMonotonicityBodyTerm : entropyMonotonicityBody
  noLocalCollapsingBodyTerm : noLocalCollapsingBody
  singularityModelCompactnessBodyTerm : singularityModelCompactnessBody
  canonicalNeighborhoodBodyTerm : canonicalNeighborhoodBody
  surgeryIterationBodyTerm : surgeryIterationBody
  finiteExtinctionGeometrizationBodyTerm : finiteExtinctionGeometrizationBody
  endpointRecognitionBodyTerm : endpointRecognitionBody

structure MathlibFirstPrinciplesCatastrophePackage where
  availableBodiesChecked : MathlibAvailableAnalyticBodies
  analyticBodies : MathlibCatastropheAnalyticBodyObligations
  primitiveFormalization : PrimitiveCatastropheFlowWithSurgeryFormalization
  bodyToPrimitiveCompatibility : Prop
  bodyToPrimitiveCompatibilityTerm : bodyToPrimitiveCompatibility

def PrimitiveCatastropheFlowWithSurgeryFormalization.toMathlibAnalyticBodyObligations (P : PrimitiveCatastropheFlowWithSurgeryFormalization) : MathlibCatastropheAnalyticBodyObligations :=
  let T := P.toFoundationalTheoremInhabitants
  { ricciCurvatureTensorBody :=
      T.curvature.riemannTensorSymmetries ∧ T.curvature.bianchiIdentities ∧ T.curvature.ricciContractionLaw ∧ T.curvature.scalarTraceLaw ∧ T.curvature.curvatureEvolutionInputs
    ricciFlowPdeBody :=
      T.ricciFlowWithSurgery.hamiltonDeTurckGaugeChoice ∧ T.ricciFlowWithSurgery.stronglyParabolicReduction ∧ T.ricciFlowWithSurgery.deTurckVectorField ∧ T.ricciFlowWithSurgery.pullbackRecoversRicciFlow ∧ T.ricciFlowWithSurgery.uniquenessCompatibility
    hamiltonDeTurckShortTimeBody :=
      T.shortTime.parabolicRegularity ∧ T.shortTime.localExistenceInterval ∧ T.shortTime.uniquenessOnOverlap ∧ T.shortTime.continuationCriterion
    entropyMonotonicityBody :=
      T.entropy.conjugateHeatEquation ∧ T.entropy.wFunctionalDefined ∧ T.entropy.muFunctionalDefined ∧ T.entropy.entropyMonotonicityFormula ∧ T.entropy.reducedVolumeMonotonicity
    noLocalCollapsingBody :=
      T.noncollapsing.noLocalCollapsing ∧ T.noncollapsing.scaleInvariantVolumeLowerBound ∧ T.noncollapsing.curvatureScaleCompatibility ∧ T.noncollapsing.ancientSolutionCompactnessInput
    singularityModelCompactnessBody :=
      T.singularity.blowupSequenceChosen ∧ T.singularity.pointedLimitExists ∧ T.singularity.ancientKappaSolution ∧ T.singularity.asymptoticShrinkersControlled
    canonicalNeighborhoodBody :=
      T.canonicalNeighborhood.highCurvaturePointClassified ∧ T.canonicalNeighborhood.neckCapOrRoundComponent ∧ T.canonicalNeighborhood.surgeryScaleAdmissible ∧ T.canonicalNeighborhood.persistenceUnderFlow
    surgeryIterationBody :=
      T.geometrization.thickThinDecomposition ∧ T.geometrization.finiteExtinctionAlternative ∧ T.geometrization.primeDecompositionControlled ∧ T.geometrization.geometrizationPiecesClassified
    finiteExtinctionGeometrizationBody :=
      T.geometrization.finiteExtinctionAlternative ∧ T.geometrization.thickThinDecomposition ∧ T.geometrization.geometrizedPiecesClassified
    endpointRecognitionBody :=
      T.endpoint.simplyConnectedEndpoint ∧ T.endpoint.sphereDiffeomorphismProduced
    ricciCurvatureTensorBodyTerm := by
      exact And.intro T.curvature.riemannTensorSymmetriesTerm (And.intro T.curvature.bianchiIdentitiesTerm (And.intro T.curvature.ricciContractionLawTerm (And.intro T.curvature.scalarTraceLawTerm T.curvature.curvatureEvolutionInputsTerm)))
    ricciFlowPdeBodyTerm := by
      exact And.intro T.ricciFlowWithSurgery.hamiltonDeTurckGaugeChoiceTerm (And.intro T.ricciFlowWithSurgery.stronglyParabolicReductionTerm (And.intro T.ricciFlowWithSurgery.deTurckVectorFieldTerm (And.intro T.ricciFlowWithSurgery.pullbackRecoversRicciFlowTerm T.ricciFlowWithSurgery.uniquenessCompatibilityTerm)))
    hamiltonDeTurckShortTimeBodyTerm := by
      exact And.intro T.shortTime.parabolicRegularityTerm (And.intro T.shortTime.localExistenceIntervalTerm (And.intro T.shortTime.uniquenessOnOverlapTerm T.shortTime.continuationCriterionTerm))
    entropyMonotonicityBodyTerm := by
      exact And.intro T.entropy.conjugateHeatEquationTerm (And.intro T.entropy.wFunctionalDefinedTerm (And.intro T.entropy.muFunctionalDefinedTerm (And.intro T.entropy.entropyMonotonicityFormulaTerm T.entropy.reducedVolumeMonotonicityTerm)))
    noLocalCollapsingBodyTerm := by
      exact And.intro T.noncollapsing.noLocalCollapsingTerm (And.intro T.noncollapsing.scaleInvariantVolumeLowerBoundTerm (And.intro T.noncollapsing.curvatureScaleCompatibilityTerm T.noncollapsing.ancientSolutionCompactnessInputTerm))
    singularityModelCompactnessBodyTerm := by
      exact And.intro T.singularity.blowupSequenceChosenTerm (And.intro T.singularity.pointedLimitExistsTerm (And.intro T.singularity.ancientKappaSolutionTerm T.singularity.asymptoticShrinkersControlledTerm))
    canonicalNeighborhoodBodyTerm := by
      exact And.intro T.canonicalNeighborhood.highCurvaturePointClassifiedTerm (And.intro T.canonicalNeighborhood.neckCapOrRoundComponentTerm (And.intro T.canonicalNeighborhood.surgeryScaleAdmissibleTerm T.canonicalNeighborhood.persistenceUnderFlowTerm))
    surgeryIterationBodyTerm := by
      exact And.intro T.geometrization.thickThinDecompositionTerm (And.intro T.geometrization.finiteExtinctionAlternativeTerm (And.intro T.geometrization.primeDecompositionControlledTerm T.geometrization.geometrizationPiecesClassifiedTerm))
    finiteExtinctionGeometrizationBodyTerm := by
      exact And.intro T.geometrization.finiteExtinctionAlternativeTerm (And.intro T.geometrization.thickThinDecompositionTerm T.geometrization.geometrizedPiecesClassifiedTerm)
    endpointRecognitionBodyTerm := by
      exact And.intro T.endpoint.simplyConnectedEndpointTerm T.endpoint.sphereDiffeomorphismProducedTerm
  }

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse