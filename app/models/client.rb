class Client < ActiveRecord::Base
  attr_accessible :email, :home_address, :name, :phone_number
# {{{ validations
  validates :name, :email, :phone_number, :home_address, :presence => true
  validates :email, :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
# }}}
end
