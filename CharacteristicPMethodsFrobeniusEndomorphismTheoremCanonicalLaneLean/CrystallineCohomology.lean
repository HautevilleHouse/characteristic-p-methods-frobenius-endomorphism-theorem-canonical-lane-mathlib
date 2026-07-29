import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure CrystallineCohomologyPackage where
  scheme : Type u
  baseField : Type v
  crystallineSite : Type w
  frobeniusAction : Prop
  hypercohomology : Type x
  comparisonTheoremProp : Prop

structure CrystallineCohomologyEvidence (C : CrystallineCohomologyPackage) where
  frobeniusActionClosed : C.frobeniusAction
  comparisonTheoremPropClosed : C.comparisonTheoremProp

def CrystallineCohomologyClosed (C : CrystallineCohomologyPackage) : Prop :=
  C.frobeniusAction ∧ C.comparisonTheoremProp

theorem crystalline_cohomology_closed_from_evidence (C : CrystallineCohomologyPackage) (E : CrystallineCohomologyEvidence C) :
    CrystallineCohomologyClosed C := by
  exact And.intro E.frobeniusActionClosed E.comparisonTheoremPropClosed

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse