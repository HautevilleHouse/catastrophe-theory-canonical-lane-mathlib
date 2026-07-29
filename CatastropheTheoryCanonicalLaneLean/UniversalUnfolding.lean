import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure PotentialGerm where
  germ : Type u
  smoothType : TopologicalSpace germ
  dimension : Nat
  singularityAtOrigin : Prop

structure UniversalUnfolding (P : PotentialGerm) where
  unfoldingParameters : Type v
  parameterCount : Nat
  unfoldingFamily : P.germ → unfoldingParameters → ℝ
  transversal : Prop
  stability : Prop
  universality : Prop

structure UnfoldingEvidence (P : PotentialGerm) (U : UniversalUnfolding P) where
  transversalClosed : U.transversal
  stabilityClosed : U.stability
  universalityClosed : U.universality

def UniversalUnfoldingClosed (P : PotentialGerm) (U : UniversalUnfolding P) : Prop :=
  U.transversal ∧ U.stability ∧ U.universality

theorem universal_unfolding_closed_from_evidence (P : PotentialGerm)
    (U : UniversalUnfolding P) (E : UnfoldingEvidence P U) :
    UniversalUnfoldingClosed P U := by
  exact And.intro E.transversalClosed (And.intro E.stabilityClosed E.universalityClosed)

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse