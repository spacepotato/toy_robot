require 'spec_helper'

RSpec.describe 'Table' do
	let(:table) { Table.new(5, 5) }

	context '#in_bounds?' do
		it 'returns true when we pass coordinates in the bounds of the table' do
			expect(table.in_bounds?(3, 3)).to eq(true)
		end

		it 'returns false when we pass coordinates that are outside the table' do
			#Recall that this will be out of bounds as a 5x5 table is actually 0 -> 4 in x and y
			expect(table.in_bounds?(5, 5)).to eq(false)
		end
	end

	context 'range' do
		it 'returns the correct x range' do
			expect(table.x_range).to eq("[0 - 4]")
		end

		it 'returns the correct y range' do
			expect(table.y_range).to eq("[0 - 4]")
		end
	end
end
