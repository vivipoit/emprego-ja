require 'rails_helper'

feature 'User create categories' do

  scenario 'successfully' do

    #setup
    category = Category.new( name: 'Mega Dev' )

    #execução
    visit new_category_path
    fill_in 'Nome', with: category.name
    click_on 'Criar Categoria'

    #expectativa
    expect(page).to have_content(category.name)

  end

end
