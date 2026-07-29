import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure PerfectFieldPackage where
  field : Type u
  characteristic : Nat
  frobeniusSurjective : Prop
  perfectClosure : Type v
  perfectClosureEmbedding : perfectClosure → field
  perfectClosureProp : Prop

structure PerfectFieldEvidence (P : PerfectFieldPackage) where
  frobeniusSurjectiveClosed : P.frobeniusSurjective
  perfectClosurePropClosed : P.perfectClosureProp

def PerfectFieldClosed (P : PerfectFieldPackage) : Prop :=
  P.frobeniusSurjective ∧ P.perfectClosureProp

theorem perfect_field_closed_from_evidence (P : PerfectFieldPackage) (E : PerfectFieldEvidence P) :
    PerfectFieldClosed P := by
  exact And.intro E.frobeniusSurjectiveClosed E.perfectClosurePropClosed

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse