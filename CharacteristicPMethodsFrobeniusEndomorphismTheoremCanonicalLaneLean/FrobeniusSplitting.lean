import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure FrobeniusSplittingPackage where
  variety : Type u
  baseField : Type v
  frobeniusSplitting : Prop
  splittingCompatibility : Prop
  splittingExistenceProp : Prop
  applicationsProp : Prop

structure FrobeniusSplittingEvidence (F : FrobeniusSplittingPackage) where
  frobeniusSplittingClosed : F.frobeniusSplitting
  splittingCompatibilityClosed : F.splittingCompatibility
  splittingExistencePropClosed : F.splittingExistenceProp
  applicationsPropClosed : F.applicationsProp

def FrobeniusSplittingClosed (F : FrobeniusSplittingPackage) : Prop :=
  F.frobeniusSplitting ∧ F.splittingCompatibility ∧ F.splittingExistenceProp ∧ F.applicationsProp

theorem frobenius_splitting_closed_from_evidence (F : FrobeniusSplittingPackage) (E : FrobeniusSplittingEvidence F) :
    FrobeniusSplittingClosed F := by
  exact And.intro E.frobeniusSplittingClosed
    (And.intro E.splittingCompatibilityClosed
      (And.intro E.splittingExistencePropClosed E.applicationsPropClosed))

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse