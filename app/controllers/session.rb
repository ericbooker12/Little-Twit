get '/sessions/new' do 
	erb :"/sessions/new"
end

post '/sessions' do 
	@user = User.find_by( params[:user][:username])

	if @user && @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		redirect "/users/#{session[:user_id]}"
	else
		@error = "Incorrect login info"
		redirect "/sessions/new"
	end
end

delete '/sessions/:id' do 
	session[:id] = nil
	redirect '/'
end
