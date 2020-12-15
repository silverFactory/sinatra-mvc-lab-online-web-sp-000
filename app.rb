require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end
  post '/piglatinize' do
      @pg_latin = PigLatinizer.new(params[:user_phrase]).the_bits
    erb :pig_latin
  end
end
