import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.FrobeniusEndomorphism

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure FiniteFieldFrobeniusPackage (F : FrobeniusEndomorphismPackage) where
  finite : Fintype F.carrier
  frobeniusAutomorphism : F.carrier ≃+* F.carrier
  frobeniusAutomorphismDef : frobeniusAutomorphism = { toFun := F.frobeniusEndomorphism, invFun := F.frobeniusEndomorphism, left_inv := by
    intro x; simp [F.frobeniusDefined, pow_pow, F.prime, F.charP],
    right_inv := by intro x; simp [F.frobeniusDefined, pow_pow, F.prime, F.charP],
    map_mul' := by intro x y; simp [F.frobeniusDefined, mul_pow],
    map_add' := by intro x y; simp [F.frobeniusDefined, add_pow, CharP.charP F.carrier F.prime] }

structure FiniteFieldFrobeniusEvidence (F : FrobeniusEndomorphismPackage)
    (Fin : FiniteFieldFrobeniusPackage F) where
  frobeniusAutomorphismDefClosed : Fin.frobeniusAutomorphismDef
  frobeniusAutomorphismIsBijection : Function.Bijective F.frobeniusEndomorphism

def FiniteFieldFrobeniusClosed (F : FrobeniusEndomorphismPackage) (Fin : FiniteFieldFrobeniusPackage F) : Prop :=
  Fin.frobeniusAutomorphismDef ∧ Function.Bijective F.frobeniusEndomorphism

theorem finite_field_frobenius_closed_from_evidence (F : FrobeniusEndomorphismPackage)
    (Fin : FiniteFieldFrobeniusPackage F) (E : FiniteFieldFrobeniusEvidence F Fin) :
    FiniteFieldFrobeniusClosed F Fin := by
  exact And.intro E.frobeniusAutomorphismDefClosed E.frobeniusAutomorphismIsBijection

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse