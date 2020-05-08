require_relative 'board.rb'

class TicTacToe
  def initialize
    @board = Board.new # initalizes board
    # print rules
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]"
    puts "               [/]                                                                  [/]"
    puts "               [/]           Player One, type your name and press 'Enter'           [/]"
    puts "               [/]                                                                  [/]"
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]"
    $player_one = gets.chomp
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]"
    puts "               [/]                                                                  [/]"
    puts "               [/]           Player Two, type your name and press 'Enter'           [/]"
    puts "               [/]                                                                  [/]"
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]"
    $player_two = gets.chomp
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]"
    puts "               |/|                           Tic-Tac-Toe                            |/|"
    puts "               |/|                                                                  |/|"
    puts '               |/|      Welcome to Tic-Tac-Toe. Three of the same letter (X or O)   |/|'
    puts '               |/|            in a row, column, or diagonal, wins the game.         |/|'
    puts '               |/|          If no spaces are left, it will be declared a tie.       |/|'
    puts '               |/|                                                                  |/|'
    puts '               |/|      You move by selecting a row (0-2), and pressing "Enter",    |/|'
    puts '               |/|     followed by selecting a column (0-2), and pressing "Enter".  |/|'
    puts '               |/|                                                                  |/|'
    puts '               |/|                                                                  |/|'
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]"
    puts
    puts
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]"
    puts "               [/]                                                                  [/]"
    puts "               [/]           Type 'Flip' to decide who will start first.            [/]"
    puts "               [/]                                                                  [/]"
    puts "               [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]"
    flip = gets.chomp.downcase
    while flip != "flip"
      puts "             [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]"
      puts "             [/]                                                                  [/]"
      puts "             [/]   Yo! You need to type 'Flip' to decide who will start first!    [/]"
      puts "             [/]                                                                  [/]"
      puts "             [/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/][/]"
      flip = gets.chomp.downcase
    end

    puts

    if flip == "flip"
      $starting_player = [$player_one, $player_two].sample
      puts "                       [/][/]     #{$starting_player} goes first and will use 'X'!       [/][/]"
    end
    @board.create_board # displays board
  end
end

TicTacToe.new