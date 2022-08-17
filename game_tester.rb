# frozen_string_literal: true

require rspect
require './game'

describe Game do
    describe '#initialize' do
      it '' do
        expect(Game.new(:alive, 5, 2).to_s).to eq('*')
      end
    end
  end  