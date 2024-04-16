require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @the_num = params.fetch("number").to_f
  @the_result = @the_num ** 2
  
  erb(:square_results)
end


get("/square_root/new") do
  erb(:squareroot_new)
end

get("/square_root/results") do
  @the_num = params.fetch("number_square_root").to_f
  @the_result = @the_num ** (1/2.0)

  erb(:squareroot_results)
end


get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @apr_month = (@apr / 100) / 12
  @num_years = params.fetch("num_years").to_f
  @num_months = @num_years * 12
  @principal = params.fetch("principal").to_f
  
  @numerator = @apr_month * @principal
  @denominator = 1 - ((1 + @apr_month) ** (-@num_months))

  @payment = @numerator / @denominator
  
  erb(:payment_results)
end


get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @random_num = @min + rand * (@max - @min)

  erb(:random_results)
end
