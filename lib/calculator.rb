class Calculator
	def initialize(num_one, num_two)
		@num_one = num_one
		@num_two = num_two
	end

	def add
		@num_one + @num_two
	end

	def subtract
		@num_one - @num_two
	end

	def multiply
		@num_one * @num_two
	end

	def divide
		@num_one / @num_two
	end

	def method_missing(meth, *args)
		# div, sub, mult
		hopeful_method = self.methods.grep(/#{Regexp.quote(meth.to_s)}/).first
		self.send(hopeful_method)
	end
end