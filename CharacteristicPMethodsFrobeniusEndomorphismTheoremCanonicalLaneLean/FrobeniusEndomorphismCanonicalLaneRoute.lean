import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure FrobeniusEndomorphismRouteObligations where
  frobeniusMapClosed : Prop
  frobeniusLinearClosed : Prop
  frobeniusPthRootClosed : Prop
  perfectFieldClosed : Prop
  finiteFieldClosed : Prop

structure FrobeniusEndomorphismRouteEvidence (R : FrobeniusEndomorphismRouteObligations) where
  frobeniusMapClosedInv : R.frobeniusMapClosed
  frobeniusLinearClosedInv : R.frobeniusLinearClosed
  frobeniusPthRootClosedInv : R.frobeniusPthRootClosed
  perfectFieldClosedInv : R.perfectFieldClosed
  finiteFieldClosedInv : R.finiteFieldClosed

def FrobeniusEndomorphismRouteClosed (R : FrobeniusEndomorphismRouteObligations) : Prop :=
  R.frobeniusMapClosed ∧ R.frobeniusLinearClosed ∧ R.frobeniusPthRootClosed ∧
  R.perfectFieldClosed ∧ R.finiteFieldClosed

theorem frobenius_endomorphism_route_closed_from_evidence
    (R : FrobeniusEndomorphismRouteObligations) (E : FrobeniusEndomorphismRouteEvidence R) :
    FrobeniusEndomorphismRouteClosed R := by
  exact And.intro E.frobeniusMapClosedInv
    (And.intro E.frobeniusLinearClosedInv
      (And.intro E.frobeniusPthRootClosedInv
        (And.intro E.perfectFieldClosedInv E.finiteFieldClosedInv)))

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse