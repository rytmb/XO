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