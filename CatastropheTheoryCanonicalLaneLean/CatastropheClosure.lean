import canonicalLaneMathlib.AdmissibleClass
import CatastropheTheoryCanonicalLaneLean.PotentialFunctionUnfolding
import CatastropheTheoryCanonicalLaneLean.ElementaryCatastrophes
import CatastropheTheoryCanonicalLaneLean.CatastropheClassification

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PotentialFunctionUnfoldingClosed A.potentialUnfolding ∧
  ElementaryCatastrophesClosed A.elementaryCatastrophes

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  have hp : PotentialFunctionUnfoldingClosed A.potentialUnfolding :=
    potential_function_unfolding_closed_from_evidence A.potentialUnfolding A.evidenceP
  have he : ElementaryCatastrophesClosed A.elementaryCatastrophes :=
    elementary_catastrophes_closed_from_evidence A.elementaryCatastrophes A.evidenceE
  exact And.intro hp he

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedCatastropheClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_catastrophe_endgame (A : AdmissibleClass) : ConstrainedCatastropheClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse
