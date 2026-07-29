import characteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : FrobeniusAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FrobeniusWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse