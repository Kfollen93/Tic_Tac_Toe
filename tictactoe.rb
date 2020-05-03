class TicTacToe
  def initialize
    @board = Board.new #initalizes board
    #print rules
    puts "Player One, type your name and press 'Enter'"
    player_one = gets.chomp
    puts "Player Two, type your name and press 'Enter'"
    player_two = gets.chomp
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
    starting_player = [player_one, player_two].sample
    puts "#{starting_player} goes first and will use 'X'!"
end

puts
    @board.create_board #displays board
    puts "It's #{starting_player}'s turn. Pick your move by identifying which row followed by which column.
    Example: 1,2 will place an 'X' in the first row, second column."
    #have starting_player pick an array spot '1,1' i.e.
    #check it == " " and then place X.
    #display updated board
    #prompt second_player pick an array spot '2,2' i.e.
    #check it == " " and then place O.
    #display updated board
    #REPEAT LOOP
    #once the array values horizontal, vertical, diagnol 3 in a row end loop
    #announce winner
    #if no more spaces == " " announce tie.
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
  my_array = Array.new(3) { Array.new(3){ " " } }
  puts display_board(my_array)
  end
end

class Player
end

TicTacToe.new







=begin
*Starting over with implementing the below into classes.
here's an example:
_____________________________________________

1)Tictactoe the main driver class in charge of initializing new players etc,
 displaying the game rules, and looping till the games done etc
2)Board in charge maintaining the state of the board and,
 displaying it, checking if spots are free etc
3)player which maintains the player state ("x" or "o")
 and can be asked to take a turn etc to get their move
____________________________________________

puts "Player One, type your name and press 'Enter'"
player_one = gets.chomp
puts "Player Two, type your name and press 'Enter'"
player_two = gets.chomp
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
    starting_player = [player_one, player_two].sample
    puts "#{starting_player} goes first and will use 'X'!"
end

puts

def display_board(array)
  <<~MYHEREDOC
    #{array[0]}
    #{array[1]}
    #{array[2]}
  MYHEREDOC
  end
  my_array = Array.new(3) { Array.new(3){ " " } }
  puts display_board(my_array)

puts

puts "It's #{starting_player}'s turn. Pick your move by identifying which row followed by which column.
Example: 1,2 will place an 'X' in the first row, second column."

move = gets.chomp
if move == "1,1"
  my_array[0][0] = "X"
elsif move == "1,2"
  my_array[0][1] = "X"
  elsif move == "1,3"
    my_array[0][2] = "X"
  elsif move == "2,1"
    my_array[1][0] = "X"
  elsif move == "2,2"
    my_array[1][1] = "X"
  elsif move == "2,3"
    my_array[1][2] = "X"
  elsif move == "3,1"
    my_array[2][0] = "X"
  elsif move == "3,2"
    my_array[2][1] = "X"
  elsif move == "3,3"
    my_array[2][2] = "X"
end
puts

puts display_board(my_array)
puts

if player_one != starting_player
  puts "It's #{player_one}'s turn. Remember, you're 'O'!"
elsif player_two != starting_player
  puts "It's #{player_two}'s turn. Remember, you're 'O'!"
end


move = gets.chomp
if move == "1,1"
  my_array[0][0] = "O"
elsif move == "1,2"
  my_array[0][1] = "O"
  elsif move == "1,3"
    my_array[0][2] = "O"
  elsif move == "2,1"
    my_array[1][0] = "O"
  elsif move == "2,2"
    my_array[1][1] = "O"
  elsif move == "2,3"
    my_array[1][2] = "O"
  elsif move == "3,1"
    my_array[2][0] = "O"
  elsif move == "3,2"
    my_array[2][1] = "O"
  elsif move == "3,3"
    my_array[2][2] = "O"
end
puts

puts display_board(my_array)
puts

move = gets.chomp
if move == "1,1"
  my_array[0][0] = "X"
elsif move == "1,2"
  my_array[0][1] = "X"
  elsif move == "1,3"
    my_array[0][2] = "X"
  elsif move == "2,1"
    my_array[1][0] = "X"
  elsif move == "2,2"
    my_array[1][1] = "X"
  elsif move == "2,3"
    my_array[1][2] = "X"
  elsif move == "3,1"
    my_array[2][0] = "X"
  elsif move == "3,2"
    my_array[2][1] = "X"
  elsif move == "3,3"
    my_array[2][2] = "X"
end
puts

puts display_board(my_array)
puts

=end