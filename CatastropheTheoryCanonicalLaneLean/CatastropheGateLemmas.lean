import canonicalLaneMathlib.AdmissibleClass
import CatastropheTheoryCanonicalLaneLean.CatastropheBridgeLemmas

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse