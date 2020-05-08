require_relative 'board.rb'

class TicTacToe
  def initialize
    @board = Board.new # initalizes board
    # print rules
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".light_green
    puts "               [/]                                                                  [/]".light_green
    puts "               [/]           Player One, type your name and press 'Enter'           [/]".light_green
    puts "               [/]                                                                  [/]".light_green
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".light_green
    $player_one = gets.chomp
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".light_green
    puts "               [/]                                                                  [/]".light_green
    puts "               [/]           Player Two, type your name and press 'Enter'           [/]".light_green
    puts "               [/]                                                                  [/]".light_green
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".light_green
    $player_two = gets.chomp
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".light_green
    puts "               |/|                           Tic-Tac-Toe                            |/|".light_green
    puts "               |/|                                                                  |/|".light_green
    puts '               |/|      Welcome to Tic-Tac-Toe. Three of the same letter (X or O)   |/|'.light_green
    puts '               |/|            in a row, column, or diagonal, wins the game.         |/|'.light_green
    puts '               |/|          If no spaces are left, it will be declared a tie.       |/|'.light_green
    puts '               |/|                                                                  |/|'.light_green
    puts '               |/|      You move by selecting a row (0-2), and pressing "Enter",    |/|'.light_green
    puts '               |/|     followed by selecting a column (0-2), and pressing "Enter".  |/|'.light_green
    puts '               |/|                                                                  |/|'.light_green
    puts '               |/|                                                                  |/|'.light_green
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".light_green
    puts
    puts
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".light_green
    puts "               [/]                                                                  [/]".light_green
    puts "               [/]           Type 'Flip' to decide who will start first.            [/]".light_green
    puts "               [/]                                                                  [/]".light_green
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".light_green
    flip = gets.chomp.downcase
    while flip != "flip"
      puts "             [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".light_green
      puts "             [/]                                                                  [/]".light_green
      puts "             [/]   Yo! You need to type 'Flip' to decide who will start first!    [/]".light_green
      puts "             [/]                                                                  [/]".light_green
      puts "             [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]".light_green
      flip = gets.chomp.downcase
    end

    puts

    if flip == "flip"
      $starting_player = [$player_one, $player_two].sample
      puts "                       [/][/]     #{$starting_player} goes first and will use 'X'!       [/][/]".light_blue
    end
    @board.create_board # displays board
  end
end

TicTacToe.new