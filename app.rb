require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*rb'].each {|file| require file}

get('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

get('/store/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = Brand.all()
  erb(:store)
end

get('/brand/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  @stores = Store.all()
  erb(:brand)
end

post('/store_success') do
  @name = params.fetch('store-name')
  @store = Store.new({:store_name => @name})
  if @store.save()
    redirect("/store/".concat(@store.id().to_s()))
  else
    erb(:index)
  end
end

post('/brand_success') do
  @name = params.fetch('brand-name')
  @brand = Brand.new({:brand_name => @name})
  if @brand.save()
    redirect("/brand/".concat(@brand.id().to_s()))
  else
    erb(:index)
  end
end

delete('/store/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @store.delete()
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

delete('/brand/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  @brand.delete()
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

patch('/stores/:id') do
  store_id = params.fetch('id').to_i()
  @store = Store.find(store_id)
  brand_ids = params.fetch("brand_ids")
  @store.update({:brand_ids => brand_ids})
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

patch('/brands/:id') do
  brand_id = params.fetch('id').to_i()
  @brand = Brand.find(brand_id)
  store_ids = params.fetch("store_ids")
  @brand.update({:store_ids => store_ids})
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end
