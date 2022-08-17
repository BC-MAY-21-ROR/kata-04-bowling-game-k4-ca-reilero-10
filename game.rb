# frozen_string_literal: true

class Game # :nodoc:
  attr_accessor :score, :frame, :pins, :tirada1, :tirada2, :points

  def initialize(tirada1, tirada2)
    @rolls = []
    @score = 0
    @frame = 0
    @pins = 10
    @tirada1 = tirada1
    @tirada2 = tirada2

  end

  def roll(pins)
    @rolls << @pins
  end

  def chart
    @points =  Array.new(9) { Array.new(2) }
    (0..8 ).each do | i | # Turno
      (0..1).each do | j |# Intentos
        @points[i][j] = rand(0..10)
      end
    end
    print @points
  end

  def pointer
    p 'Puntaje'
    result = Array.new(8)
    (0..8 ).each do | k | # Resultado
      result[k] = @points[k][0] + @points[k][1]
    end
    print result
  end

  def rules_score(_frame)
    if strike?(@frame)
      @score += 10 + strike_bonus(@frame)
      @frame += 1
    elsif spare?(@frame)
      @score += 10 + spare_bonus(@frame)
      @frame += 2
    else
      @score += sum_of_balls_in_frame(@frame)
      @frame += 2
    end
  end

  def strike?(_frame)
    @rolls[@frame] == 10
  end

  def sum_of_balls_in_frame(_frame)
    @rolls[@frame] + @rolls[@frame + 1]
  end

  def spare_bonus(_frame)
    @rolls[@frame + 2]
  end

  def strike_bonus(_frame)
    @rolls[@frame + 1] + @rolls[@frame + 2]
  end

  def spare?(_frame)
    @rolls[@frame] + @rolls[@frame + 1] == 10
  end
end

game01 = Game.new(4,5)
game01.chart
game01.pointer