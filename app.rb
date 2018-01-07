require "sinatra"

get '/' do
    erb :welcome
end

post '/name' do
    first_name = params[:first_name]
    redirect '/pizza_type?first_name=' + first_name
end

get '/pizza_type' do
    first_name = params[:first_name]
    erb :pizza_type, :locals => {:first_name => first_name}
end

post '/pizza_type' do
    pizza_type = params[:pizza_type]
    first_name = params[:first_name]
    redirect '/crust_type?first_name=' + first_name + '&pizza_type=' + pizza_type
end

get '/crust_type' do
    first_name = params[:first_name]
    pizza_type = params[:pizza_type]
    erb :crust_type, :locals => {:first_name => first_name, :pizza_type => pizza_type}
end

post '/crust_type' do
    crust_type = params[:crust_type]
    first_name = params[:first_name]
    pizza_type = params[:pizza_type]
    redirect '/toppings?crust_type=' + crust_type + '&first_name=' + first_name + '&pizza_type=' + pizza_type
end

get '/toppings' do
    first_name = params[:first_name]
    pizza_type = params[:pizza_type]
    crust_type = params[:crust_type]
    erb :toppings, :locals => {:first_name => first_name, :pizza_type => pizza_type, :crust_type => crust_type}
end

post '/toppings' do
    toppings = params[:toppings]
    first_name = params[:first_name]
    pizza_type = params[:pizza_type]
    crust_type = params[:crust_type]
    redirect '/final_order?first_name=' + first_name + '&pizza_type=' + pizza_type + '&crust_type=' + crust_type + '&toppings=' + toppings
end

get '/final_order' do
    first_name = params[:first_name]
    pizza_type = params[:pizza_type]
    crust_type = params[:crust_type]
    toppings = params[:toppings]
    erb :final_order, :locals => {:first_name => first_name, :pizza_type => pizza_type, :crust_type => crust_type, :toppings => toppings}
end
