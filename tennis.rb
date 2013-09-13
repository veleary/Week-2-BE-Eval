module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end
    #Returns the player specified in the argument's
    def wins_ball(player_num)
      if player_num == 1
        player1.points+=1
      else 
        player2.points+=1
      end
    end

    def scores
      if (@player1.points <= 3 && @player1.opponent.points <= 3) && (@player1.points - @player1.opponent.points == 1)
        return 'advantage'      
      elsif (@player1.points <= 3 && @player1.opponent.points <= 3) && (@player1.points == @player1.opponent.points) 
        return 'deuce'      
      else 
        return 'Play Again!'      
      end
    end  
    # def wins_game()

    # end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
        @points += 1
    end

    # Returns the String score for the player.
    def score
      if @points == 0 
        return 'love'       
      elsif @points == 1
        return 'fifteen'      
      elsif @points == 2 
        return 'thirty'      
      else 
        return 'forty'          
      end
    end
    
    
  end
end 


# class Set 
#   attr_accessor :game1, :game2, :game3

#   def initialize(game1, game2, game3)
#     @game_tracker = [@game1, @game2, @game3]
#   end

#   def set_winner()

#   end
        
#     # end
# end
      




