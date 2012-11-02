class Pet < ActiveRecord::Base
  attr_accessible :age, :name, :pet_type
# {{{ associations
  belongs_to :client
# }}}
# {{{ validations
  validates :age, :name, :pet_type, :presence => true
  validates :age, :numericality => { :greater_than_or_equal_to => 0 }
  validates :pet_type, :inclusion => { :in => %w(dog cat bird other) }
# }}}
end
