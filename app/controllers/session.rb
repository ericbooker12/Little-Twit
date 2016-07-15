get '/sessions/new' do 
	erb :"/sessions/new"
end

post '/sessions' do 
	@user = User.find_by(username: params[:user][:username])


	if @user && @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		redirect "/users/#{session[:user_id]}"
	else
		@error = "Incorrect login info"
		redirect "/sessions/new"
	end
end

get '/sessions/logout' do
	p '$' * 100
	p session
	session[:user_id] = nil
	current_user = nil
	redirect '/'
end




