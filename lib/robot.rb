class Robot
	attr_accessor :x_position, :y_position, :direction, :name

	def initialize(table = nil, name = "Mr Roboto")
		@name = name
		@table = table || Table.new(5, 5)
	end

	def command(command)
		#Because our robot doesn't like to be shouted at
		robot_friendly_command = command.downcase

		if allowed_commands.include?(robot_friendly_command)
			self.send(robot_friendly_command)
		else
			puts "I'm sorry. I don't understand the command: #{command}. Please try again"
		end
	end

	def left
		change_direction(-1)
	end

	def right
		change_direction(1)
	end

	def move
		return unless self.on_table?

		if @direction == 0 || @direction == 2
			proposed_x = @x_position
			proposed_y = @y_position + (@direction == 0 ? 1 : -1)
		elsif @direction == 1 || @direction == 3
			proposed_x = @x_position + (@direction == 1 ? 1 : -1)
			proposed_y = @y_position
		end


		if @table.in_bounds?(proposed_x, proposed_y)
			@x_position, @y_position = proposed_x, proposed_y 
		else
			puts "I can't move there.. I'll fall off the table"
		end
	end

	def place(arguments)
		if @table.in_bounds?(arguments[:x_position], arguments[:y_position])
			@direction = arguments[:direction]
			@x_position = arguments[:x_position]
			@y_position = arguments[:y_position]

			puts "#{@name} is now online. It responds to LEFT/RIGHT/MOVE"
		else
			puts "You can't put me there! I'll fall"
		end
	end

	def on_table?
		return !defined?(@x_position).nil? && !defined?(@y_position).nil?
	end

	protected

	def allowed_commands
		["left", "right", "move"]
	end

	def change_direction(value)
		return unless self.on_table?

		@direction += value

		if @direction > 3
			@direction = 0
		elsif @direction < 0
			@direction = 3
		end
	end
end