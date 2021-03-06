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
    visit('/')
    fill_in('brand-name', :with => "upshift")
    click_button('Create New Shoe Brand')
    click_button('Destroy Upshift')
    expect(page).to have_content("Create New Shoe Brand")
  end
end

describe('List all Shoe Stores with a specific Brand', {:type => :feature}) do
  it('allows the user to see a list of all Shoe Stores that carry a specific brand') do
    test_brand = Brand.create({:brand_name => "adidas"})
    test_brand = Brand.create({:brand_name => "camper"})
    visit('/')
    expect(page).to have_content('Adidas')
    expect(page).to have_content('Camper')
  end
end
