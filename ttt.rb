require 'pry'
#Tic Tac Toe

# 1. draw a table
# 2. make a array for player to place X or O
# 3. player's move 
# 4. AI's move
# 5.
real_table = {1 => " ",2 => " ",3 =>  " ",4 =>  " ",5 =>  " ",6 =>  " ",7 =>  " ",8 =>  " ",9 =>  " "} #object

def draw_table(t) #pass in a hash
system 'clear'
puts "   |   |    "
puts " #{t[1]} | #{t[2]} |  #{t[3]} "
puts "   |   |    "
puts "---+---+----"
puts "   |   |    "
puts " #{t[4]} | #{t[5]} |  #{t[6]} "
puts "   |   |    "
puts "---+---+----"
puts "   |   |    "
puts " #{t[7]} | #{t[8]} |  #{t[9]} "
puts "   |   |    "
end

def square_empty(table)
  table.select{|k,v|v == ' '}.keys #this will return a array which the posistion is empty
end

def player_pick(table)
  begin 
    puts "Pick a avialiable square (1 ~ 9)"
    square = gets.chomp.to_i
  end until square_empty(table).include?(square) #include can check the vars is or isn't included in an array
  table[square] = 'X'
  draw_table(table)
end

def computer_pick(table)
    pick = square_empty(table).sample
    ##binding.pry
    table[pick] = 'O'
    draw_table(table)
end

def winner_or_tie(t)
  win = [[1,4,7],[2,5,8],[3,6,9],[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7]]
  win.each do |win|
    return "Player" if (t.select{|k,v|v == 'X'}.keys & win).count == 3
    return "Computer" if (t.select{|k,v|v == 'O'}.keys & win).count == 3
  end
  nil
end

def two_in_a_row(t)
  win = [[1,4,7],[2,5,8],[3,6,9],[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7]]

  win.select! do |check_win| 
  #this is to sort every line without "O", any line haves "O" is no need to use two_in_a_row method
    check_win.select! {|a|a if t[a] != "O"} #delete the element if the location is "O"
    check_win if check_win.count == 3 
  end
  win.each do |two| 
  #this is computer to pick the block to stop player's two in a row.  
    if (t.select{|k,v|v == 'X'}.keys & two).count == 2
      block = (two - t.select{|k,v| v == 'X'}.keys).pop
      t[block] = 'O'
      draw_table(t) 
      return true  
    end
  end
  return false
end

def display_winner(winner)
  puts "#{winner} is the winner" if winner 
end 
 
#Here is the Main Function
begin
player_pick(real_table)
attempt_block = two_in_a_row(real_table) #if two_in_a_row is executed, this will return true.
computer_pick(real_table) if attempt_block == false
winner = winner_or_tie(real_table)
display_winner(winner)
end until square_empty(real_table).length == 0 || winner 

puts "It's a tie!!" if !winner
puts "Good bye"


