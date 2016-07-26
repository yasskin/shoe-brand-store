require('spec_helper')

describe('create a route for the Store model', {:type => :feature}) do
  it('creates a new shoe store and brings the user to a unique page for that store id') do
    visit('/')
    fill_in('store-name', :with => "tilda")
    click_button('Create New Shoe Store')
    expect(page).to have_content('Tilda')
  end
end

describe('create a route to List all shoe stores', {:type => :feature}) do
  it('takes a user to a page where all of the shoe stores are listed') do
    new_store = Store.create({:store_name => "branches"})
    new_store = Store.create({:store_name => "tilda"})
    visit('/')
    expect(page).to have_content('Branches')
    expect(page).to have_content('Tilda')
  end
end

describe('Delete a shoe store', {:type => :feature}) do
  it('allows the user to delete an individual shoe store') do
    new_store = Store.create({:store_name => "restful"})
    visit('/')
    click_link('Restful')
    click_button('Destroy Restful')
    expect(page).to have_content('Create New Shoe Store')
  end
end

# describe('Update the NEW STORE default name with a new store name', {:type => :feature}) do
#   it('takes the user to a unique store page where the store name can be updated') do
#     visit('/')
#     click_button('Create New Shoe Store')
#     fill_in('store-name', :with => "drop 'n' pop")
#     click_button('Update')
#     expect(page).to have_content("DROP 'N' POP")
#   end
# end
