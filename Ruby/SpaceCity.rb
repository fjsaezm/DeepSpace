#encoding:utf-8

require_relative 'SpaceCityToUI'
require_relative 'Transformation'
require_relative 'SpaceStation'

module Deepspace

    class SpaceCity < SpaceStation

        def initialize(base,rest)
            self.copy(base)
            @base = base
            @collaborators = rest
        end

        def fire
            f = super
            @collaborators.each do |c|
                f += c.fire
            end

            f 
        end

        def protection
            pro = super
            @collaborators.each do |c|
                pro += c.protection
            end

            pro 
        end

        def setLoot(loot)
            super(loot)
            Transformation::NOTRANSFORM
        end

        def to_s
            s = "* BASE:\n"
            s += @base.to_s 
            s +="\n* COLLABORATORS : \n"
            if !@collaborators.empty?
                @collaborators.each do |c|
                    s += c.to_s + "\n"
                    s += "----------------------------------\n"
                end
            end
            s 
        end
        attr_reader :collaborators
            


    end

end
