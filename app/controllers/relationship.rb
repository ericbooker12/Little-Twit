post '/relationships' do 

	@relationship = Relationship.create(params[:relationships])
	redirect "/"
end