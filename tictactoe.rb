=begin
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

if flip == "flip"
    puts "#{[player_one, player_two].sample} goes first!"
end

# Display Gameboard here now.
# Player X Choose where they would like to go by typing in the value i.e [3,2]
# Display gameboard with Player X choice on it
# Prompt next player to choose 
# Repeat

=end


array = Array.new(3) { Array.new(3){ "x" } }
array_string = <<~MYHEREDOC
  #{array[0]}
  #{array[1]}
  #{array[2]}
MYHEREDOC

puts array_string