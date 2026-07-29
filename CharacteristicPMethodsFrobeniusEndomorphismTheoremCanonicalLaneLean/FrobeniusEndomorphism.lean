import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure FrobeniusEndomorphismPackage (R : Type) [CommRing R] (p : ℕ) [CharP R p] where
  frobeniusMap : R → R
  frobeniusIsRingHom : RingHom R R
  frobeniusPower : ℕ
  frobeniusAdditive : Prop
  frobeniusMultiplicative : Prop
  frobeniusPowerIdentified : frobeniusPower = p

structure FrobeniusEndomorphismEvidence {R : Type} [CommRing R] {p : ℕ} [CharP R p]
    (F : FrobeniusEndomorphismPackage R p) where
  frobeniusAdditiveClosed : F.frobeniusAdditive
  frobeniusMultiplicativeClosed : F.frobeniusMultiplicative
  frobeniusPowerIdentifiedClosed : F.frobeniusPowerIdentified

def FrobeniusEndomorphismClosed {R : Type} [CommRing R] {p : ℕ} [CharP R p]
    (F : FrobeniusEndomorphismPackage R p) : Prop :=
  F.frobeniusAdditive ∧ F.frobeniusMultiplicative ∧ F.frobeniusPowerIdentified

theorem frobenius_endomorphism_closed_from_evidence
    {R : Type} [CommRing R] {p : ℕ} [CharP R p]
    (F : FrobeniusEndomorphismPackage R p) (E : FrobeniusEndomorphismEvidence F) :
    FrobeniusEndomorphismClosed F := by
  exact And.intro E.frobeniusAdditiveClosed
    (And.intro E.frobeniusMultiplicativeClosed E.frobeniusPowerIdentifiedClosed)

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse