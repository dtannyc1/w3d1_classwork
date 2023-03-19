require "./Player.rb"

class Game
    attr_reader :current_player, :previous_player
    def initialize(player_1, player_2)
        @player_1 = Player.new(player_1)
        @player_2 = Player.new(player_2)
        @current_player = @player_1
        @previous_player = @player_2
        @fragment = ""

        @dictionary = Hash.new(false)
        File.foreach("dictionary.txt") {|line| @dictionary[line.chomp] = true}
    end

    def play_round()
        while !@dictionary[@fragment]
            if take_turn(@current_player)
                puts "#{@current_player} YOU LOSE !!!"
            else
                next_player!
            end
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
        str = player.guess
        while !valid_play?(str)
            player.alert_invalid_guess
            str = player.guess 
        end
        @fragment += str
        return @dictionary[@fragment]
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
