#encoding:utf-8

require_relative 'LootToUI'

module Deepspace

    class Loot

        def initialize(_nSupplies,_nWeapons,_nShields,_nHangars,_nMedals)
            @nSupplies = _nSupplies
            @nWeapons = _nWeapons
            @nShields = _nShields
            @nHangars = _nHangars
            @nMedals = _nMedals
        end

        def nSupplies
            @nSupplies
        end

        def nWeapons
            @nWeapons
        end

        def nShields
            @nShields
        end

        def nHangars
            @nHangars
        end

        def nMedals
            @nMedals
        end

        def to_s()
            "This Loot has: #{@nSupplies} supplies, #{@nWeapons} weapons, #{@nShields} shields, #{@nHangars} hangars, #{@nMedals} medals"
        end

        def getUIversion
            LootToUI.new(self)
        end
    end

end
