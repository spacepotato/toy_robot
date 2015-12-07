require_relative 'robot_runner.rb'

robot_runner = RobotRunner.new

puts "I am awaiting your command. If you have not yet placed a robot I would recommend you start with the PLACE commmand"

command = gets.chomp

while command
	robot_runner.execute_command(command)
	command = gets.chomp
end