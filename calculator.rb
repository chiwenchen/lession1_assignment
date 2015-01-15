#1. input the first num
#2. input the second num
#3. choose an operator
#4. output the outcome

def play_again(again) #Recursion
	puts "do you want play again?"
	again = gets.chomp.downcase
	if again == "n"
		abort("Good-bye")
	elsif again != "y"
		play_again(again)
	end 
end

loop do
	begin
		puts "Enter the first number"
		num1 = gets.chomp.to_i
	end until num1.class == Fixnum || num1.class == Float

	begin 
		puts "Enter the second number"
		num2 = gets.chomp.to_i
	end until num2.class == Fixnum || num1.class == Float

	begin
		puts "choose an operator"
		operator = gets.chomp.to_s
		case operator
		when "+"
			puts "#{num1} + #{num2} = #{num1+num2}"
		when "-"
			puts "#{num1} - #{num2} = #{num1-num2}"
		when "*"
			puts "#{num1} * #{num2} = #{num1*num2}"
		when "/"
			puts "#{num1} * #{num2} = #{num1.to_f/num2.to_f}"
		else 
			puts "Pick a right operator"
		end
	end until operator == "+" || operator == "-" || operator == "*" || operator == "/"

	again = ""
	play_again(again)

end




