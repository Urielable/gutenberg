require 'compass'
require 'sinatra'
require 'haml'

set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_dir, 'public'

configure do
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.config'))
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
end

get '/' do
  haml :index
end

get '/index' do
	@user = true
	haml :gutenberg
end

get '/books/1' do
	@user = true
	haml :book
end