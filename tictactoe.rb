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