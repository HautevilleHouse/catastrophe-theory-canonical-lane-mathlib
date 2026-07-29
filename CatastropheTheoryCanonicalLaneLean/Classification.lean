import CatastropheTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

inductive CatastropheType where
  | fold
  | cusp
  | swallowtail
  | butterfly
  | hyperbolicUmbrella
  | ellipticUmbrella
  | parabolicUmbrella

structure CatastropheClassificationPackage where
  classificationType : CatastropheType
  classificationComplete : Prop
  classificationUnique : Prop

structure CatastropheClassificationEvidence (C : CatastropheClassificationPackage) where
  classificationCompleteClosed : C.classificationComplete
  classificationUniqueClosed : C.classificationUnique

def CatastropheClassificationClosed (C : CatastropheClassificationPackage) : Prop :=
  C.classificationComplete ∧ C.classificationUnique

theorem catastrophe_classification_closed_from_evidence
    (C : CatastropheClassificationPackage)
    (E : CatastropheClassificationEvidence C) : CatastropheClassificationClosed C := by
  exact And.intro E.classificationCompleteClosed E.classificationUniqueClosed

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse