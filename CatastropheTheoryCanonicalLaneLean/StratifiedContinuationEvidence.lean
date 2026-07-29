import CatastropheTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure StratifiedContinuationEvidence where
  boundaryPreserving : Prop
  liftingExists : Prop
  homotopyExtension : Prop
  boundaryPreservingTerm : boundaryPreserving
  liftingExistsTerm : liftingExists
  homotopyExtensionTerm : homotopyExtension

def StratifiedContinuationEvidenceClosed (E : StratifiedContinuationEvidence) : Prop :=
  E.boundaryPreserving ∧ E.liftingExists ∧ E.homotopyExtension

theorem stratified_continuation_evidence_closed (E : StratifiedContinuationEvidence) :
    StratifiedContinuationEvidenceClosed E := by
  exact And.intro E.boundaryPreservingTerm (And.intro E.liftingExistsTerm E.homotopyExtensionTerm)

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse