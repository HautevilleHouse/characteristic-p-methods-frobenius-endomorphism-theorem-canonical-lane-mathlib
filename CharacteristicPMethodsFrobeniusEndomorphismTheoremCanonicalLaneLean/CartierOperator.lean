import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure CartierOperator where
  ring : Type u
  charP : Nat
  frobeniusEndomorphism : ring → ring
  cartierOperator : ring → ring
  cartierProperty : Prop
  frobeniusCohomology : Prop

structure CartierOperatorEvidence (C : CartierOperator) where
  cartierPropertyClosed : C.cartierProperty
  frobeniusCohomologyClosed : C.frobeniusCohomology

def CartierOperatorClosed (C : CartierOperator) : Prop :=
  C.cartierProperty ∧ C.frobeniusCohomology

theorem cartier_operator_closed_from_evidence
    (C : CartierOperator) (E : CartierOperatorEvidence C) :
    CartierOperatorClosed C := by
  exact And.intro E.cartierPropertyClosed E.frobeniusCohomologyClosed

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse