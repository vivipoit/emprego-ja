require 'rails_helper'

feature 'Visitor visits Emprego Ja home page' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content('Emprego Já')
    expect(page).to have_content('Nova vaga')
    expect(page).to have_content('Nova empresa')
    expect(page).to have_content('Nova categoria')
  end
end
