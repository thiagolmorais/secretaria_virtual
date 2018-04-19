require 'rails_helper'

feature 'User register patient' do
  scenario 'sucessfuly' do
    pending
    user = create(:user)

    login_as(user)
    visit root_path
    click_on 'Cadastra Paciente'
    fill_in 'Nome', with: 'Paciente A'
    fill_in 'Telefone', with: '999999999'
    fill_in 'Nascimento', with: '01/01/2000'
    fill_in 'Paciente desde', with: '15/01/2017'
    click_on 'Gravar'

    expect(page).to have_content('Paciente cadastrado com sucesso')
    expect(page).to have_content('Paciente A')
    expect(page).to have_content('999999999')
    expect(page).to have_content('01/01/2000')
    expect(page).to have_content('15/01/2017')
  end

  scenario 'Error Field has blank' do
    pending
    user = create(:user)

    login_as(user)
    visit root_path
    click_on 'Cadastra Paciente'
    fill_in 'Nome', with: ''
    fill_in 'Telefone', with: ''
    fill_in 'Paciente desde', with: '15/01/2017'
    click_on 'Gravar'

    expect(page).to have_content('Campo Nome não pode ser branco')
    expect(page).to have_content('Campo Telefone não pode ser branco')
  end
end
