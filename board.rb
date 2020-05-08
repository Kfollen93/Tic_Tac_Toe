require 'colorize'

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
          puts "Please enter between a range of 0 - 2".red
          row = gets.chomp.to_i
          column = gets.chomp.to_i
        end
        while my_array[row][column] != " "
          puts "Sorry you can't move there. Try again.".red
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
          puts "    [^][^]     It's #{$player_one}'s turn!       [^][^]".magenta
        else puts "   [^][^]     It's #{$player_two}'s turn!       [^][^]".magenta
        end
        puts
  
        def empty?(my_array) #checks for empty spaces to announce tie
          spaces = my_array.flatten.any?{ |spot| spot == " "}
          if spaces == false
            puts "Neither player wins. It's a tie.".orange
          end
        end
  
        empty?(my_array) #calling to check for tie
  
        row = gets.chomp.to_i
        column = gets.chomp.to_i
        while row < 0 || row > 2 || column < 0 || column > 2
          puts "Please enter between a range of 0 - 2".red
          row = gets.chomp.to_i
          column = gets.chomp.to_i
        end
        while my_array[row][column] != " "
          puts "Sorry you can't move there. Try again.".red
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
        puts "    [^][^]     It's #{$starting_player}'s turn!       [^][^]".light_blue
  
  
  
        empty?(my_array) #calling to check for tie
  
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
        puts "    [/][/]                                         [/][/]".green
        puts "                    #{$starting_player} wins!              ".green
        puts "    [/][/]                                         [/][/]".green
  
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
          puts "    [/][/]                                    [/][/]".green
          puts "                    #{$player_one} wins!              ".green
          puts "    [/][/]                                    [/][/]".green
          else puts "    [/][/]                                    [/][/]".green
               puts "                   #{$player_two} wins!              ".green
               puts "    [/][/]                                    [/][/]".green
          end
  end
  end # create board end
  end #class end