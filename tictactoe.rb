require_relative 'board.rb'
class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def gray;           "\e[37m#{self}\e[0m" end
end

class TicTacToe
  def initialize
    @board = Board.new # initalizes board
    # print rules
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".green
    puts "               [/]                                                                  [/]".green
    puts "               [/]           Player One, type your name and press 'Enter'           [/]".green
    puts "               [/]                                                                  [/]".green
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".green
    $player_one = gets.chomp
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".green
    puts "               [/]                                                                  [/]".green
    puts "               [/]           Player Two, type your name and press 'Enter'           [/]".green
    puts "               [/]                                                                  [/]".green
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".green
    $player_two = gets.chomp
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".green
    puts "               |/|                           Tic-Tac-Toe                            |/|".green
    puts "               |/|                                                                  |/|".green
    puts '               |/|      Welcome to Tic-Tac-Toe. Three of the same letter (X or O)   |/|'.green
    puts '               |/|            in a row, column, or diagonal, wins the game.         |/|'.green
    puts '               |/|          If no spaces are left, it will be declared a tie.       |/|'.green
    puts '               |/|                                                                  |/|'.green
    puts '               |/|      You move by selecting a row (0-2), and pressing "Enter",    |/|'.green
    puts '               |/|     followed by selecting a column (0-2), and pressing "Enter".  |/|'.green
    puts '               |/|                                                                  |/|'.green
    puts '               |/|                                                                  |/|'.green
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".green
    puts
    puts
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".green
    puts "               [/]                                                                  [/]".green
    puts "               [/]           Type 'Flip' to decide who will start first.            [/]".green
    puts "               [/]                                                                  [/]".green
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".green
    flip = gets.chomp.downcase
    while flip != "flip"
      puts "             [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".green
      puts "             [/]                                                                  [/]".green
      puts "             [/]   Yo! You need to type 'Flip' to decide who will start first!    [/]".green
      puts "             [/]                                                                  [/]".green
      puts "             [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".green
      flip = gets.chomp.downcase
    end

    puts

    if flip == "flip"
      $starting_player = [$player_one, $player_two].sample
      puts "                       [/][/]     #{$starting_player} goes first and will use 'X'!       [/][/]".blue
    end
    @board.create_board # displays board
  end
end

TicTacToe.new