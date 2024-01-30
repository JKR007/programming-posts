class History < ApplicationRecord
  belongs_to :trackable, polymorphic: true
  belongs_to :whodunit, class_name: 'User', foreign_key: 'user_id', optional: true
end
