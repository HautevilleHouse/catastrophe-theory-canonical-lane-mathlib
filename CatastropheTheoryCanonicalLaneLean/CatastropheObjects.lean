import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure CatastropheSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CatastropheAdmittedObject where
  space : CatastropheSpace
  smoothFunction : carrier → ℝ
  criticalPoint : carrier
  nondegenerateHessian : Prop
  conclusion : nondegenerateHessian

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse