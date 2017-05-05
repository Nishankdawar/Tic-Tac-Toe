require_relative "playerinputtic_tac_toe.rb"
system("clear")	
puts "Enter your name Player 1"
nameplayer1 = gets
puts "Enter the mark you would like to choose #{nameplayer1}"
marker1 = gets.chomp
puts "Enter your name Player 2"
nameplayer2 = gets
puts "Enter the mark you would like to choose #{nameplayer2}"
marker2 = gets.chomp

puts "Enter the size of the board"
size = gets.to_i 
object1 = CheckWin.new nameplayer1,nameplayer2,size
object1.make_board
object1.PrintBoard
mark = true
checkdraw = true
for i in 1..size*size
	object1.WriteOnBoard marker1,marker2,mark
	mark =! mark
	object1.PrintBoard
	if (object1.checkwin == 'y')
		checkdraw = false
		if !mark==true
			puts "Player 1 Won"
		else
			puts "Player 2 Won"
		end
		break
	end
end
if checkdraw
	puts "Match is draw"
end

