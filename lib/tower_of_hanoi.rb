# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize
    intro
    @board = Board.new
    intro_moves
  end

  def intro
    puts
    puts '***** TOWER OF HANOI *****'
    puts 'The objective of the puzzle is to move all disks to another rod,'
    puts 'obeying the following simple rules:'
    puts '1. Only one disk can be moved at a time.'
    puts '2. No larger disk may be placed on top of a smaller disk.'
  end

  def intro_moves
    puts 'To move the disks, input two numbers separated by a space:'
    puts    'the first one is the rod you take the disk FROM,'
    puts    'the second is the rod you move the disk TO.'
    puts 'V.gr.: 1 3 will move the disk from rod 1 to rod 3.'
    puts
  end

  def play
    until @board.winning?
      @board.coordinates
      @board.new_board
      @board.display
    end
    puts 'CONGRATULATIONS!!'
    puts
  end
end

game = Game.new
game.play
