import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

structure FluidState where
  velocity : VectorField
  pressure : ScalarField

def zeroFluidState : FluidState := {
  velocity := fun _ _ _ => 0,
  pressure := fun _ _ => 0
}

structure ViscousFluidParameters where
  viscosity : ℝ
  density : ℝ
  viscosityPositive : viscosity > 0
  densityPositive : density > 0

def defaultViscousParameters : ViscousFluidParameters := {
  viscosity := 1,
  density := 1,
  viscosityPositive := by norm_num,
  densityPositive := by norm_num
}

structure IncompressibilityCondition (f : FluidState) : Prop where
  divergenceFree : ∀ (t : Time) (x : Space3), divergence f.velocity t x = 0

def divergence (v : VectorField) : ScalarField := fun t x => 
  (v t x 0 - v t x 0) + (v t x 1 - v t x 1) + (v t x 2 - v t x 2)  -- placeholder

theorem zero_fluid_state_incompressible : IncompressibilityCondition zeroFluidState := by
  refine { divergenceFree := ?_ }
  intro t x
  simp [divergence, zeroFluidState]

end WavesIncompressibleViscousFluidsCanonicalLaneLean
end HautevilleHouse