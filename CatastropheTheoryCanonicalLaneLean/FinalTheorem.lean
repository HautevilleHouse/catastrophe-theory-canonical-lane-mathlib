import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CatastropheTheoryCanonicalLaneLean.ThomTransversality

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

def ConstrainedCatastropheClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_catastrophe_endgame (A : AdmissibleClass) :
    ConstrainedCatastropheClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse