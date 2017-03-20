# Find the path for bot to reach the princess quickly
# Solution
# - First find the x, y cordinates for both princess and bot within the grid
# - Find the movement on x-axis for the bot
# - Find the movement on y-axis for the bot
# - Based on the difference between the index position of bot , princess the movement is decided
# - The final movement is the combined result of x-axis, y-axis movement

class SavePrincess

	$input_grid = [['-','-','p'], ['-','m','-'],['-','-','-']]

	def initialize
	  @bot_x_pos, @bot_y_pos = find_coordinates('m')
	  @pr_x_pos , @pr_y_pos =  find_coordinates('p') 
	end
      
	# Find x , y cordicates for both Bot, Princess  
	def find_coordinates(crd_obj)
	  x_cord , y_cord = ''
	  $input_grid.each_with_index do |grd_row,key|
	    grd_row.each_with_index do |val, row_key|
	      if val.eql?(crd_obj)
		x_cord = row_key.to_i
		y_cord = key.to_i
	      end
	    end
	  end
	  return x_cord, y_cord
	end
    
	# Find the horizontal_moves
	def find_horizontal_move
	  horizontal_move = []
	  while (@bot_x_pos - @pr_x_pos) > 0 do
	    horizontal_move << "LEFT"
	    @bot_x_pos -= 1
	  end

	  while (@bot_x_pos - @pr_x_pos) < 0 do
	    horizontal_move << "RIGHT"
	    @bot_x_pos += 1
	  end
	  horizontal_move
	end
    
	# Find the vertical moves
	def find_vertical_move
	  vert_move = []
	  while (@bot_y_pos - @pr_y_pos) > 0 do
	    vert_move << "UP"
            @bot_y_pos -= 1
	  end

	  while (@bot_y_pos - @pr_y_pos) < 0 do
	    vert_move << "DOWN"
            @bot_y_pos += 1
	  end
	  vert_move
	end

	
	def find_princess_path
	  @movement = []
	  @movement << find_horizontal_move
          @movement << find_vertical_move
          puts @movement.flatten.each { |move| move}
	end

end

@sp = SavePrincess.new
@sp.find_princess_path
