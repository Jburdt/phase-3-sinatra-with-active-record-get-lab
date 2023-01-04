class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do 
    one_bakery = Bakery.find(params[:id])
    one_bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do 
    desc_price = BakedGood.all.order(price: :DESC)
    desc_price.to_json
  end

  get '/baked_goods/most_expensive' do 
    asc_price = BakedGood.all.order(price: :DESC).first
    asc_price.to_json
  end

end
