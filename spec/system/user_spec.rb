require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能・管理画面テスト', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザ登録がなくログインしていない場合' do
      it 'ユーザ新規登録のテスト' do
        visit new_user_path
        fill_in 'user[name]', with: 'aiueo'
        fill_in 'user[email]', with: 'aiu@gmail.com'
        fill_in 'user[password]', with: '1234567'
        fill_in 'user[password_confirmation]', with: '1234567'
        click_on '登録'
        expect(page).to have_content 'aiueo'
      end
      it '​ログインしていない時はログイン画面に飛ぶテスト​' do
        visit tasks_path
        expect(current_path).to eq new_session_path
      end
    end
  end
end