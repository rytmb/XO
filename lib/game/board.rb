class Board

  attr_reader :field

  def initialize
    @field = Array.new(9) { |a| a+=1 }
  end
  
  def find_winner
  (0..2).each do |i|
      if @field[i][0] == @field[i][1] && @field[i][1] == @field[i][2]
        return @field[i][0]

      elsif @field[0][i] == @field[1][i] && @field[1][i] == @field[2][i]
        return @field[0][i] 
      end
    end
    if ( @field[0][0] == @field[1][1] && @field[1][1] == @field[2][2] ) ||
       ( @field[0][2] == @field[1][1] && @field[1][1] == @field[2][0] )
      return @field[1][1] 
    end
  end

  def render
      puts
      puts "|#{@field.at(0)}|#{@field.at(1)}|#{@field.at(2)}|"
      puts "|#{@field.at(3)}|#{@field.at(4)}|#{@field.at(5)}|"
      puts "|#{@field.at(6)}|#{@field.at(7)}|#{@field.at(8)}|"
      puts
  end

  def add_coordinate(i,a)
    if a%2 != 0
      @field[i] = 'O'
    else
      @field[i] = 'X'
    end
    end
end