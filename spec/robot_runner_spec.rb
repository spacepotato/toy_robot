require 'spec_helper'

RSpec.describe 'Robot Runner' do
	before(:each) do
		@runner = RobotRunner.new
	end

	context '#robot_friendly_direction' do
		it 'returns the correct value' do
			expect(@runner.robot_friendly_direction("NORTH")).to eq(0)
		end
	end

	context '#execute_command' do
		it 'correctly responds to report if robot isn\'t placed' do
			expect{@runner.execute_command("REPORT")}.to output("You have not placed a robot yet. Try using the PLACE command\n").to_stdout
		end

		it 'delegates unrecognised commands to the robot' do
			robot = @runner.instance_variable_get(:@robot)

			allow(robot).to receive(:move){}
			@runner.execute_command("MOVE")
			expect(robot).to have_received(:move)
		end
	end
end