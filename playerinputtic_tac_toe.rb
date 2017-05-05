class Maketheboard 
	def initialize nameplayer1,nameplayer2,n
		@nameplayer1 = nameplayer1
		@nameplayer2 = nameplayer2
		@dimension = n.to_i
		@arr = Array.new(n.to_i+1){Array.new(n.to_i+1)}

	end
	def make_board
		k = 1
		for i in 1..@dimension
			for j in 1..@dimension
				@arr[i][j] = k
				k = k+1
			end
		end
	end
	def PrintBoard
		k = 1
		for i in 1..@dimension
			for j in 1..@dimension
				print "#{@arr[i][j]}\t"
				k = k+1
			end
			puts " "," "
		end
	end
	def WriteOnBoard marker1,marker2,bool
		if( bool==true )
			puts "Enter the location 1"
			location1 = gets.to_i
			row = ((location1 - 1)/@dimension.to_i)+1
			column = ((location1 - 1) % @dimension.to_i)+1
			until marker1 != @arr[row][column] && marker2 != @arr[row][column]
				puts "This Location is already set"
				puts "Enter the correct location"
				location1 = gets.to_i
				row = ((location1 - 1)/@dimension.to_i)+1
				column = ((location1 - 1) % @dimension.to_i)+1
			end
			@arr[row][column] = marker1

		else
			puts "Enter location for player 2"
			location2 = gets.to_i
			row = ((location2 - 1)/@dimension.to_i)+1
			column = ((location2 - 1) % @dimension.to_i)+1
			until marker1 != @arr[row][column] && marker2 != @arr[row][column]
				puts "This Location is already set"
				puts "Enter the correct location"
				location2 = gets.to_i
				row = ((location2 - 1)/@dimension.to_i)+1
				column = ((location2 - 1) % @dimension.to_i)+1
			end
			@arr[row][column] = marker2
		end
	end
end



class CheckWin < Maketheboard
	def checkwin
		for i in 1..@dimension
			k = 0
			for j in 1..@dimension
				if( @arr[i][1] != @arr[i][j])
					break
				end
				k+=1
			end
			if( k == @dimension )
				return 'y'
			end
		end
		for j in 1..@dimension
			k = 0
			for i in 1..@dimension
				if( @arr[1][j] != @arr[i][j])
					break
				end
				k += 1
			end
			if( k == @dimension )
				return 'y'
			end
		end
		
		k = 0
		for i in 1..@dimension
			if( @arr[1][1] != @arr[i][i] )
				break 
			end
			k += 1
		end
		if( k == @dimension )
			return 'y'
		end

		k = 0
		for i in 1..@dimension
			if( @arr[1][@dimension] != @arr[i][@dimension+1-i] )
				break 
			end
			k+=1
		end
		if( k == @dimension )
			return 'y'
		end

		return 'n'
	end
end