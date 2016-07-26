class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  has_and_belongs_to_many(:tags)
  validates(:store_name, {:presence => true, :length => {:maximum => 40}})
  before_save(:store_capitalize)

private
  define_method(:store_upcase) do
    self.store_name().capitalize!
  end

end
