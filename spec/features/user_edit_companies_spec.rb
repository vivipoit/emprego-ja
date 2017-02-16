require 'rails_helper'

feature 'User edit companies' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

   company2 = Company.create(name: 'Campus Code 2',
                             location: 'Belo Horizonte',
                             mail: 'vagas@campus.com.br',
                             phone: '1234-4321')

    visit edit_company_path(company)

    fill_in 'Nome',     with: company2.name
    fill_in 'Local',    with: company2.location
    fill_in 'Email',    with: company2.mail
    fill_in 'Telefone', with: company2.phone

    click_on 'Atualizar Empresa'

    expect(page).to have_css('h1', text: company2.name)
    expect(page).to have_content company2.location
    expect(page).to have_content company2.mail
    expect(page).to have_content company2.phone
  end

  scenario 'with valid data' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    visit edit_company_path(company)

    fill_in 'Nome', with: ''

    click_on 'Atualizar Empresa'

    expect(page).to have_content 'Não foi possível atualizar a empresa'
  end
end
