require 'rails_helper'

feature 'Usuario registra preço' do
  scenario 'Sucesso' do
    user = create(:user)
    paciente = create(:paciente)

    login_as(user)
    visit new_paciente_preco_path(paciente)
    fill_in 'Valor', with: '120,75'
    fill_in 'Reajuste', with: '2018-04-22'
    click_on 'Gravar'

    expect(page).to have_content('22/04/2018')
    expect(page).to have_content('120,75')
  end

  scenario 'Erro por campos em branco' do
    user = create(:user)
    paciente = create(:paciente)

    login_as(user)
    visit new_paciente_preco_path(paciente)
    fill_in 'Valor', with: ''
    fill_in 'Reajuste', with: ''
    click_on 'Gravar'

    expect(page).to have_content('Valor não pode ficar em branco')
    expect(page).to have_content('Reajuste não pode ficar em branco')
  end
end
