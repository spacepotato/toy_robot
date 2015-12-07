require 'spec_helper'

RSpec.describe 'Robot' do
	before(:each) do
		@robot = Robot.new
	end

	context '#command' do
		it 'calls the correct method if it is within the allowed commands list' do
			#Who knew our robot could spy as well?
			allow(@robot).to receive(:left){}

			@robot.command("LEFT")
			expect(@robot).to have_received(:left)
		end

		it 'alerts the user if the command is not allowed' do
			expect(@robot.command("FLY")).to eq("I'm sorry. I don't understand the command: FLY. Please try again")
		end
	end

	context '#place' do
		it 'correctly sets the position of the robot' do
			@robot.place({x_position: 0, y_position: 0, direction: 3})

			expect(@robot.x_position).to eq(0)
			expect(@robot.y_position).to eq(0)
			expect(@robot.direction).to eq(3)
		end

		it 'doesn\'t place the robot if it is out of bounds' do
			@robot.place({x_position: 5, y_position: 5, direction: 3})

			expect(@robot.x_position).to eq(nil)
			expect(@robot.y_position).to eq(nil)
			expect(@robot.direction).to eq(nil)
		end
	end

	context '#on_board?' do
		it 'returns true if the robot has been placed' do
			@robot.place({x_position: 0, y_position: 0, direction: 3})
			expect(@robot.on_table?).to eq(true)
		end

		it 'returns false if it has not yet been placed in a correct location' do
			expect(@robot.on_table?).to eq(false)
		end
	end

	context '#left' do
		it 'correctly updates the direction' do
			@robot.place({x_position: 0, y_position: 0, direction: 0})

			expect{@robot.command("LEFT")}.to change{@robot.direction}.from(0).to(3)
		end
	end

	context '#right' do
		it 'correctly updates the direction' do
			@robot.place({x_position: 0, y_position: 0, direction: 3})

			expect{@robot.command("RIGHT")}.to change{@robot.direction}.from(3).to(0)
		end
	end

	context '#move' do
		it 'moves the robot if safe to do so' do
			@robot.place({x_position: 0, y_position: 0, direction: 0})

			expect{@robot.command("MOVE")}.to change{@robot.y_position}.from(0).to(1)
		end

		it 'doesn\'t move if unsafe to do so' do
			@robot.place({x_position: 0, y_position: 0, direction: 3})

			expect{@robot.command("MOVE")}.to_not change{@robot.x_position}
		end
	end
end