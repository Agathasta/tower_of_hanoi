# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize
    intro
    @board = Board.new
    intro_moves
  end

  def intro
    puts `clear`
    puts "\e[40m***** TOWER OF HANOI *****\e[0m"
    puts <<~INTRO
    \nThe objective of the puzzle is to move all disks to another rod obeying the following simple rules:
      1. Only one disk can be moved at a time.
      2. No larger disk may be placed on top of a smaller disk.
    INTRO
  end

  def intro_moves
    puts <<~INSTRUCTIONS
      \nTo move the disks, input two numbers separated by a space:
        - the first one is the rod you take the disk FROM,
        - the second is the rod you move the disk TO.
      \e[37mV.gr.: 1 3 will move the disk from rod 1 to rod 3.\e[0m
    INSTRUCTIONS
  end

  def play
    until @board.winning?
      @board.coordinates
      @board.new_board
      @board.display
    end
    puts "\e[32mCONGRATULATIONS!!\e[0m"
    puts
  end
end

game = Game.new
game.play
