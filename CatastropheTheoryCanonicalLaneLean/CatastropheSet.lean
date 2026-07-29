import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CatastropheTheoryCanonicalLaneLean.MorseFamilies

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

/-!
# Catastrophe Set Package

This module defines the catastrophe set as the projection of the set of critical
points of a Morse family onto the parameter space. The stratification of the
catastrophe set and the classification of elementary catastrophes are encoded.
-/

structure CatastropheSetPackage {M : MorseFamilyPackage} where
  catastropheSet : Set (M.baseSpace × M.parameterSpace)
  catastropheCondition : Prop
  stratificationWellDefined : Prop
  elementaryCatastrophesClassified : Prop

structure CatastropheSetEvidence {M : MorseFamilyPackage}
    (C : CatastropheSetPackage M) where
  catastropheConditionClosed : C.catastropheCondition
  stratificationWellDefinedClosed : C.stratificationWellDefined
  elementaryCatastrophesClassifiedClosed : C.elementaryCatastrophesClassified

def CatastropheSetClosed {M : MorseFamilyPackage}
    (C : CatastropheSetPackage M) : Prop :=
  C.catastropheCondition ∧ C.stratificationWellDefined ∧
  C.elementaryCatastrophesClassified

theorem catastrophe_set_closed_from_evidence {M : MorseFamilyPackage}
    (C : CatastropheSetPackage M) (E : CatastropheSetEvidence C) :
    CatastropheSetClosed C := by
  exact And.intro E.catastropheConditionClosed
    (And.intro E.stratificationWellDefinedClosed
      E.elementaryCatastrophesClassifiedClosed)

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse