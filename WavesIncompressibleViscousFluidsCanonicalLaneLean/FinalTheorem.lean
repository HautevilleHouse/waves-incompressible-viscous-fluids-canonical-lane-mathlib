import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

def ConstrainedWaveClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_wave_endgame (A : AdmissibleClass) : ConstrainedWaveClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end WavesIncompressibleViscousFluidsCanonicalLaneLean
end HautevilleHouse