require 'rails_helper'

RSpec.describe 'Favorite Task List', type: :feature do
  before :each do
    User.create(email: 'user@autoseg.com', password: '123456')
  end

  it "favorite a task list", js: true do
    visit '/'

    fill_in "user_email", with: "user@autoseg.com"
    fill_in "user_password", with: "123456"
    click_on 'Log in'

    click_on 'Nova lista de tarefas'

    fill_in 'task_list_title', with: 'Processo Seletivo AutoSeg'
    find("#task_list_status_open").click
    fill_in 'task_list_tasks_attributes_0_title', with: "Entrevista"


    ['Teste de programação', 'Pair Programming', 'Contratação'].each do |task|
      click_on 'Adicionar tarefa'

      within all('.task').last do
        find('.form-control').set task
      end
    end

    click_on 'Criar lista de tarefas'

    visit '/'

    find(".favorited_task_list-box").click

    click_on 'Favoritos'

    expect(page).to have_content 'Processo Seletivo AutoSeg'
  end
end
