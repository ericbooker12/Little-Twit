get '/' do
	@tweets = Tweet.all
	@users = User.all
  erb :'index'
end

