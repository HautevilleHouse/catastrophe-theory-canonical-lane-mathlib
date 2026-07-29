import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure CatastropheClassification where
  elementaryCatastrophesClassified : Prop
  equivalenceUnderRightEquivalence : Prop
  determinacyTheorem : Prop
  numberFiniteForCodimension : Nat → Prop

structure ClassificationEvidence (C : CatastropheClassification) where
  elementaryCatastrophesClassifiedClosed : C.elementaryCatastrophesClassified
  equivalenceUnderRightEquivalenceClosed : C.equivalenceUnderRightEquivalence
  determinacyTheoremClosed : C.determinacyTheorem
  numberFiniteForCodimensionClosed : ∀ n : Nat, C.numberFiniteForCodimension n

def ThomClassificationClosed (C : CatastropheClassification) : Prop :=
  C.elementaryCatastrophesClassified ∧ C.equivalenceUnderRightEquivalence ∧
  C.determinacyTheorem ∧ ∀ n : Nat, C.numberFiniteForCodimension n

theorem thom_classification_closed_from_evidence (C : CatastropheClassification)
    (E : ClassificationEvidence C) : ThomClassificationClosed C := by
  exact And.intro E.elementaryCatastrophesClassifiedClosed
    (And.intro E.equivalenceUnderRightEquivalenceClosed
      (And.intro E.determinacyTheoremClosed E.numberFiniteForCodimensionClosed))

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse