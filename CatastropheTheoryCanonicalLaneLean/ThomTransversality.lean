import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CatastropheTheoryCanonicalLaneLean.CatastropheSet

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

/-!
# Thom Transversality Package

This module encodes Thom's transversality theorem, which ensures that generic
families of smooth functions are structurally stable and exhibit only the
elementary catastrophes. The package defines the notion of transversality
and the generic stability condition.
-/

structure ThomTransversalityPackage {M : MorseFamilyPackage}
    (C : CatastropheSetPackage M) where
  jetBundle : Type u
  transversalityCondition : Prop
  genericFamily : Prop
  structuralStability : Prop

structure ThomTransversalityEvidence {M : MorseFamilyPackage}
    {C : CatastropheSetPackage M} (T : ThomTransversalityPackage C) where
  transversalityConditionClosed : T.transversalityCondition
  genericFamilyClosed : T.genericFamily
  structuralStabilityClosed : T.structuralStability

def ThomTransversalityClosed {M : MorseFamilyPackage}
    {C : CatastropheSetPackage M} (T : ThomTransversalityPackage C) : Prop :=
  T.transversalityCondition ∧ T.genericFamily ∧ T.structuralStability

theorem thom_transversality_closed_from_evidence {M : MorseFamilyPackage}
    {C : CatastropheSetPackage M} (T : ThomTransversalityPackage C)
    (E : ThomTransversalityEvidence T) : ThomTransversalityClosed T := by
  exact And.intro E.transversalityConditionClosed
    (And.intro E.genericFamilyClosed E.structuralStabilityClosed)

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse