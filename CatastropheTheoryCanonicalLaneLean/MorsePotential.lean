import CatastropheTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure MorsePotentialPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothFunction : manifold → ℝ
  criticalPoint : manifold
  nondegenerateHessian : Prop

structure MorsePotentialEvidence (M : MorsePotentialPackage) where
  nondegenerateHessianClosed : M.nondegenerateHessian

def MorsePotentialClosed (M : MorsePotentialPackage) : Prop :=
  M.nondegenerateHessian

theorem morse_potential_closed_from_evidence (M : MorsePotentialPackage)
    (E : MorsePotentialEvidence M) : MorsePotentialClosed M := by
  exact E.nondegenerateHessianClosed

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse