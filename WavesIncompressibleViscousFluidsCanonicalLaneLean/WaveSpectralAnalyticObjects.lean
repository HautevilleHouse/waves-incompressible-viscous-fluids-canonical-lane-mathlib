import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

structure WaveSurface where
  elevation : ScalarField
  horizontalVelocity : VectorField
  operators : NavierStokesOperators

def zeroElevation : ScalarField := fun _ _ => 0
def zeroHorizontalVelocity : VectorField := fun _ _ _ => 0

structure WaveFlow where
  surface : WaveSurface
  viscosity : ℝ
  surfaceTension : ℝ
  gravity : ℝ
  density : ℝ

def primitiveWaveSurface : WaveSurface := {
  elevation := zeroElevation
  horizontalVelocity := zeroHorizontalVelocity
  operators := primitiveOperators
}

def primitiveWaveFlow : WaveFlow := {
  surface := primitiveWaveSurface
  viscosity := 1
  surfaceTension := 0.074
  gravity := 9.81
  density := 1000
}

def DispersionRelation (k : ℝ) (g : ℝ) (σ : ℝ) (ρ : ℝ) (h : ℝ) : ℝ :=
  Real.sqrt ((g * k + σ * k^3 / ρ) * Real.tanh (k * h))

def LinearizedFreeSurface (F : WaveFlow) : Prop :=
  F.surface.elevation = zeroElevation

def WaveKinematicCondition (F : WaveFlow) : Prop :=
  F.surface.operators.divergence F.surface.horizontalVelocity = zeroScalarField

def DynamicBoundaryCondition (F : WaveFlow) : Prop :=
  F.surface.operators.laplacian F.surface.horizontalVelocity = zeroVectorField

end WavesIncompressibleViscousFluidsCanonicalLaneLean
end HautevilleHouse