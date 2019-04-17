class StoreFlavor < ApplicationRecord
  belongs_to :Store
  belongs_to :Flavor
end
