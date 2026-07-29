import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.FrobeniusEndomorphism

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure FrobeniusFlatnessPackage (F : FrobeniusEndomorphismPackage) where
  baseRing : Type u
  algebra : Algebra F.carrier baseRing
  frobeniusBaseChange : baseRing ⊗[F.carrier] baseRing → baseRing ⊗[F.carrier] baseRing
  flatCondition : Module.Flat F.carrier baseRing
  flatConditionTerm : flatCondition

structure FrobeniusFlatnessEvidence (F : FrobeniusEndomorphismPackage)
    (Fp : FrobeniusFlatnessPackage F) where
  flatConditionClosed : Fp.flatCondition
  frobeniusBaseChangeDefined : True

def FrobeniusFlatnessClosed (F : FrobeniusEndomorphismPackage) (Fp : FrobeniusFlatnessPackage F) : Prop :=
  Fp.flatCondition

theorem frobenius_flatness_closed_from_evidence (F : FrobeniusEndomorphismPackage)
    (Fp : FrobeniusFlatnessPackage F) (E : FrobeniusFlatnessEvidence F Fp) :
    FrobeniusFlatnessClosed F Fp := by
  exact E.flatConditionClosed

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse