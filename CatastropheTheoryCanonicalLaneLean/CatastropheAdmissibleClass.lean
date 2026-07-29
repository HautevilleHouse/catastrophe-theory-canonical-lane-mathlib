import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure CatastropheAdmittedObject where
  stateSpace : Type u
  controlSpace : Type v
  potential : stateSpace → controlSpace → ℝ
  catastropheType : String
  conclusion : Prop

structure CatastropheEndgameState where
  object : CatastropheAdmittedObject

def CatastropheWitnessClosed (O : CatastropheAdmittedObject) : Prop :=
  O.conclusion

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse