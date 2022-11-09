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

  describe 'session機能テスト' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:second_user)
      visit new_session_path
      fill_in 'session[email]', with: 'aiueo@example.com'
      fill_in 'session[password]', with: '123456'
      click_on 'Log in'
    end
    context "ログインしていない状態でユーザデータがある場合" do
      it '自分の詳細画面に飛べること' do
        expect(page).to have_content 'ページ'
      end
    end
    context 'ユーザーが他人の詳細画面に飛ぼうとする' do
      it 'タスク一覧画面に遷移する' do
        click_on "タスク一覧"
        visit user_path(@second_user.id)
        expect(page).to have_content 'タスク一覧'
      end
    end
    context 'ログアウトした場合' do
      it "ログイン画面に戻る" do
        visit user_path(@user.id)
        click_on "ログアウト"
        expect(page).to have_content "ログアウト"
      end
    end
  end

  describe '管理画面のテスト' do
    context "管理ユーザ作成" do
      it "管理者は管理画面にアクセスできること" do
        @user = FactoryBot.create(:user)
        visit new_session_path
        fill_in "session[email]", with: "aiueo@example.com"
        fill_in "session[password]", with: "123456"
        click_on "Log in"
        visit admin_users_path
        expect(page).to have_content "管理画面"
      end
    end
    context "一般ユーザーがログインしている場合" do
      it "一般ユーザーは管理画面にはアクセスできない" do
        @second_user = FactoryBot.create(:second_user)
        visit new_session_path
        fill_in "session[email]", with: "kaiueo@example.com"
        fill_in "session[password]", with: "111111"
        click_on "Log in"
        visit admin_users_path
        expect(page).to have_content "管理者以外はアクセスできない"
      end
    end

    context "管理者でログインしている場合" do
      before do
        @second_user = FactoryBot.create(:second_user)
        @user = FactoryBot.create(:user)
        visit new_session_path
        fill_in "session[email]", with: "aiueo@example.com"
        fill_in "session[password]", with: "123456"
        click_on "Log in"
        visit admin_users_path
      end
      it "管理者はユーザ新規登録ができる" do
        click_on "ユーザー新規作成"
        fill_in "user[name]", with: "aiaiai"
        fill_in "user[email]", with: "aiaiai@example.com"
        fill_in "user[password]", with: "1223344"
        fill_in "user[password_confirmation]", with: "1223344"
        click_on "登録"
        expect(page).to have_content "aiaiai@example.com"
      end
      it "管理者はユーザの詳細画面へ行ける" do
        visit admin_user_path(@user.id)
        expect(page).to have_content "userの詳細"
      end
      it "管理者ユーザーの編集画面からユーザーの編集ができる" do
        visit edit_admin_user_path(@user.id)
        fill_in 'user[name]', with: 'kaaaaaa'
        fill_in 'user[email]', with: 'aiaiuuu@example.com'
        fill_in 'user[password]', with: '123456'
        fill_in 'user[password_confirmation]', with: '123456'
        check 'user[admin]'
        click_button '登録'
        expect(page).to have_content "aiaiuuu@example.com"
      end
      it 'ユーザーの削除ができる' do
        visit admin_users_path
        click_on "削除", match: :first
        expect(page).to have_content 'ユーザー情報を消去しました'
      end  
    end
  end
end