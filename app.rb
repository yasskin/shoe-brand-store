require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*rb'].each {|file| require file}

get('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = Brand.all()
  erb(:store)
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  @stores = Store.all()
  erb(:brand)
end

post('/store_success') do
  @name = params.fetch('name')
  store = Store.new({:store_name => @name})
  store.save()
  erb(:store_success)
end

post('/brand_success') do
  @name = params.fetch('name')
  brand = Brand.new({:brand_name => @name})
  store.save()
  erb(:brand_success)
end

delete('/store/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @store.delete()
  @stores = Store.all()
  @brand = Brand.all()
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
