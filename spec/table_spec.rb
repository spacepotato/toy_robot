require 'spec_helper'

RSpec.describe 'Table' do
	context '#in_bounds?' do
		before(:each) do
			@table = Table.new(5, 5)
		end

		it 'returns true when we pass coordinates in the bounds of the table' do
			expect(@table.in_bounds?(3, 3)).to eq(true)
			expect(@table.in_bounds?(0, 0)).to eq(true)
		end

		it 'returns false when we pass coordinates that are outside the table' do
			#Recall that this will be out of bounds as a 5x5 table is actually 0 -> 4 in x and y
			expect(@table.in_bounds?(5, 5)).to eq(false)
		end
	end
end