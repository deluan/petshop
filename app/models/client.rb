class Client < ActiveRecord::Base
  attr_accessible :email, :home_address, :name, :phone_number, :pets_attributes
# {{{ associations
  has_many :pets, :dependent => :destroy
# }}}
# {{{ validations
  validates :name, :email, :phone_number, :home_address, :presence => true
  validates :email, :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
  validates :pets, :length => { :minimum => 1, :message => "(add at least one)" }
# }}}
  accepts_nested_attributes_for :pets, :reject_if => lambda { |pet| pet[:name].blank? && pet[:age].blank? && pet[:pet_type].blank?}
  MAX_PET_COUNT = 4
end
