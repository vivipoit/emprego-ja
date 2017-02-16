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


  scenario 'and should fill all fields' do
    visit new_category_path

    click_on 'Criar Categoria'

    expect(page).to have_content 'Não foi possível criar a categoria'

  end

  scenario 'and cannot create duplicates' do

    category = Category.create( name: 'Mega Super Dev' )

    visit new_category_path
    fill_in 'Nome', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_content 'Não é possível duplicar categorias'

  end

end
