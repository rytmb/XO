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