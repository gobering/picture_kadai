require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  describe '新規作成機能' do
    before do
      FactoryBot.create(:task, title: "task")
      FactoryBot.create(:second_task, title: "sample")
    end
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit tasks_path
        expect(page).to have_content '小文字のABCDE'
      end
    end
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        fill_in 'task[title]', with: 'ta'
        click_on '検索'
        expect(page).to have_content 'task'
      end
    end
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        visit tasks_path
        select '未着手', from: "task[status]"
        click_on '検索'
        expect(page).to have_content '未着手'
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        visit tasks_path
        fill_in 'task[title]', with: 'task'
        select '未着手', from: "task[status]"
        click_on '検索'
        expect(page).to have_content 'task'
        expect(page).to have_content '未着手'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task)
        visit tasks_path
        expect(page).to have_content '小文字のABCDE'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        task = FactoryBot.create(:task)
        visit tasks_path
        task_list = all('.task_row') 
        expect(page).to have_content '小文字のABCDE' 
      end
    end
    context 'タスクが終了期限の降順に並んでいる場合' do
      it '終了期限が近いタスクが一番上に表示される' do
        task = FactoryBot.create(:task)
        visit tasks_path
        click_on '終了期限でソートする'
        task_list = all('.task_list_2') 
        expect(task_list[0]).to have_content '2022-11-11' 
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        task = FactoryBot.create(:task)
        visit tasks_path(task)
        expect(page).to have_content '小文字のABCDE'
       end
     end
  end
end