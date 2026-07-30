import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WavesIncompressibleViscousFluidsCanonicalLaneLean

structure EnergyDensity where
  kinetic : ScalarField
  potential : ScalarField

def zeroEnergyDensity : EnergyDensity := {
  kinetic := fun _ _ => 0,
  potential := fun _ _ => 0
}

structure EnergyDissipation where
  energyDensity : EnergyDensity
  dissipationRate : ScalarField
  energyBalance : Prop
  dissipationPositive : ∀ t x, dissipationRate t x ≥ 0
  energyBalanceProof : energyBalance
  dissipationPositiveProof : dissipationPositive

def defaultEnergyDissipation : EnergyDissipation := {
  energyDensity := zeroEnergyDensity,
  dissipationRate := fun _ _ => 0,
  energyBalance := True,
  dissipationPositive := by
    intro t x; nlinarith,
  energyBalanceProof := trivial,
  dissipationPositiveProof := by
    intro t x; nlinarith
}

end WavesIncompressibleViscousFluidsCanonicalLaneLean
end HautevilleHouse