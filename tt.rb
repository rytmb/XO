#перепиши так, чтобы все происходило в game и только обращалось иногда в гэймер
class Game 

  def initialize 
    @player = Player.new
    @desk = Board.new
  end

  def play
    n = 0
    while n < 9
      system('clear')
      @player.step(n)
      n+=1
    end
    system('clear')
    puts 'Desk full..', 'Bye'
    exit
  end
end

class Player

  def initialize
    @name = '' 
    @sub_name = ['Madame O.', 'Mister X.']
    @error = Board.new
  end

  def step(n)
    win(@error.find_winner)
    naming(n)
    get_pos(n)
  end

  private

  def naming(n)
    if n%2 != 0
      @name = @sub_name[0]
    else 
      @name = @sub_name[1]
    end
  end

  def win(v)
    if v == 'X'|| v =='O'
      @error.render
      puts "Win #{@name}"
      exit
    end
  end

  def get_pos(n)
    while true
      @error.render
      print @name , ' Input: '
      @input = gets.chomp.to_i - 1
      if @error.field[@input] == 'X' || @error.field[@input] == 'O'
        system('clear')
        @error.render
        puts "Wrong input.. #{@input+1} - already have"
      else
        @error.add_coordinate(@input, n)
        break
      end
    end
  end
end

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

game = Game.new
game.play
