require('spec_helper')

describe(Store) do
  it("validates the presence of a name for a store") do
    new_store = Store.new({:store_name => ""})
    expect(new_store.save()).to(eq(false))
  end
  it("ensures the length of a name for a store is at most 40 characters") do
    new_store = Store.new({:store_name => "n".*(41)})
    expect(new_store.save()).to(eq(false))
  end
  it("capitalizes the name of a store") do
    new_store = Store.create({:store_name => "footer locker"})
    expect(new_store.store_name()).to(eq("Footer locker"))
  end
end
