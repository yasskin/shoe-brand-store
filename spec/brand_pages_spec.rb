require('spec_helper')

describe('add Create a Brand route', {:type => :feature}) do
  it('allows the user to add a shoe brand') do
    visit('/')
    fill_in('brand-name', :with => "upshift")
    click_button('Create New Shoe Brand')
    expect(page).to have_content("Upshift")
  end
end

describe('add Delete a Brand', {:type => :feature}) do
  it('allows the user to delete a specific brand') do
    new_brand = Brand.new({:brand_name => "upcase"})
    visit('/')
    click_button('Upcase')
    click_button('Destroy Upcase')
    expect(page).to have_content("Create New Shoe Brand")
  end
end

describe('List all Shoe Stores with a specific Brand', {:type => :feature}) do
  it('allows the user to see a list of all Shoe Stores that carry a specific brand') do
    visit('/')
    test_store = Store.create({:store_name => "Many to Many"})
    new_shoe_brand = Brand.new({:brand_name => "psql", :store_ids => [test_store.id()]})
    new_shoe_brand.save()
    click_link("List All Shoe Brands")
    click_link("Psql")
    expect(page).to have_content('MANY TO MANY')
  end
end
