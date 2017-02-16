class Category < ApplicationRecord

  has_many :jobs

  validates :name, presence: {message: 'Não foi possível criar a categoria'}
  validates :name, uniqueness: {message: 'Não é possível duplicar categorias'}
  

end
