require 'uri'
require'pry'
class Player
    attr_accessor :name, :life_points

    #--            Create players              --
    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 20
    end

    #--               state             --
    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

    #--               damage            --
    def gets_damage(damage)
        @life_points = @life_points - damage
            if @life_points <= 0
                puts "le joueur #{@name} a été tué !"
            end
    return damage
    end

    #--              attaque            --
    def attacks(player)
            puts "#{player.name} attaque #{@name}"
        gets_damage(compute_damage)
            puts "il lui inflige #{compute_damage} damages"
    end
    
    def compute_damage
        return rand(1..6)
    end
end

player1 = Player.new("José")

class HumanPlayer < Player
attr_accessor :weapon_level

    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 100
        @weapon_level = 1
    end

    #   --             state              --
    def show_state
        puts "#{@name} a #{@life_points} points de vie et d'une arme niveau #{@weapon_level}"
    end
    #   --         compute damage          --
    def compute_damage
        rand(1..6) * @weapon_level
    end
    #   --         search weapon        --
    def search_weapon
        level = rand(1..6)
        if level < @weapon_level
            puts "Votre ancien arme est encore puissant que le nouveau"
        else
            puts "Good arms, let's get it"
           @weapon_level = level
        end
    end
    #   --      search health       --
    def search_health_pack
        pack = rand(1..6)
        if pack == 1
            puts"Tu n'as rien trouvé.."
        elsif pack == 6  
            puts "Wouaw!! vous avez trouvé un pack de +50 points" 
            @life_points += 50  
        else
            puts "Vous avez trouvé un pack de 20 points de vie" 
            @life_points += 20   
        end
            if @life_points >= 100 
               @life_points = 100
               puts "Vous êtes au maximum de votre vie"
            end
    end
end