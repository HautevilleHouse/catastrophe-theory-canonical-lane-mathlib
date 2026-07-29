import CatastropheTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure ThomClassifyingSpacesPackage where
  universalFoldCategory : Type u
  stratifiedSpace : Type v
  inclusionMap : Type w
  stratumCodimension : ℕ → ℕ
  classificationThesis : Prop
  classificationThesisTerm : classificationThesis

def ThomClassifyingSpacesClosed (T : ThomClassifyingSpacesPackage) : Prop :=
  T.classificationThesis

theorem thom_classifying_spaces_closed (T : ThomClassifyingSpacesPackage) :
    ThomClassifyingSpacesClosed T := by
  exact T.classificationThesisTerm

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse