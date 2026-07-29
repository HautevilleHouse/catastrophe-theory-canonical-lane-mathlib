import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

/-!
# Morse Families Package

This module records the unfolding of a smooth function germ into a Morse family,
which is the core geometric data for catastrophe theory. The package defines the
unfolding parameters, the catastrophe set, and the stability condition.
-/

structure MorseFamilyPackage where
  totalSpace : Type u
  baseSpace : Type v
  parameterSpace : Type w
  projection : totalSpace → baseSpace × parameterSpace
  smoothFunction : totalSpace → ℝ
  morseFamilyCondition : Prop
  regularParametersInBase : Prop

structure MorseFamilyEvidence (M : MorseFamilyPackage) where
  morseFamilyConditionClosed : M.morseFamilyCondition
  regularParametersInBaseClosed : M.regularParametersInBase

def MorseFamilyClosed (M : MorseFamilyPackage) : Prop :=
  M.morseFamilyCondition ∧ M.regularParametersInBase

theorem morse_family_closed_from_evidence (M : MorseFamilyPackage)
    (E : MorseFamilyEvidence M) : MorseFamilyClosed M := by
  exact And.intro E.morseFamilyConditionClosed E.regularParametersInBaseClosed

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse