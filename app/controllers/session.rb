get '/sessions/new' do 
	erb :"/sessions/new"
end

post '/sessions' do 
	@user = User.find_by(username: params[:username])

	if @user && @user.authenticate(params[:password])
		sessions[:user_id] = @user.id
		redirect "/users/#{session[:id]}"
	else
		@error = "Incorrect login info"
		redirect "/sessions/new"
	end
end

delete '/sessions/:id' do 
	session[:id] = nil
	redirect '/'
end
