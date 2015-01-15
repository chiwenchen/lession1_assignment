# Rock = 0
# Paper = 1
# Scissors = 2
player = ""
puts "=> GO! let's Rock Paper Scissors"
play = "y"
playerscore = 0
computerscore = 0

def show(x)
  if x == "0"
    "Rock"
  elsif x == "1"
    "Paper"
  elsif x == "2"
    "Scissors"
  end
end

while play == "y" || play == "s" do #agree to play
  puts "=> 0) Rock 1)Paper 2)Scissors"
  player = gets.chomp
  while (player != "0" && player != "1" &&player != "2")
    puts "Please enter again!!"
    puts "=> 0) Rock 1)Paper 2)Scissors"
    player = gets.chomp
  end
  #compare
  computer = rand(3).to_s
  if computer == player
    puts "You are even! let's try again."
  elsif (player == "0" && computer == "2") || (player == "1" && computer == "0") || (player == "2" && computer == "1")
    puts "You : #{show(player)}"
    puts "Computer : #{show(computer)}" 
    puts "You Won!!"
    playerscore += 1
  else
    puts "You : #{show(player)}"
    puts "Computer : #{show(computer)}" 
    puts "You lose!!"
    computerscore += 1
  end

  #play again?
  puts "=> do you want to play again? y) Yes n) No s)Show score" 
  play = gets.chomp
  if play == "n"
    puts "Good bye"
    break
  elsif play == "s"
    puts "your score -> #{playerscore}, computer's score -> #{computerscore}"
    puts "Continue the game? y) Yes n) Leave!"
    play = gets.chomp
    if play = "n"
      break
    end
  end
  while play != "y" && play != "n" && play != "s" do
    puts "=> Please re-enter. y) Yes n) No "
    play = gets.chomp
    if play == "n"
      puts "Good bye"
      break
    end
  end
end
