require_relative 'robot'
require_relative 'table'

class RobotRunner
	def initialize
		@table = Table.new(5, 5)
		@robot = Robot.new(@table)

		@directions_hash = {0 => "NORTH", 1 => "EAST", 2 => "SOUTH", 3 => "WEST"}
	end

	def execute_command(command)
		#This should acommodate for even the strangest of inputs eg PlAcE
		command.downcase!

		if command == "place"
			puts "Where would you like to place the robot? I accept input in the form of #{@table.x_range} #{@table.y_range} NORTH/EAST/SOUTH/WEST"
			x, y, direction = gets.chomp.split(" ")

			x = Integer x rescue nil
			y = Integer y rescue nil

			direction = robot_friendly_direction(direction)

			if x.nil? || y.nil? || direction.nil?
				return
			end

			@robot.place({x_position: x, y_position: y, direction: direction})
		elsif command == "report"
			if @robot.on_table?
				puts "#{@robot.name} is currently at (#{@robot.x_position}, #{@robot.y_position}) facing #{self.human_friendly_direction(@robot.direction)}"
			else
				puts "You have not placed a robot yet. Try using the PLACE command"
			end
		else
			@robot.command(command)
		end
	end

	def robot_friendly_direction(direction_string)
		@directions_hash.each do |key, value|
			if value == direction_string
				return key
			end
		end

		puts "That direction doesn't seem to exist"
		return nil
	end

	def human_friendly_direction(direction_numeral)
		@directions_hash[direction_numeral]
	end

end
