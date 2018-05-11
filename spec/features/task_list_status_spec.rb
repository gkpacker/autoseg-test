require 'rails_helper'

RSpec.describe 'Task List Status', type: :feature do
  before :each do
    User.create(email: 'user@autoseg.com', password: '123456')
    User.create(email: 'ggkpacker@gmail.com', password: 'senhasupersecreta')
  end

  it "lets a signed in user create a public task list", js: true do
    visit '/'

    fill_in "user_email", with: "user@autoseg.com"
    fill_in "user_password", with: "123456"
    click_on 'Log in'

    click_on 'Nova lista de tarefas'

    fill_in 'task_list_title', with: 'Processo Seletivo AutoSeg'
    find(:css, "#task_list_status_open").click
    fill_in 'task_list_tasks_attributes_0_title', with: "Entrevista"


    ['Teste de programação', 'Pair Programming', 'Contratação'].each do |task|
      click_on 'Adicionar tarefa'

      within all('.task').last do
        find('.form-control').set task
      end
    end
    click_on 'Criar Task list'

    visit '/'

    expect(page).to have_content 'Processo Seletivo AutoSeg'
  end

  it "lets a signed in user create a private task list", js: true do
    visit '/'

    fill_in "user_email", with: "ggkpacker@gmail.com"
    fill_in "user_password", with: "senhasupersecreta"
    click_on 'Log in'

    click_on 'Nova lista de tarefas'

    fill_in 'task_list_title', with: 'Aos finais de semana'
    fill_in 'task_list_tasks_attributes_0_title', with: "Acordar cedo"


    ['Tomar café', 'Passear com o bentinho', 'Terminar o todolist da AutoSeg', 'Sair com os amigos'].each do |task|
      click_on 'Adicionar tarefa'

      within all('.task').last do
        find('.form-control').set task
      end
    end
    click_on 'Criar Task list'

    visit '/'

    expect(page).to_not have_content 'Aos finais de semana'

    visit '/users'

    expect(page).to have_content 'Aos finais de semana'
  end
end
