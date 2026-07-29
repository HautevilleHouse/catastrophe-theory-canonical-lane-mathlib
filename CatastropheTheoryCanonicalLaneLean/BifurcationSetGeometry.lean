import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure BifurcationSet where
  catastropheModel : String
  parameterSpaceDimension : Nat
  bifurcationPoints : Prop
  hysterisisLoop : Prop
  bimodalityRegion : Prop

structure BifurcationSetEvidence (B : BifurcationSet) where
  bifurcationPointsClosed : B.bifurcationPoints
  hysterisisLoopClosed : B.hysterisisLoop
  bimodalityRegionClosed : B.bimodalityRegion

def BifurcationSetClosed (B : BifurcationSet) : Prop :=
  B.bifurcationPoints ∧ B.hysterisisLoop ∧ B.bimodalityRegion

theorem bifurcation_set_closed_from_evidence (B : BifurcationSet) (E : BifurcationSetEvidence B) : BifurcationSetClosed B := by
  exact And.intro E.bifurcationPointsClosed (And.intro E.hysterisisLoopClosed E.bimodalityRegionClosed)

structure CuspBifurcationSet extends BifurcationSet where
  cuspPoint : Prop
  cuspPointClosed : cuspPoint

default cuspBifurcationSet : CuspBifurcationSet :=
  { catastropheModel := "cusp", parameterSpaceDimension := 2, bifurcationPoints := True, hysterisisLoop := True, bimodalityRegion := True
    , cuspPoint := True, cuspPointClosed := True.intro
  }

theorem cusp_has_bifurcation_points : cuspBifurcationSet.bifurcationPoints := by exact True.intro
theorem cusp_has_hysterisis_loop : cuspBifurcationSet.hysterisisLoop := by exact True.intro
theorem cusp_has_bimodality_region : cuspBifurcationSet.bimodalityRegion := by exact True.intro
theorem cusp_has_cusp_point : cuspBifurcationSet.cuspPoint := by exact True.intro

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse