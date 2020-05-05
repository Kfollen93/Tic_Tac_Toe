class TicTacToe
  def initialize
    @board = Board.new # initalizes board
    # print rules
    puts "Player One, type your name and press 'Enter'"
    $player_one = gets.chomp
    puts "Player Two, type your name and press 'Enter'"
    $player_two = gets.chomp
    puts 'Welcome to Tic-Tac-Toe. Three of the same letter (X or O)
    in a row, column, or diagonal, wins the game.'

    puts "Type 'Flip' to flip a coin to see who goes first"
    flip = gets.chomp.downcase
    while flip != "flip"
      puts "Yo! Type 'Flip' to decide who starts."
      flip = gets.chomp.downcase
    end

    puts

    if flip == "flip"
      $starting_player = [$player_one, $player_two].sample
      puts "#{$starting_player} goes first and will use 'X'!"
    end

    puts
    puts "It's #{$starting_player}'s turn. Pick your move by identifying which row followed by which column.
    Example: 1,2 will place an 'X' in the first row, second column."
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
    puts display_board(my_array)

    if $player_one != $starting_player
      puts "It's #{$player_one}'s turn"
    else puts "It's #{$player_two}'s turn"
    end

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

    puts "It's #{$starting_player}'s turn"
end # create board end
end # class end

TicTacToe.new