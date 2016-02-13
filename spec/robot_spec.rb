require 'spec_helper'

RSpec.describe 'Robot' do
	let(:robot) { Robot.new }

	context '#command' do
		it 'calls the correct method if it is within the allowed commands list' do
			#Who knew our robot could spy as well?
			allow(robot).to receive(:left){}

			robot.command("LEFT")
			expect(robot).to have_received(:left)
		end

		it 'alerts the user if the command is not allowed' do
			expect{robot.command("fly")}.to output("I'm sorry. I don't understand the command: fly. Please try again\n").to_stdout
		end
	end

	context '#place (in bounds)' do
		before(:each) do
			robot.place({x_position: 0, y_position: 0, direction: 3})
		end

		it 'correctly sets the x position of the robot if placed in bounds' do
			expect(robot.x_position).to eq(0)
		end

		it 'correctly sets the y position of the robot if placed in bounds' do
			expect(robot.y_position).to eq(0)
		end

		it 'correctly sets the direction of the robot if placed in bounds' do
			expect(robot.direction).to eq(3)
		end
	end

	context 'place (out of bounds)' do
		before(:each) do
			robot.place({x_position: 5, y_position: 5, direction: 3})
		end

		it 'doesn\'t set the x position of the robot if placed out of bounds' do
			expect(robot.x_position).to eq(nil)
		end

		it 'doesn\'t set the y position of the robot if placed out of bounds' do
			expect(robot.y_position).to eq(nil)
		end

		it 'doesn\'t set the direction of the robot if placed out of bounds' do
			expect(robot.direction).to eq(nil)
		end
	end

	context '#on_board?' do
		it 'returns true if the robot has been placed' do
			robot.place({x_position: 0, y_position: 0, direction: 3})
			expect(robot.on_table?).to eq(true)
		end

		it 'returns false if it has not yet been placed in a correct location' do
			expect(robot.on_table?).to eq(false)
		end
	end

	context '#left' do
		it 'correctly updates the direction' do
			robot.place({x_position: 0, y_position: 0, direction: 0})

			expect{robot.command("LEFT")}.to change{robot.direction}.from(0).to(3)
		end
	end

	context '#right' do
		it 'correctly updates the direction' do
			robot.place({x_position: 0, y_position: 0, direction: 3})

			expect{robot.command("RIGHT")}.to change{robot.direction}.from(3).to(0)
		end
	end

	context '#move' do
		it 'moves the robot if safe to do so' do
			robot.place({x_position: 0, y_position: 0, direction: 0})

			expect{robot.command("MOVE")}.to change{robot.y_position}.from(0).to(1)
		end

		it 'doesn\'t move if unsafe to do so' do
			robot.place({x_position: 0, y_position: 0, direction: 3})

			expect{robot.command("MOVE")}.to_not change{robot.x_position}
		end
	end
end
