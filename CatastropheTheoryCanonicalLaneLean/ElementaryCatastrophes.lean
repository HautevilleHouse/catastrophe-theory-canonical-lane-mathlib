import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CatastropheTheoryCanonicalLaneLean

inductive ElementaryCatastropheType where
  | fold
  | cusp
  | swallowtail
  | butterfly
  | umbilic

def catastropheCodimension (t : ElementaryCatastropheType) : Nat :=
  match t with
  | .fold => 1
  | .cusp => 2
  | .swallowtail => 3
  | .butterfly => 4
  | .umbilic => 2

structure ElementaryCatastrophe (t : ElementaryCatastropheType) where
  normalForm : String
  codimension : Nat
  codimensionMatches : codimension = catastropheCodimension t

structure ElementaryCatastropheEvidence (t : ElementaryCatastropheType)
    (C : ElementaryCatastrophe t) where
  normalFormClosed : C.normalForm = (match t with
    | .fold => "x^3 + u*x"
    | .cusp => "x^4 + u*x^2 + v*x"
    | .swallowtail => "x^5 + u*x^3 + v*x^2 + w*x"
    | .butterfly => "x^6 + u*x^4 + v*x^3 + w*x^2 + t*x"
    | .umbilic => "x^3 + y^3 + u*x*y + v*x + w*y")
  codimensionMatchesClosed : C.codimensionMatches

def ElementaryCatastropheClosed (t : ElementaryCatastropheType)
    (C : ElementaryCatastrophe t) : Prop :=
  C.normalForm = (match t with
    | .fold => "x^3 + u*x"
    | .cusp => "x^4 + u*x^2 + v*x"
    | .swallowtail => "x^5 + u*x^3 + v*x^2 + w*x"
    | .butterfly => "x^6 + u*x^4 + v*x^3 + w*x^2 + t*x"
    | .umbilic => "x^3 + y^3 + u*x*y + v*x + w*y") ∧
  C.codimensionMatches

theorem elementary_catastrophe_closed_from_evidence (t : ElementaryCatastropheType)
    (C : ElementaryCatastrophe t) (E : ElementaryCatastropheEvidence t C) :
    ElementaryCatastropheClosed t C := by
  exact And.intro E.normalFormClosed E.codimensionMatchesClosed

end CatastropheTheoryCanonicalLaneLean
end HautevilleHouse