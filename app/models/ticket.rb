class Ticket < ApplicationRecord
  alias_attribute :manager, :user
  belongs_to :user
  has_many :comments
end
