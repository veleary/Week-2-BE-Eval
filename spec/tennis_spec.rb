require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }
  
  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to be_a(Tennis::Player)
      expect(game.player2.opponent).to be_a(Tennis::Player)
    end
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(1)

      expect(game.player1.points).to eq(1)
    end
  end

  describe '#scores' do
    context 'when player scores a deuce'  do
      it 'returns deuce' do
        game.player1.points = 3
        game.player2.points = 3        
        game.scores

        expect(game.scores).to eq('deuce')
      end
    end
  
    context 'when player scores an advantage'  do
      it 'returns advantage' do
        game.player1.points = 3
        game.player2.points = 2        
        game.scores

        expect(game.scores).to eq('advantage')
      end
    end

    context'when player doesnt get a deuce or advantage' do
      it 'returns Play Again' do
        game.player1.points = 3
        game.player2.points =1

        expect(game.scores).to eq('Play Again!')
      end
    end
  end
end

describe Tennis::Player do
  let(:player) {Tennis::Player.new }     
  
  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do 
        player.points = 2

        expect(player.score).to eq('thirty')
      end
    end
    
    context 'when points is 3' do
      it 'returns forty' do
        player.points = 3

        expect(player.score).to eq('forty')
      end
    end
  end  
end

# describe Tennis::Set do
#   let(:set) {Tennis::Set.new(game1,game2,game3)}
#   describe '.initialize' do
#     it 'creates a new set of games' do
#       expect(set.game1).to be_a(Tennis::Game)
#       expect(set.game2).to be_a(Tennis::Game)
#       expect(set.game3).to be_a(Tennis::Game)
#     end

#     it 'sets the opponent for each player' do
#       expect(game.player1.opponent).to be_a(Tennis::Player)
#       expect(game.player2.opponent).to be_a(Tennis::Player)
#     end
#   end

#   # describe '#wins_ball' do
#   #   it 'increments the points of the winning player' do
#   #     game.wins_ball(1)

#   #     expect(game.player1.points).to eq(1)
#   #   end
#   # end
# end






