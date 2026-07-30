import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

structure WaveField where
  elevation : ScalarField
  velocity : VectorField

def zeroWaveField : WaveField := {
  elevation := fun _ _ => 0,
  velocity := fun _ _ _ => 0
}

structure WaveKinematics where
  waveField : WaveField
  waveNumber : ℝ
  frequency : ℝ
  phaseSpeed : ℝ
  waveNumberPositive : waveNumber > 0
  frequencyPositive : frequency > 0

def defaultWaveKinematics : WaveKinematics := {
  waveField := zeroWaveField,
  waveNumber := 1,
  frequency := 1,
  phaseSpeed := 1,
  waveNumberPositive := by norm_num,
  frequencyPositive := by norm_num
}

end WavesIncompressibleViscousFluidsCanonicalLaneLean
end HautevilleHouse