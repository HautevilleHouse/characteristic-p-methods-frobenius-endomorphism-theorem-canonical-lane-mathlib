import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.EtaleCohomology

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure WeilConjecturesPackage (p : Nat) [Fact p.Prime] (F : FrobeniusEndomorphismPackage p) where
  variety : Type u
  smoothProjVariety : SmoothProjectiveVariety variety
  zetaFunction : ℤ → ℚ
  functionalEquation : Prop
  rationality : Prop
  riemannHypothesis : Prop

structure WeilConjecturesEvidence (p : Nat) [Fact p.Prime] (F : FrobeniusEndomorphismPackage p) (W : WeilConjecturesPackage p F) where
  rationalityClosed : W.rationality
  functionalEquationClosed : W.functionalEquation
  riemannHypothesisClosed : W.riemannHypothesis
  weilConjecturesClosed : Prop

def WeilConjecturesClosed (p : Nat) [Fact p.Prime] (F : FrobeniusEndomorphismPackage p) (W : WeilConjecturesPackage p F) : Prop :=
  W.rationality ∧ W.functionalEquation ∧ W.riemannHypothesis

theorem weil_conjectures_closed_from_evidence (p : Nat) [Fact p.Prime] (F : FrobeniusEndomorphismPackage p) (W : WeilConjecturesPackage p F) (E : WeilConjecturesEvidence p F W) :
    WeilConjecturesClosed p F W := by
  exact And.intro E.rationalityClosed (And.intro E.functionalEquationClosed E.riemannHypothesisClosed)

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse