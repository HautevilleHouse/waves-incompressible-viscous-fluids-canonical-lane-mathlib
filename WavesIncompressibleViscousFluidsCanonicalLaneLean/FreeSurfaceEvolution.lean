import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

structure FreeSurface where
  elevation : ScalarField
  referenceLevel : ℝ

def zeroFreeSurface : FreeSurface := {
  elevation := fun _ _ => 0,
  referenceLevel := 0
}

structure FreeSurfaceEvolution where
  freeSurface : FreeSurface
  fluidState : FluidState
  kinematicCondition : Prop
  dynamicCondition : Prop
  kinematicConditionProof : kinematicCondition
  dynamicConditionProof : dynamicCondition

def defaultFreeSurfaceEvolution : FreeSurfaceEvolution := {
  freeSurface := zeroFreeSurface,
  fluidState := zeroFluidState,
  kinematicCondition := True,
  dynamicCondition := True,
  kinematicConditionProof := trivial,
  dynamicConditionProof := trivial
}

end WavesIncompressibleViscousFluidsCanonicalLaneLean
end HautevilleHouse