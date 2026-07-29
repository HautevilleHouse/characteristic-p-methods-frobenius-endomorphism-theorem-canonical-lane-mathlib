import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.FrobeniusEndomorphism

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure PerfectField (p : Nat) [Fact p.Prime] (F : FrobeniusEndomorphismPackage p) where
  surjectiveFrobenius : Function.Surjective F.frobeniusMap
  perfectClosure : Type u
  embedding : PerfectRing F.R p

structure PerfectFieldEvidence (p : Nat) [Fact p.Prime] (F : FrobeniusEndomorphismPackage p) (P : PerfectField p F) where
  surjectiveFrobeniusClosed : P.surjectiveFrobenius
  perfectClosureClosed : Prop

def PerfectFieldClosed (p : Nat) [Fact p.Prime] (F : FrobeniusEndomorphismPackage p) (P : PerfectField p F) : Prop :=
  P.surjectiveFrobenius

theorem perfect_field_closed_from_evidence (p : Nat) [Fact p.Prime] (F : FrobeniusEndomorphismPackage p) (P : PerfectField p F) (E : PerfectFieldEvidence p F P) :
    PerfectFieldClosed p F P := by
  exact E.surjectiveFrobeniusClosed

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse