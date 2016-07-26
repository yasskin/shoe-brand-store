require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*rb'].each {|file| require file}

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

get('/brands') do
  @brands = Brand.all()
  erb(:brands)
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

post('/stores') do
  name = params.fetch('store-name')
  @store = Store.new(:id => nil, :store_name => name)
  if @store.save()
    redirect('/stores/'.concat(@store.id().to_s()))
  else
    erb(:index)
  end
end

post('/brands') do
  name = params.fetch('brand-name')
  @brand = Brand.new(:id => nil, :brand_name => name)
  if @brand.save()
    redirect('/brands/'.concat(@brand.id().to_s()))
  else
    erb(:index)
  end
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = @store.brands()
  erb(:store)
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  @stores = @brand.stores()
  erb(:brand)
end

patch('/stores/:id') do
  store_id = params.fetch('id').to_i()
  @store = Store.find(store_id)
  name = params.fetch('store-name')
  if @store.update(:store_name => name)
    redirect('/stores/'.concat(@store.id().to_s()))
  else
    erb(:store_errors)
  end
end

patch('/brands/:id') do
  brand_id = params.fetch('id').to_i()
  @brand = Brand.find(brand_id)
  name = params.fetch('brand-name')
  if @brand.update(:brand_name => name)
    redirect('/brands/'.concat(@brand.id().to_s()))
  else
    erb(:brand_errors)
  end
end

delete('/stores/:id') do
  store_id = params.fetch('id').to_i()
  @store = Store.find(store_id)
  @store.destroy()
  redirect('/')
end

delete('/brands/:id') do
  brand_id = params.fetch('id').to_i()
  @brand = Brand.find(brand_id)
  @brand.destroy()
  redirect('/')
end
