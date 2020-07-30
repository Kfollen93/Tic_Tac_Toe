# frozen_string_literal: true

require_relative 'instructions'
require_relative 'player'

# Displays board and updates with move entries.
class Board
  attr_accessor :row_str, :column_str, :cords
  attr_reader :starting_player
  include Instructions

  def initialize
    @instructions = display_instructions
    @board = create_board
    @row_str = row_str
    @column_str = column_str
    @cords = cords
  end

  def create_board
    @cords = Array.new(3) { Array.new(3) { ' ' } }
    puts display_board(cords)
  end

  def display_board(array)
    <<~MYHEREDOC
      #{array[0]}
      #{array[1]}
      #{array[2]}
    MYHEREDOC
  end

  def enter_x_moves
    valid_move?
    @cords[@row][@column] = 'X'
    puts display_board(cords)
  end

  def enter_o_moves
    valid_move?
    @cords[@row][@column] = 'O'
    puts display_board(cords)
  end

  def valid_move?
    row_and_column
    until @row_str =~ /^[0-2]$/ && @column_str =~ /^[0-2]$/ && @cords[@row][@column] == ' '
      puts 'Not a valid move.'
      row_and_column
    end
  end

  def row_and_column
    @row_str = gets.chomp
    @column_str = gets.chomp
    @row = row_str.to_i
    @column = column_str.to_i
  end

  def announce_player1_turn
    if @player_one != @starting_player
      puts "    [^][^]     It's #{@player_one}'s turn!       [^][^]"
    else
      puts "   [^][^]     It's #{@player_two}'s turn!       [^][^]"
    end
  end

  def announce_player2_turn
    puts "    [^][^]     It's #{@starting_player}'s turn!       [^][^]"
  end

  def win_or_tie?
    x_horizontal_win
    x_vertical_win
    x_diagonal_win
    declare_x_won
    o_horizontal_win
    o_vertical_win
    o_diagonal_win
    declare_o_won
    empty?
  end

  def x_horizontal_win
    cords.any? { |row| row.all? { |cell| cell == 'X' } }
  end

  def x_vertical_win
    cords[0][0] == 'X' && cords[1][0] == 'X' && cords[2][0] == 'X' ||
      cords[0][1] == 'X' && cords[1][1] == 'X' && cords[2][1] == 'X' ||
      cords[0][2] == 'X' && cords[1][2] == 'X' && cords[2][2] == 'X'
  end

  def x_diagonal_win
    cords[0][0] == 'X' && cords[1][1] == 'X' && cords[2][2] == 'X' ||
      cords[2][0] == 'X' && cords[1][1] == 'X' && cords[0][2] == 'X'
  end

  def declare_x_won
    if x_horizontal_win || x_vertical_win || x_diagonal_win
      puts "#{@starting_player} wins!"
      exit
    end
  end

  def o_horizontal_win
    cords.any? { |row| row.all? { |cell| cell == 'O' } }
  end

  def o_vertical_win
    cords[0][0] == 'O' && cords[1][0] == 'O' && cords[2][0] == 'O' ||
      cords[0][1] == 'O' && cords[1][1] == 'O' && cords[2][1] == 'O' ||
      cords[0][2] == 'O' && cords[1][2] == 'O' && cords[2][2] == 'O'
  end

  def o_diagonal_win
    cords[0][0] == 'O' && cords[1][1] == 'O' && cords[2][2] == 'O' ||
      cords[2][0] == 'O' && cords[1][1] == 'O' && cords[0][2] == 'O'
  end

  def declare_o_won
    if o_horizontal_win || o_vertical_win || o_diagonal_win
      if @player_one != @starting_player
        puts "#{@player_one} wins!"
        exit
      else
        puts "#{@player_two} wins!"
        exit
      end
    end
  end

  def empty?
    spaces = cords.flatten.any? { |spot| spot == ' ' }
    puts 'Neither player wins. It\'s a tie.' if spaces == false
    exit
  end
end
