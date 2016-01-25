require 'sinatra'
require 'sinatra/reloader' if development?
require_relative('lib/calculator.rb')
require_relative('lib/memory.rb')

memory = Memory.new('last_number.txt')

get '/' do
	@saved_number = memory.load_number 
	erb(:home)
end

get '/calculate' do 
	@first_number = params[:first_number].to_f
	@second_number = params[:second_number].to_f

	@operation = params[:operation]
	calc = Calculator.new(@first_number, @second_number)
	@result = calc.send(@operation)

	erb(:result)
end

post '/save' do 
	memory.save(params[:value])
	redirect to('/')
end