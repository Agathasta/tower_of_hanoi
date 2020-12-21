# frozen_string_literal: true

class Board
  def initialize
    loop do
      puts 'How many disks do you want to play with? (minimum 3)'
      print '> '
      @n = gets.chomp.to_i
      break if @n > 2
    end
    @board = Array.new(3) { Array.new(@n) }
    @board[0] = (1..@n).map { |n| 'o' * n }
    display
  end

  def display
    puts
    puts "1\t2\t3"
    puts '__________________'
    i = 0
    while i < @n
      puts "#{@board[0][i]}\t#{@board[1][i]}\t#{@board[2][i]}"
      i += 1
    end
    puts
  end

  def coordinates
    loop do
      puts 'Move disk:'
      print '> '
      coord = gets.chomp.split(' ').map { |c| c.to_i - 1 }
      @rod_nr_from = coord[0]
      @rod_nr_to = coord[1]
      next unless check_coordinates_format

      @rod_from = @board[@rod_nr_from]
      @rod_to = @board[@rod_nr_to]
      @disk = @rod_from.find { |d| !d.nil? }
      break if check_coordinates_position
    end
  end

  def check_coordinates_format
    if !@rod_nr_from.nil? && !@rod_nr_to.nil?
      if (0..2).include?(@rod_nr_from) && (0..2).include?(@rod_nr_to)
        true
      else puts 'There are only 3 rods ;)'
      end
    else
      puts 'Wrong input!'
    end
  end

  def check_coordinates_position
    check_coordinates_start && check_coordinates_finish
  end

  def check_coordinates_start
    if @rod_from[@n - 1].nil?
      puts "No disk on rod #{@rod_nr_from + 1}!"
    else
      true
    end
  end

  def check_coordinates_finish
    if @rod_to[@n - 1].nil? || @disk < @rod_to.find { |d| !d.nil? }
      true
    else
      puts 'A disk can only be put on top of a bigger one! (or on an empty rod)'
    end
  end

  def new_board
    @rod_from[@rod_from.index(@disk)] = nil
    @rod_to.shift
    idx = @rod_to.find_index { |d| !d.nil? } || @n - 1
    @rod_to.insert(idx, @disk)
  end

  def winning?
    @board[2] == (1..@n).map { |n| 'o' * n }
  end
end
