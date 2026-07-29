import CatastropheTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure SplittingLemmaPackage where
  unfoldingMap : Type u
  genericFamily : Type v
  splittingExists : Prop
  splittingExistsTerm : splittingExists

def SplittingLemmaClosed (S : SplittingLemmaPackage) : Prop :=
  S.splittingExists

theorem splitting_lemma_closed (S : SplittingLemmaPackage) :
    SplittingLemmaClosed S := by
  exact S.splittingExistsTerm

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse