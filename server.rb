require 'sinatra'
require 'sinatra/reloader' if development?
require_relative('lib/calculator.rb')

get '/' do 
	erb(:home)
end

get '/calculate' do 
	@first_number = params[:first_number].to_f
	@second_number = params[:second_number].to_f

	@operation = params[:operation]
	calc = Calculator.new(@first_number, @second_number)
	if @operation == "add"
		@result = calc.add
	elsif @operation == "sub"
		@result = calc.subtract
	elsif @operation == "div"
		@result = calc.divide
	else
		@result = calc.multiply
	end

	erb(:result)
end