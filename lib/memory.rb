class Memory
	def initialize(file_path)
		@file_path = file_path
	end

	def save(number) 
		begin 
			IO.write(@file_path, number)
		rescue
			# Create the file and add the number 
			# return number 
		end
	end

	def load_number 
		begin
			IO.read(@file_path)
		rescue 
			return nil
		end
	end
end