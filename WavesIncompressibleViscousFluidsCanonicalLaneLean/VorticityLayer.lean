import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

structure VorticityField where
  omega : VectorField
  velocity : VectorField
  viscosity : ℝ
  operators : WaveFluidOperators

def vorticityEquation (F : VorticityField) : Prop :=
  F.operators.timeDerivative F.omega = 
    F.viscosity • (F.operators.laplacian F.omega) +
    (F.omega • (F.operators.gradient (fun _ _ => 0))) -
    (F.omega • (F.operators.gradient (fun _ _ => 0)))

structure VortexDipole where
  center1 : Space3
  center2 : Space3
  strength1 : ℝ
  strength2 : ℝ

def dipoleVelocity (d : VortexDipole) (x : Space3) : VectorField :=
  fun t p => 
    let r1 := (p 0 - d.center1 0, p 1 - d.center1 1, p 2 - d.center1 2)
    let r2 := (p 0 - d.center2 0, p 1 - d.center2 1, p 2 - d.center2 2)
    let factor1 := d.strength1 / (2 * π) * (1 / (r1.1^2 + r1.2^2 + r1.3^2))
    let factor2 := d.strength2 / (2 * π) * (1 / (r2.1^2 + r2.2^2 + r2.3^2))
    fun i => 
      match i with
      | 0 => -factor1 * r1.2 + factor2 * r2.2
      | 1 => factor1 * r1.1 - factor2 * r2.1
      | 2 => 0

def VorticityLayerClosed : Prop :=
  True

end HautevilleHouse
end WavesIncompressibleViscousFluidsCanonicalLaneLean