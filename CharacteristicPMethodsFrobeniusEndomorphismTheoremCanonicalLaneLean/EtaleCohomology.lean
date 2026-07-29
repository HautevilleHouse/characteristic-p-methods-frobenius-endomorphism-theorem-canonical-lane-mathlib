import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure EtaleCohomologyPackage where
  scheme : Type u
  baseField : Type v
  etaleSite : Type w
  frobeniusAction : Prop
  weightMonodromyProp : Prop
  ladicCohomology : Type x
  comparisonTheoremProp : Prop

structure EtaleCohomologyEvidence (E : EtaleCohomologyPackage) where
  frobeniusActionClosed : E.frobeniusAction
  weightMonodromyPropClosed : E.weightMonodromyProp
  comparisonTheoremPropClosed : E.comparisonTheoremProp

def EtaleCohomologyClosed (E : EtaleCohomologyPackage) : Prop :=
  E.frobeniusAction ∧ E.weightMonodromyProp ∧ E.comparisonTheoremProp

theorem etale_cohomology_closed_from_evidence (E : EtaleCohomologyPackage) (Ev : EtaleCohomologyEvidence E) :
    EtaleCohomologyClosed E := by
  exact And.intro Ev.frobeniusActionClosed
    (And.intro Ev.weightMonodromyPropClosed Ev.comparisonTheoremPropClosed)

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse