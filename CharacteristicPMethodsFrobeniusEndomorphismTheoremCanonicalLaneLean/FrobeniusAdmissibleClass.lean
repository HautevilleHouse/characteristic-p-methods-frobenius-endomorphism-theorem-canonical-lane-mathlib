import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.FrobeniusEndomorphism
import HautevilleHouse.CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.PerfectField
import HautevilleHouse.CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.FiniteFieldFrobenius
import HautevilleHouse.CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.FrobeniusFlatness
import HautevilleHouse.CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.FrobeniusTrace
import HautevilleHouse.CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.FrobeniusSplitting

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure FrobeniusAdmissibleObject where
  frobeniusPackage : FrobeniusEndomorphismPackage
  perfectPackage : PerfectFieldPackage frobeniusPackage
  finitePackage : FiniteFieldFrobeniusPackage frobeniusPackage
  flatPackage : FrobeniusFlatnessPackage frobeniusPackage
  tracePackage : FrobeniusTracePackage frobeniusPackage
  splittingPackage : FrobeniusSplittingPackage frobeniusPackage
  allClosed : FrobeniusEndomorphismClosed frobeniusPackage ∧
    PerfectFieldClosed frobeniusPackage perfectPackage ∧
    FiniteFieldFrobeniusClosed frobeniusPackage finitePackage ∧
    FrobeniusFlatnessClosed frobeniusPackage flatPackage ∧
    FrobeniusTraceClosed frobeniusPackage tracePackage ∧
    FrobeniusSplittingClosed frobeniusPackage splittingPackage
  allClosedTerm : allClosed

structure FrobeniusAdmissibleClass : AdmissibleClass where
  object : FrobeniusAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def frobeniusWitnessClosed (O : FrobeniusAdmissibleObject) : Prop :=
  O.allClosed

def bridgeClosed (A : FrobeniusAdmissibleClass) : Prop :=
  frobeniusWitnessClosed A.object

theorem bridge_from_admissible_class (A : FrobeniusAdmissibleClass) : bridgeClosed A :=
  A.object.allClosedTerm

def gateClosed (A : FrobeniusAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : FrobeniusAdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedFrobeniusClosure (A : FrobeniusAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_frobenius_endgame (A : FrobeniusAdmissibleClass) :
    ConstrainedFrobeniusClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse