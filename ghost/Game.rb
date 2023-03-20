# require_relative "./dictionary.txt"

class Game
    attr_reader :current_player, :previous_player
    def initialize(player_1, player_2)
        @player_1 = player_1
        @player_2 = player_2
        @current_player = @player_1
        @previous_player = @player_2
        @fragment = ""

        @dictionary = Hash.new(false)
        File.foreach("dictionary.txt") {|line| @dictionary[line.chomp] = true}
    end

    def play_round()
        while @dictionary[@fragment]
            take_turn(@current_player)
            # check if fragment is in dictionary
            next_player!
        end
    end

    def next_player!
        @previous_player = @current_player
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def take_turn(player)

    end

    def valid_play?(string)
        alpha = ("a".."z").to_a
        if !alpha.include?(string)
            return false
        else
            @dictionary.each_key do |word|
                if word.start_with?(@fragment + string)
                    return true
                end
            end
            return false
        end
    end
end
