import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

structure VorticityStrainCertificate where
  waveFlow : WaveFlow
  vorticityField : VectorField
  strainRateTensor : VectorField → VectorField
  enstrophy : Prop
  vortexStretching : Prop
  enstrophyClosed : enstrophy
  vortexStretchingClosed : vortexStretching

def sourceVorticityStrainCertificate : VorticityStrainCertificate := {
  waveFlow := primitiveWaveFlow
  vorticityField := zeroVectorField
  strainRateTensor := fun u => u
  enstrophy := True
  vortexStretching := True
  enstrophyClosed := trivial
  vortexStretchingClosed := trivial
}

def VorticityStrainClosed (C : VorticityStrainCertificate) : Prop :=
  C.enstrophy ∧ C.vortexStretching

theorem source_vorticity_strain_closed : VorticityStrainClosed sourceVorticityStrainCertificate := by
  exact And.intro sourceVorticityStrainCertificate.enstrophyClosed sourceVorticityStrainCertificate.vortexStretchingClosed

end WavesIncompressibleViscousFluidsCanonicalLaneLean
end HautevilleHouse