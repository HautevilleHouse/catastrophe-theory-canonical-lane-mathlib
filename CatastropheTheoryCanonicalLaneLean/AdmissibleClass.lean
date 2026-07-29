import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure AdmissibleClass where
  object : CatastropheAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CatastropheWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse