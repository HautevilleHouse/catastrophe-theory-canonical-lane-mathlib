import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure BifurcationSet (P : MorseFamilyParameters) (M : MorseFamily P) where
  criticalValueSet : Set ℝ
  catastrophePoints : Set M.criticalPoints
  smoothExceptOnCatastrophe : Prop
  codimensionOneStrata : Prop
  stratificationKnown : Prop

structure BifurcationEvidence (P : MorseFamilyParameters) (M : MorseFamily P)
    (B : BifurcationSet P M) where
  smoothExceptOnCatastropheClosed : B.smoothExceptOnCatastrophe
  codimensionOneStrataClosed : B.codimensionOneStrata
  stratificationKnownClosed : B.stratificationKnown

def BifurcationSetClosed (P : MorseFamilyParameters) (M : MorseFamily P)
    (B : BifurcationSet P M) : Prop :=
  B.smoothExceptOnCatastrophe ∧ B.codimensionOneStrata ∧ B.stratificationKnown

theorem bifurcation_set_closed_from_evidence (P : MorseFamilyParameters) (M : MorseFamily P)
    (B : BifurcationSet P M) (E : BifurcationEvidence P M B) :
    BifurcationSetClosed P M B := by
  exact And.intro E.smoothExceptOnCatastropheClosed (And.intro E.codimensionOneStrataClosed E.stratificationKnownClosed)

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse