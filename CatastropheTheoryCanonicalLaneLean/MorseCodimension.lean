import CatastropheTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure MorseCodimensionPackage where
  targetDimension : ℕ
  corank : ℕ
  codimension : ℕ
  kernelBasisSize : codimension = corank

def MorseCodimensionClosed (M : MorseCodimensionPackage) : Prop :=
  M.codimension = M.corank

theorem morse_codimension_closed (M : MorseCodimensionPackage) :
    MorseCodimensionClosed M := by
  exact M.kernelBasisSize

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse