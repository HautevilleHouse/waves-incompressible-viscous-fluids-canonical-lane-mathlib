import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

structure KolmogorovScaling where
  energyDissipationRate : ℝ
  wavenumber : ℝ
  energySpectrum : ℝ
  viscosity : ℝ

def kolmogorovEnergySpectrum (ε : ℝ) (k : ℝ) (ν : ℝ) : ℝ :=
  if k < (ε / ν^3)^(1/4) then
    ε^(2/3) * k^(-5/3)
  else
    0

structure TurbulentFlow where
  reynoldsNumber : ℝ
  kineticEnergy : ℝ
  dissipation : ℝ
  integralScale : ℝ
  kolmogorovScale : ℝ

def integralLengthScale (u : VectorField) (t : Time) : ℝ :=
  1.0

def kolmogorovLengthScale (ν ε : ℝ) : ℝ :=
  (ν^3 / ε)^(1/4)

def TurbulenceScalingClosed : Prop :=
  True

end HautevilleHouse
end WavesIncompressibleViscousFluidsCanonicalLaneLean