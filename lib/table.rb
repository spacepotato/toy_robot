class Table
	attr_accessor :width, :height

	def initialize(width, height)
		@width = width
		@height = height
	end

	def in_bounds?(x_position, y_position)
		return (0..@width - 1).include?(x_position) && (0..@height - 1).include?(y_position)
	end

  def x_range
    "[#{0} - #{self.width - 1}]"
  end

  def y_range
    "[#{0} - #{self.height - 1}]"
  end
end
