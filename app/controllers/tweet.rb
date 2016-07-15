get '/tweets' do 
end

get '/tweets/new' do 
erb :'/tweets/new'
end

post '/tweets' do 
	@tweet = Tweet.new(params[:tweets])

	if @tweet.save
		redirect "/users/#{current_user.id}"
	else
		@error = @tweet.errors.full_messages
		erb :"/tweet/new"
	end
end

get '/tweets/:id' do 
end

delete '/tweets/:id' do 
end