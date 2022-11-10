require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task, user: @user)
    @label = FactoryBot.create(:label)
    visit new_session_path
    fill_in 'session[email]', with: 'aiueo@example.com'
    fill_in 'session[password]', with: '123456'
    click_on 'Log in'
  end

  describe 'ラベル管理' do
    context 'ラベルを作成' do
      it "ラベルが作成できる" do
        visit new_label_path
        fill_in 'label[name]', with: '運動'
        click_on '登録する'
        expect(page).to have_content '運動'
      end
    end
  end
end