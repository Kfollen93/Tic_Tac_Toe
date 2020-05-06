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

  def loop_until_finished
  end
end

class Board
  def display_board(array)
    <<~MYHEREDOC
      #{array[0]}
      #{array[1]}
      #{array[2]}
    MYHEREDOC
  end

  def create_board
    my_array = Array.new(3) { Array.new(3) { " " } }
    puts display_board(my_array)
    loop do
      row = gets.chomp.to_i
      column = gets.chomp.to_i
      while row < 0 || row > 2 || column < 0 || column > 2
        puts "Please enter between a range of 0 - 2"
        row = gets.chomp.to_i
        column = gets.chomp.to_i
      end
      while my_array[row][column] != " "
        puts "Sorry you can't move there. Try again."
        row = gets.chomp.to_i
        column = gets.chomp.to_i
      end

      if my_array[row][column] == " "
        my_array[row][column] = "X"
      end
      puts
      puts display_board(my_array)
      break if
      # horizontal lines
      my_array[0][0] == "X" && my_array[0][1] == "X" && my_array[0][2] == "X" ||
      my_array[1][0] == "X" && my_array[1][1] == "X" && my_array[1][2] == "X" ||
      my_array[2][0] == "X" && my_array[2][1] == "X" && my_array[2][2] == "X" ||
      my_array[0][0] == "O" && my_array[0][1] == "O" && my_array[0][2] == "O" ||
      my_array[1][0] == "O" && my_array[1][1] == "O" && my_array[1][2] == "O" ||
      my_array[2][0] == "O" && my_array[2][1] == "O" && my_array[2][2] == "O" ||

      # vertical lines
      my_array[0][0] == "X" && my_array[1][0] == "X" && my_array[2][0] == "X" ||
      my_array[0][1] == "X" && my_array[1][1] == "X" && my_array[2][1] == "X" ||
      my_array[0][2] == "X" && my_array[1][2] == "X" && my_array[2][2] == "X" ||
      my_array[0][0] == "O" && my_array[1][0] == "O" && my_array[2][0] == "O" ||
      my_array[0][1] == "O" && my_array[1][1] == "O" && my_array[2][1] == "O" ||
      my_array[0][2] == "O" && my_array[1][2] == "O" && my_array[2][2] == "O" ||

      # diagonals
      my_array[0][0] == "X" && my_array[1][1] == "X" && my_array[2][2] == "X" ||
      my_array[2][0] == "X" && my_array[1][1] == "X" && my_array[0][2] == "X" ||
      my_array[0][0] == "O" && my_array[1][1] == "O" && my_array[2][2] == "O" ||
      my_array[2][0] == "O" && my_array[1][1] == "O" && my_array[0][2] == "O" 

      puts
      if $player_one != $starting_player
        puts "    [^][^]     It's #{$player_one}'s turn!       [^][^]"
      else puts "   [^][^]     It's #{$player_two}'s turn!       [^][^]"
      end
      puts

      row = gets.chomp.to_i
      column = gets.chomp.to_i
      while row < 0 || row > 2 || column < 0 || column > 2
        puts "Please enter between a range of 0 - 2"
        row = gets.chomp.to_i
        column = gets.chomp.to_i
      end
      while my_array[row][column] != " "
        puts "Sorry you can't move there. Try again."
        row = gets.chomp.to_i
        column = gets.chomp.to_i
      end

      if my_array[row][column] == " "
        my_array[row][column] = "O"
      end
      puts display_board(my_array)
      break if
      # horizontal lines
      my_array[0][0] == "X" && my_array[0][1] == "X" && my_array[0][2] == "X" ||
      my_array[1][0] == "X" && my_array[1][1] == "X" && my_array[1][2] == "X" ||
      my_array[2][0] == "X" && my_array[2][1] == "X" && my_array[2][2] == "X" ||
      my_array[0][0] == "O" && my_array[0][1] == "O" && my_array[0][2] == "O" ||
      my_array[1][0] == "O" && my_array[1][1] == "O" && my_array[1][2] == "O" ||
      my_array[2][0] == "O" && my_array[2][1] == "O" && my_array[2][2] == "O" ||

      # vertical lines
      my_array[0][0] == "X" && my_array[1][0] == "X" && my_array[2][0] == "X" ||
      my_array[0][1] == "X" && my_array[1][1] == "X" && my_array[2][1] == "X" ||
      my_array[0][2] == "X" && my_array[1][2] == "X" && my_array[2][2] == "X" ||
      my_array[0][0] == "O" && my_array[1][0] == "O" && my_array[2][0] == "O" ||
      my_array[0][1] == "O" && my_array[1][1] == "O" && my_array[2][1] == "O" ||
      my_array[0][2] == "O" && my_array[1][2] == "O" && my_array[2][2] == "O" ||

      # diagonals
      my_array[0][0] == "X" && my_array[1][1] == "X" && my_array[2][2] == "X" ||
      my_array[2][0] == "X" && my_array[1][1] == "X" && my_array[0][2] == "X" ||
      my_array[0][0] == "O" && my_array[1][1] == "O" && my_array[2][2] == "O" ||
      my_array[2][0] == "O" && my_array[1][1] == "O" && my_array[0][2] == "O" 

      puts
      puts "    [^][^]     It's #{$starting_player}'s turn!       [^][^]"
    end # game loop
  if
      my_array[0][0] == "X" && my_array[0][1] == "X" && my_array[0][2] == "X" ||
      my_array[1][0] == "X" && my_array[1][1] == "X" && my_array[1][2] == "X" ||
      my_array[2][0] == "X" && my_array[2][1] == "X" && my_array[2][2] == "X" ||
      my_array[0][0] == "X" && my_array[1][0] == "X" && my_array[2][0] == "X" ||
      my_array[0][1] == "X" && my_array[1][1] == "X" && my_array[2][1] == "X" ||
      my_array[0][2] == "X" && my_array[1][2] == "X" && my_array[2][2] == "X" ||
      my_array[0][0] == "X" && my_array[1][1] == "X" && my_array[2][2] == "X" ||
      my_array[2][0] == "X" && my_array[1][1] == "X" && my_array[0][2] == "X"

      puts
      puts
      puts "    [/][/]                                         [/][/]"
      puts "                    #{$starting_player} wins!              "
      puts "    [/][/]                                         [/][/]"

  elsif
      my_array[0][0] == "O" && my_array[0][1] == "O" && my_array[0][2] == "O" ||
      my_array[1][0] == "O" && my_array[1][1] == "O" && my_array[1][2] == "O" ||
      my_array[2][0] == "O" && my_array[2][1] == "O" && my_array[2][2] == "O" ||
      my_array[0][0] == "O" && my_array[1][0] == "O" && my_array[2][0] == "O" ||
      my_array[0][1] == "O" && my_array[1][1] == "O" && my_array[2][1] == "O" ||
      my_array[0][2] == "O" && my_array[1][2] == "O" && my_array[2][2] == "O" ||
      my_array[0][0] == "O" && my_array[1][1] == "O" && my_array[2][2] == "O" ||
      my_array[2][0] == "O" && my_array[1][1] == "O" && my_array[0][2] == "O"

        if $player_one != $starting_player
        puts
        puts "    [/][/]                                    [/][/]"
        puts "                    #{$player_one} wins!              "
        puts "    [/][/]                                    [/][/]"
        else puts "    [/][/]                                    [/][/]"
             puts "                   #{$player_two} wins!              "
             puts "    [/][/]                                    [/][/]"
        end
end
end # create board end
end #class end

TicTacToe.new

=begin
  __________ IF THERE'S A TIE__________

my_array = [1, 2, 3, " "]

no_more_blanks = my_array.none? do |position|
  position =~ /\s/
end

if no_more_blanks == true
  puts "It's a tie!"
end

____________________________________

How to make it so that if you enter anything other than 0 - 2 the while loop prompts
  Like Regex?  while row = /[^0-2]/ || column = /[^0-2]/

=end