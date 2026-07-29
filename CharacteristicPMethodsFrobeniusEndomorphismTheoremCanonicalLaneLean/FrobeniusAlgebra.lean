import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure FrobeniusAlgebraPackage where
  baseField : Type u
  characteristic : Nat
  primeExponent : Nat
  frobeniusEndomorphism : baseField → baseField
  frobeniusSeparationProp : Prop
  frobeniusLinear : Prop
  frobeniusMultiplicative : Prop
  frobeniusAdditive : Prop

structure FrobeniusAlgebraEvidence (P : FrobeniusAlgebraPackage) where
  frobeniusLinearClosed : P.frobeniusLinear
  frobeniusMultiplicativeClosed : P.frobeniusMultiplicative
  frobeniusAdditiveClosed : P.frobeniusAdditive
  frobeniusSeparationPropClosed : P.frobeniusSeparationProp

def FrobeniusAlgebraClosed (P : FrobeniusAlgebraPackage) : Prop :=
  P.frobeniusLinear ∧ P.frobeniusMultiplicative ∧ P.frobeniusAdditive ∧ P.frobeniusSeparationProp

theorem frobenius_algebra_closed_from_evidence (P : FrobeniusAlgebraPackage) (E : FrobeniusAlgebraEvidence P) :
    FrobeniusAlgebraClosed P := by
  exact And.intro E.frobeniusLinearClosed
    (And.intro E.frobeniusMultiplicativeClosed
      (And.intro E.frobeniusAdditiveClosed E.frobeniusSeparationPropClosed))

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse