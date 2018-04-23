require 'rails_helper'

feature 'User edit price' do
  scenario 'sucessfuly' do
    pending
    user = create(:user)
    paciente = create(:paciente)
    create(:price)

    login_as(user)
    visit root_path
    click_on 'Pacientes'
    click_on paciente.name
    click_on 'Editar Preço'
    fill_in 'Preço', with: '120.00'
    fill_in 'Reajuste', with: '2018-04-18'
    click_on 'Gravar'

    expect(page).to have_content('Preço cadastrado com sucesso')
    expect(page).to have_content(paciente.name)
    expect(page).to have_content('120,00')
    expect(page).to have_content('2018-04-18')
    expect(page).to have_content('2019-04-18')
  end

  scenario 'Error Field has blank' do
    pending
    user = create(:user)
    paciente = create(:paciente)
    create(:price)

    login_as(user)
    visit root_path
    click_on 'Pacientes'
    click_on paciente.name
    click_on 'Editar Preço'
    fill_in 'Preço', with: ''
    fill_in 'Reajuste', with: '2018-04-18'
    click_on 'Gravar'

    expect(page).to have_content('Campo Preço não pode ser branco')
  end
end
