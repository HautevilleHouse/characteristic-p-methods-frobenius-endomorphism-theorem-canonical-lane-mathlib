import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure PerfectoidSpaceLift where
  ring : Type u
  charP : Nat
  frobeniusEndomorphism : ring → ring
  tilt : ring → ring
  untilt : ring → ring
  perfectoidProperty : Prop
  tiltProperty : Prop

structure PerfectoidSpaceLiftEvidence (P : PerfectoidSpaceLift) where
  perfectoidPropertyClosed : P.perfectoidProperty
  tiltPropertyClosed : P.tiltProperty

def PerfectoidSpaceLiftClosed (P : PerfectoidSpaceLift) : Prop :=
  P.perfectoidProperty ∧ P.tiltProperty

theorem perfectoid_space_lift_closed_from_evidence
    (P : PerfectoidSpaceLift) (E : PerfectoidSpaceLiftEvidence P) :
    PerfectoidSpaceLiftClosed P := by
  exact And.intro E.perfectoidPropertyClosed E.tiltPropertyClosed

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse