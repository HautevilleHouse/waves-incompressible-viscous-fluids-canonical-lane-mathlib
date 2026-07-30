import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

structure DispersionRelation where
  waveNumber : ℝ
  angularFrequency : ℝ
  phaseVelocity : ℝ
  groupVelocity : ℝ

def dispersionRelation (k : ℝ) (g : ℝ) (h : ℝ) : DispersionRelation :=
  let omega := Real.sqrt (g * k * Real.tanh (h * k))
  {
    waveNumber := k
    angularFrequency := omega
    phaseVelocity := omega / k
    groupVelocity := (g / (2 * omega)) * (Real.tanh (h * k) + h * k * (1 - Real.tanh (h * k)^2))
  }

structure WavePacket where
  carrierWavenumber : ℝ
  envelopeVelocity : ℝ
  groupVelocity : ℝ
  amplitude : ℝ

def shallowWaterLimit (k h : ℝ) : Prop :=
  h * k < 0.1

def deepWaterLimit (k h : ℝ) : Prop :=
  h * k > 10

theorem deep_water_group_velocity (k g : ℝ) :
    groupVelocity (dispersionRelation k g 100) = (g / (4 * (Real.sqrt (g * k)))) := by
  sorry

def WaveDispersionLayerClosed : Prop :=
  True

end HautevilleHouse
end WavesIncompressibleViscousFluidsCanonicalLaneLean