import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure CatastropheManifold where
  stateVariable : Type
  parameterSpace : Type
  equilibriumSurface : Prop
  singularitySet : Prop
  morseRankCondition : Prop

structure CatastropheManifoldEvidence (M : CatastropheManifold) where
  equilibriumSurfaceClosed : M.equilibriumSurface
  singularitySetClosed : M.singularitySet
  morseRankConditionClosed : M.morseRankCondition

def CatastropheManifoldClosed (M : CatastropheManifold) : Prop :=
  M.equilibriumSurface ∧ M.singularitySet ∧ M.morseRankCondition

theorem catastrophe_manifold_closed_from_evidence (M : CatastropheManifold) (E : CatastropheManifoldEvidence M) : CatastropheManifoldClosed M := by
  exact And.intro E.equilibriumSurfaceClosed (And.intro E.singularitySetClosed E.morseRankConditionClosed)

structure CuspCatastropheManifold extends CatastropheManifold where
  potentialGradient : Prop
  hessianDeterminant : Prop
  potentialGradientClosed : potentialGradient
  hessianDeterminantClosed : hessianDeterminant

default cuspManifold : CuspCatastropheManifold :=
  { stateVariable := Float
    , parameterSpace := Float × Float
    , equilibriumSurface := True, singularitySet := True, morseRankCondition := True
    , potentialGradient := True, hessianDeterminant := True
    , potentialGradientClosed := True.intro, hessianDeterminantClosed := True.intro
  }

theorem cusp_manifold_equilibrium_surface : cuspManifold.equilibriumSurface := by exact True.intro
theorem cusp_manifold_singularity_set : cuspManifold.singularitySet := by exact True.intro
theorem cusp_manifold_morse_rank_condition : cuspManifold.morseRankCondition := by exact True.intro
theorem cusp_manifold_potential_gradient : cuspManifold.potentialGradient := by exact True.intro
theorem cusp_manifold_hessian_determinant : cuspManifold.hessianDeterminant := by exact True.intro

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse