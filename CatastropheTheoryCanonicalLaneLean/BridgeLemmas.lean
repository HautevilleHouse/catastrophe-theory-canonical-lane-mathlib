import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CatastropheWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse