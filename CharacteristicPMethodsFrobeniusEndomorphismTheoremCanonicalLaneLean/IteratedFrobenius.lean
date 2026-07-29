import canonicalLaneMathlib.AdmissibleClass
import CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean.FrobeniusEndomorphism

namespace HautevilleHouse
namespace CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean

structure IteratedFrobeniusPackage {F : FrobeniusEndomorphismPackage} where
  frobeniusPowers : ℕ → (F.ring →+* F.ring)
  frobeniusPowerDefined : ∀ (n : ℕ) (x : F.ring), frobeniusPowers n x = x ^ (F.p ^ n)
  frobeniusPowerHomomorphisms : ∀ (n : ℕ), RingHom (F.ring) (F.ring)
  frobeniusPowerComposition : ∀ (m n : ℕ), (frobeniusPowers m).comp (frobeniusPowers n) = frobeniusPowers (m + n)
  frobeniusPowerIteration : ∀ (n : ℕ), frobeniusPowers n = ^[F.frobeniusHom] n

structure IteratedFrobeniusEvidence {F : FrobeniusEndomorphismPackage} (I : IteratedFrobeniusPackage F) where
  frobeniusPowerDefinedClosed : I.frobeniusPowerDefined
  frobeniusPowerHomomorphismsClosed : ∀ (n : ℕ), RingHom (F.ring) (F.ring) := I.frobeniusPowerHomomorphisms n
  frobeniusPowerCompositionClosed : I.frobeniusPowerComposition
  frobeniusPowerIterationClosed : I.frobeniusPowerIteration

def IteratedFrobeniusClosed {F : FrobeniusEndomorphismPackage} (I : IteratedFrobeniusPackage F) : Prop :=
  I.frobeniusPowerDefined ∧
  (∀ (n : ℕ), RingHom (F.ring) (F.ring)) ∧
  I.frobeniusPowerComposition ∧
  I.frobeniusPowerIteration

theorem iterated_frobenius_closed_from_evidence
    {F : FrobeniusEndomorphismPackage} (I : IteratedFrobeniusPackage F)
    (E : IteratedFrobeniusEvidence I) : IteratedFrobeniusClosed I := by
  refine And.intro E.frobeniusPowerDefinedClosed
    (And.intro (fun n => E.frobeniusPowerHomomorphismsClosed n)
      (And.intro E.frobeniusPowerCompositionClosed E.frobeniusPowerIterationClosed))

end CharacteristicPMethodsFrobeniusEndomorphismTheoremCanonicalLaneLean
end HautevilleHouse