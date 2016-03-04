require 'sinatra'
require 'pry'
require 'csv'

get "/launcher-bucket-list" do

@items = CSV.readlines('bucket_list.csv', headers: true)

erb :index
end

get "/" do
   redirect "/launcher-bucket-list"
end

post "/launcher-bucket-list" do

  item = params['goal']

  unless item.strip.empty?

    CSV.open('bucket_list.csv', 'a') do |row|
      row << [item]
    end
  end
  redirect "/launcher-bucket-list"
end
