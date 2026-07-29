import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.FrobeniusEndomorphism

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure FrobeniusTracePackage (F : FrobeniusEndomorphismPackage) where
  cohomologyGroup : Type u
  traceMap : cohomologyGroup → cohomologyGroup
  traceFormula : ∀ x : cohomologyGroup, traceMap x = ∑ i, x ^ (F.prime ^ i)
  traceFormulaTerm : traceFormula

structure FrobeniusTraceEvidence (F : FrobeniusEndomorphismPackage)
    (T : FrobeniusTracePackage F) where
  traceFormulaClosed : T.traceFormula
  traceMapLinear : LinearMap (ZMod F.prime) T.cohomologyGroup T.cohomologyGroup

def FrobeniusTraceClosed (F : FrobeniusEndomorphismPackage) (T : FrobeniusTracePackage F) : Prop :=
  T.traceFormula ∧ LinearMap (ZMod F.prime) T.cohomologyGroup T.cohomologyGroup

theorem frobenius_trace_closed_from_evidence (F : FrobeniusEndomorphismPackage)
    (T : FrobeniusTracePackage F) (E : FrobeniusTraceEvidence F T) :
    FrobeniusTraceClosed F T := by
  exact And.intro E.traceFormulaClosed E.traceMapLinear

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse