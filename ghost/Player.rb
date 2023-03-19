class Player 
    def initialize(name)
        @name = name
    end

    def guess
        puts "Player #{@name} say a letter"
        gets.chomp
    end

    def alert_invalid_guess
        puts "Letter invalid; Player #{@name} say another letter"
    end
end
