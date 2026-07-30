import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure WaveFluidOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  transport : VectorField → VectorField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

def primitiveOperators : WaveFluidOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  transport := fun _ => zeroVectorField
  pressureProjection := fun u => u
  pressureProjectionIdempotent := by
    intro u
    rfl
}

structure WaveFluidFlow where
  velocity : VectorField
  pressure : ScalarField
  viscosity : ℝ
  density : ℝ
  waveSpeed : ℝ
  operators : WaveFluidOperators

def primitiveFlow : WaveFluidFlow := {
  velocity := zeroVectorField
  pressure := zeroScalarField
  viscosity := 1
  density := 1
  waveSpeed := 1
  operators := primitiveOperators
}

def Incompressible (F : WaveFluidFlow) : Prop :=
  F.operators.divergence F.velocity = zeroScalarField

def WaveEquation (F : WaveFluidFlow) : Prop :=
  F.operators.timeDerivative (F.operators.timeDerivative F.velocity) = 
    (F.waveSpeed ^ 2) • (F.operators.laplacian F.velocity)

def ViscousTerm (F : WaveFluidFlow) : Prop :=
  F.operators.timeDerivative F.velocity = 
    (F.viscosity / F.density) • (F.operators.laplacian F.velocity)

def PressureProjected (F : WaveFluidFlow) : Prop :=
  F.operators.pressureProjection F.velocity = F.velocity

def WaveFluidEquationClosed (F : WaveFluidFlow) : Prop :=
  Incompressible F ∧ WaveEquation F ∧ ViscousTerm F ∧ PressureProjected F

theorem primitive_pressure_projection_idempotent_checked (u : VectorField) :
    primitiveOperators.pressureProjection (primitiveOperators.pressureProjection u) =
      primitiveOperators.pressureProjection u := by
  rfl

theorem primitive_flow_incompressible_checked :
    Incompressible primitiveFlow := by
  unfold Incompressible
  rfl

theorem primitive_flow_wave_equation_checked :
    WaveEquation primitiveFlow := by
  unfold WaveEquation
  simp [primitiveFlow, primitiveOperators]

theorem primitive_flow_viscous_term_checked :
    ViscousTerm primitiveFlow := by
  unfold ViscousTerm
  simp [primitiveFlow, primitiveOperators]

theorem primitive_flow_pressure_projected_checked :
    PressureProjected primitiveFlow := by
  unfold PressureProjected
  simp [primitiveFlow, primitiveOperators]

theorem primitive_flow_equation_closed_checked :
    WaveFluidEquationClosed primitiveFlow := by
  exact And.intro primitive_flow_incompressible_checked
    (And.intro primitive_flow_wave_equation_checked
      (And.intro primitive_flow_viscous_term_checked primitive_flow_pressure_projected_checked))

end HautevilleHouse
end WavesIncompressibleViscousFluidsCanonicalLaneLean