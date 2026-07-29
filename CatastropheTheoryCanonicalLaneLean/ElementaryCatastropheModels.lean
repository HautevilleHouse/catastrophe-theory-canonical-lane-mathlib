import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

structure ElementaryCatastropheModel where
  dimension : Nat
  potentialFunction : String
  parameterCount : Nat
  normalForm : String
  codimension : Nat

structure ElementaryCatastropheModels where
  fold : ElementaryCatastropheModel
  cusp : ElementaryCatastropheModel
  swallowtail : ElementaryCatastropheModel
  butterfly : ElementaryCatastropheModel
  wigwam : ElementaryCatastropheModel

def elementaryCatastropheModels : ElementaryCatastropheModels :=
  { fold := { dimension := 1, potentialFunction := "x^3/3 + u*x", parameterCount := 1, normalForm := "x^3 + u*x", codimension := 1 }
    , cusp := { dimension := 1, potentialFunction := "x^4/4 + u*x^2/2 + v*x", parameterCount := 2, normalForm := "x^4 + u*x^2 + v*x", codimension := 2 }
    , swallowtail := { dimension := 1, potentialFunction := "x^5/5 + u*x^3/3 + v*x^2/2 + w*x", parameterCount := 3, normalForm := "x^5 + u*x^3 + v*x^2 + w*x", codimension := 3 }
    , butterfly := { dimension := 1, potentialFunction := "x^6/6 + a*x^4/4 + b*x^3/3 + c*x^2/2 + d*x", parameterCount := 4, normalForm := "x^6 + a*x^4 + b*x^3 + c*x^2 + d*x", codimension := 4 }
    , wigwam := { dimension := 1, potentialFunction := "x^7/7 + p*x^5/5 + q*x^4/4 + r*x^3/3 + s*x^2/2 + t*x", parameterCount := 5, normalForm := "x^7 + p*x^5 + q*x^4 + r*x^3 + s*x^2 + t*x", codimension := 5 }
  }

theorem fold_codimension_one : elementaryCatastropheModels.fold.codimension = 1 := by rfl
theorem cusp_codimension_two : elementaryCatastropheModels.cusp.codimension = 2 := by rfl
theorem swallowtail_codimension_three : elementaryCatastropheModels.swallowtail.codimension = 3 := by rfl
theorem butterfly_codimension_four : elementaryCatastropheModels.butterfly.codimension = 4 := by rfl
theorem wigwam_codimension_five : elementaryCatastropheModels.wigwam.codimension = 5 := by rfl

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse