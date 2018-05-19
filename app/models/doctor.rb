class Doctor < ApplicationRecord
  validates :number, :presence => true
  validates_format_of :number, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
  validates :number, :numericality => true, :length => { :minimum => 10, :maximum => 11 }
  validates :name, presence: { :message => "This field is required." }
end
