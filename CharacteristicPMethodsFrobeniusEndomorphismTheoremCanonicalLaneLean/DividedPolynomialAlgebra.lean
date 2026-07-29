import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure DividedPolynomialAlgebra where
  ring : Type u
  charP : Nat
  frobeniusEndomorphism : ring → ring
  dividedPowers : ℕ → ring → ring
  dividedPowersProperty : Prop
  frobeniusPthRoot : ring → ring
  frobeniusPthRootProperty : Prop

structure DividedPolynomialAlgebraEvidence (D : DividedPolynomialAlgebra) where
  dividedPowersPropertyClosed : D.dividedPowersProperty
  frobeniusPthRootPropertyClosed : D.frobeniusPthRootProperty

def DividedPolynomialAlgebraClosed (D : DividedPolynomialAlgebra) : Prop :=
  D.dividedPowersProperty ∧ D.frobeniusPthRootProperty

theorem divided_polynomial_algebra_closed_from_evidence
    (D : DividedPolynomialAlgebra) (E : DividedPolynomialAlgebraEvidence D) :
    DividedPolynomialAlgebraClosed D := by
  exact And.intro E.dividedPowersPropertyClosed E.frobeniusPthRootPropertyClosed

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse