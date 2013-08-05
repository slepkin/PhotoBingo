class Theme < ActiveRecord::Base
  attr_accessible :name, :user_id, :phrases_attributes

  belongs_to :user
  has_many :phrases
  accepts_nested_attributes_for :phrases, reject_if: :all_blank
  # validate at least 16 phrases

  validates_presence_of :name, :user_id
end