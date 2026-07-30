import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

structure DispersionRelation where
  omega : ℝ → ℝ  -- angular frequency as function of wavenumber
  groupSpeed : ℝ → ℝ
  phaseSpeed : ℝ → ℝ
  deepWaterLimit : Prop
  shallowWaterLimit : Prop

def linearGravityWaveDispersion : DispersionRelation := {
  omega := fun k => Real.sqrt (9.81 * k),
  groupSpeed := fun k => (1/2) * Real.sqrt (9.81 / k),
  phaseSpeed := fun k => Real.sqrt (9.81 / k),
  deepWaterLimit := by
    intro h; exact True,
  shallowWaterLimit := by
    intro h; exact True
}

end WavesIncompressibleViscousFluidsCanonicalLaneLean
end HautevilleHouse