# frozen_string_literal: true

class Game # :nodoc:
  attr_accessor :score, :frame, :pins, :tirada1, :tirada2, :points, :turn, :sum, :result 

  def initialize(tirada1, tirada2)
    # @rolls = []
    @score =  Array.new(9){0}
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
    @points = [[1, 4], [4, 5], [6, 4], [5, 5], [10, 0], [0, 1], [7, 3], [6, 4], [10, 0], [2, 8, 6]]
    print @points          
    return @points
  end

  # Recorrer los puntos y envia frame e intento
  def run_score(points)
    p 'run'
    @total =  Array.new(9){0}
    result_score_act = 0
    (0..8).each do | r |
      (0..1).each do | q |
        
        result_score_act = rules_score(r,q)

      end
       #p result_score_act[0].to_i
      #total[r] = result_score_act.to_i + total[r-1].to_i
    end
    print @score
   
  end
  
  def rules_score(frame,try)

    turn =  @points[frame][try]
    #next_frame = @points[i+1][j].to_i + @points[i+1][j+1].to_i
    
    #print frame 
    #print turn
      if strike?(turn)
        
        @score[frame] += 10 + strike_bonus(frame+1)

      end

    
    #elsif spare?(turn)
     #  @score += 10 + spare_bonus(turn)
      # turn += 2
    # else
    #   @score += sum_of_balls_in_frame(turn)
    #   turn += 2
    # end
    @score
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
game01.run_score(table)
