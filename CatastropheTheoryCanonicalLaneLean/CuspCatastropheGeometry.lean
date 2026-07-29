import CatastropheTheoryCanonicalLaneLean.UniversalUnfolding

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure CuspGeometryPackage where
  potentialFunction : ℝ → ℝ → ℝ
  criticalSet : Set (ℝ × ℝ)
  bifurcationSet : Set (ℝ × ℝ)
  cuspPoint : ℝ × ℝ
  stability : Prop

structure CuspGeometryEvidence (C : CuspGeometryPackage) where
  criticalSetClosed : C.criticalSet = { (x, a) | ∂F/∂x = 0 }
  bifurcationSetClosed : C.bifurcationSet = { (x, a) | ∂²F/∂x² = 0 }
  cuspPointClosed : C.cuspPoint = (0,0)
  stabilityClosed : C.stability

def CuspGeometryClosed (C : CuspGeometryPackage) : Prop :=
  C.criticalSet ≠ Set.univ ∧ C.bifurcationSet ≠ Set.univ ∧ C.cuspPoint = (0,0) ∧ C.stability

theorem cusp_geometry_closed_from_evidence (C : CuspGeometryPackage) (E : CuspGeometryEvidence C) :
    CuspGeometryClosed C := by
  refine And.intro ?_ (And.intro ?_ (And.intro E.cuspPointClosed E.stabilityClosed))
  · intro h; have h' := E.criticalSetClosed; rw [h] at h'; exact Set.not_univ_subset (by exact h')
  · intro h; have h' := E.bifurcationSetClosed; rw [h] at h'; exact Set.not_univ_subset (by exact h')

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse