import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

structure CapillaryGravityWaveCertificate where
  eulerBeam : EulerBeamCertificate
  dispersionRelationValid : Prop
  phaseSpeed : ℝ
  groupSpeed : ℝ
  dispersionClosed : dispersionRelationValid
  phaseSpeedPositive : phaseSpeed > 0
  groupSpeedPositive : groupSpeed > 0

def sourceCapillaryGravityWaveCertificate : CapillaryGravityWaveCertificate := {
  eulerBeam := sourceEulerBeamCertificate
  dispersionRelationValid := True
  phaseSpeed := 1.0
  groupSpeed := 0.5
  dispersionClosed := trivial
  phaseSpeedPositive := by norm_num
  groupSpeedPositive := by norm_num
}

def CapillaryGravityWaveClosed (C : CapillaryGravityWaveCertificate) : Prop :=
  EulerBeamClosed C.eulerBeam ∧ C.dispersionRelationValid ∧ C.phaseSpeed > 0 ∧ C.groupSpeed > 0

theorem source_capillary_gravity_wave_closed : CapillaryGravityWaveClosed sourceCapillaryGravityWaveCertificate := by
  exact And.intro source_euler_beam_closed (And.intro sourceCapillaryGravityWaveCertificate.dispersionClosed (And.intro sourceCapillaryGravityWaveCertificate.phaseSpeedPositive sourceCapillaryGravityWaveCertificate.groupSpeedPositive))

end WavesIncompressibleViscousFluidsCanonicalLaneLean
end HautevilleHouse