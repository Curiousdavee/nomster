class Place < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true ,length: { minimum: 3 }
  validates :address, presence: true
  validates :description, presence: true
# Each unique field needs it's own line,
# but it can have multiple validations for the specific field.
end