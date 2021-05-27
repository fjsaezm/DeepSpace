#encoding: utf-8


require_relative 'CardDealer'
#require_relative 'SpaceStation'
require_relative 'SpaceCity'
    class ExamenP4

        def self.metodo

            puts "metodo de clase"
        end

        def principal

            dealer = Deepspace::CardDealer.instance
            stations = Array.new
            puts "Creando"
            for i in 1..20
                stations.push(Deepspace::SpaceStation.new("Estación #{i} " ,dealer.nextSuppliesPackage ))
                #puts stations.at(i-1).to_s
            end

	   
            totalfire= 0
            for station in stations
                fire= station.fire
                totalfire+= fire
                puts "#{fire}"
            end

            
            puts "Totalfire = #{totalfire}"
            base =  stations.at(2)
            stations.delete_at(2)
            collabs = stations.clone
            ciudadEspacial = Deepspace::SpaceCity.new(base,collabs)


            stations.insert(2,ciudadEspacial)
            for station in stations
            	puts station.fire
            end
            
            

          

        end
    end


    ExamenP4.new.principal

    #ExamenP4.metodo
