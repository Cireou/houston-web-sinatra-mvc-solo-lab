class PuppiesController < ApplicationController

    #List all puppies
    get '/puppies' do 
        @puppies = Puppy.all() 
        erb :index
    end

    #Form for creating puppy.
    get '/puppies/new' do 
        erb :new 
    end

    #Displays a certain Puppy
    get '/puppies/:id' do 
        @puppy = find_puppy(params)
        erb :show
    end

    #Loads puppy editing form.
    get '/puppies/:id/edit' do 
        @puppy = find_puppy(params)
        erb :edit
    end

    #Create a new puppy
    post '/puppies' do 
        puppy = Puppy.create(params)
        redirect "/puppies/#{puppy.id}"
    end

    #Edit a puppy
    patch '/puppies/:id' do 
        puppy = find_puppy(params)
        puppy.update(name: params[:name], breed: params[:breed])
        redirect "/puppies/#{puppy.id}"
    end


    #delete a puppy
    delete '/puppies/:id' do 
        Puppy.delete(params[:id])
        redirect '/puppies'
    end

    def find_puppy(params)
        Puppy.find(params[:id])
    end
end