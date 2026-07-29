import canonicalLaneMathlib.AdmissibleClass
import CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.FrobeniusEndomorphism

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure FrobeniusCohomologyPackage {F : FrobeniusEndomorphismPackage} where
  cohomologyGroups : ℕ → Type u
  cohomologyStructure : ∀ n, AddCommGroup (cohomologyGroups n)
  frobeniusAction : ∀ (n : ℕ), cohomologyGroups n →+ cohomologyGroups n
  frobeniusActionLinear : ∀ n, linearMap (cohomologyGroups n) (cohomologyGroups n)
  frobeniusActionNatural : ∀ n, ∀ (f : F.ring →+ F.ring), (frobeniusAction n).comp (cohomologyMap f n) = (cohomologyMap f n).comp (frobeniusAction n)
  frobeniusActionIterated : ∀ (n : ℕ), (frobeniusAction n) ^ (F.p : ℕ) = id

structure FrobeniusCohomologyEvidence {F : FrobeniusEndomorphismPackage} (C : FrobeniusCohomologyPackage F) where
  frobeniusActionLinearClosed : ∀ n, linearMap (C.cohomologyGroups n) (C.cohomologyGroups n) := C.frobeniusActionLinear n
  frobeniusActionNaturalClosed : C.frobeniusActionNatural
  frobeniusActionIteratedClosed : C.frobeniusActionIterated

def FrobeniusCohomologyClosed {F : FrobeniusEndomorphismPackage} (C : FrobeniusCohomologyPackage F) : Prop :=
  (∀ n, linearMap (C.cohomologyGroups n) (C.cohomologyGroups n)) ∧
  C.frobeniusActionNatural ∧
  C.frobeniusActionIterated

theorem frobenius_cohomology_closed_from_evidence
    {F : FrobeniusEndomorphismPackage} (C : FrobeniusCohomologyPackage F)
    (E : FrobeniusCohomologyEvidence C) : FrobeniusCohomologyClosed C := by
  refine And.intro (fun n => E.frobeniusActionLinearClosed n)
    (And.intro E.frobeniusActionNaturalClosed E.frobeniusActionIteratedClosed)

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse