#encoding:utf-8

require_relative 'LootToUI'

module Deepspace

    class Loot

        def initialize(_nSupplies,_nWeapons,_nShields,_nHangars,_nMedals,ef = false,city = false)
            @nSupplies = _nSupplies
            @nWeapons = _nWeapons
            @nShields = _nShields
            @nHangars = _nHangars
            @nMedals = _nMedals
            @getEfficient = ef
            @spaceCity = city
        end

        attr_reader :nSupplies, :nWeapons, :nShields, :nHangars, :nMedals, :getEfficient, :spaceCity

        def to_s()
            "This Loot has: #{@nSupplies} supplies, #{@nWeapons} weapons, #{@nShields} shields, #{@nHangars} hangars, #{@nMedals} medals"
        end

        def getUIversion
            LootToUI.new(self)
        end
    end

end
