class History < ApplicationRecord
  belongs_to :trackable, polymorphic: true
end
