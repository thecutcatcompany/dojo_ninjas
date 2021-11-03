class Dojo < ApplicationRecord

has_many :ninja

  validates :name, :city, :state, 
  presence: {message: "campo requerido"}

  validates :state, 
  length: {minimum: 2, maximum: 2}

end