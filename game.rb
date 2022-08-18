# frozen_string_literal: true

class Game # :nodoc:
  attr_accessor :score, :frame, :pins, :tirada1, :tirada2, :points, :turn, :sum, :result 

  def initialize(tirada1, tirada2)
    # @rolls = []
    @score = []
    @frame = 0
    @pins = 10
    @tirada1 = tirada1
    @tirada2 = tirada2
    @sum = []

  end

  def roll(pins)
    @rolls << @pins
  end

  def chart
    @points =  Array.new(9) { Array.new(2) }
    # (0..8 ).each do | i | # Turno
    #   (0..1).each do | j |# Intentos
    #     @points[i][j] = rand(0..10)
    #   end
    # end
    # @points.push(Array.new(3){0})
    # print @points
    # @points = [[1, 4], [4, 5], [6, 4], [5, 5], [10, 0], [0, 1], [7, 3], [6, 4], [10, 0], [2, 8, 6]]
    @points = [[10, 0], [4, 5], [6, 4], [5, 5], [10, 0], [0, 1], [7, 3], [6, 4], [10, 0], [2, 8, 6]]
    print @points          
    return @points
  end

  def pointer
    #p 'Puntaje'
    @result = Array.new(8)
    (0..8 ).each do | k | # Resultado

      @result[k] = @points[k][0] + @points[k][1]

    end
    puts ""
    print result
    @result
  end

  
  def sumato

    (0..8 ).each do | l | # Resultado

      @sum[l] = @result[l+1].to_i + @sum[l].to_i

    end

    puts "HOLAAAAAA"
    print @sum

  end 
  
  #REcorrer los puntos y envia frame e intento
  def run_score(points)
    p 'run'
    (0..8).each do | r |
      (0..1).each do | q |
        rules_score(r,q)
      end
    end
    print @score
  end
  
  def rules_score(frame,try)

    i = 0
    turn =  @points[frame][try]
    #next_frame = @points[i+1][j].to_i + @points[i+1][j+1].to_i

    #print frame 
    #print turn
    @score[frame] = 0

    if strike?(turn)
      print turn 
      @score[frame] = 10 + strike_bonus(frame+1)
    end

    print @score
    #elsif spare?(turn)
     #  @score += 10 + spare_bonus(turn)
      # turn += 2
    # else
    #   @score += sum_of_balls_in_frame(turn)
    #   turn += 2
    # end
    
  end
  def strike?(turn)
    turn == 10
  end

  def sum_of_balls_in_frame(_frame)
    @rolls[@frame] + @rolls[@frame + 1]
  end

  def spare_bonus(_frame)
    @rolls[@frame + 2]
  end

  def strike_bonus(frame)
    @points[frame][0].to_i + @points[frame][1].to_i
    # @rolls[@frame + 1] + @rolls[@frame + 2]
  end

  def spare?(_frame)
    @rolls[@frame] + @rolls[@frame + 1] == 10
  end
end

point = 0

game01 = Game.new(4,5)
table = 0
table = game01.chart
point = game01.pointer
game01.run_score(table)
