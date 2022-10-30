require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(title: '', content: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task1 = Task.new(title: 'aiueo', content: '')
        expect(task1).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task2 = Task.new(title: 'aiueo', content: 'aiueo')
        expect(task2).to be_valid
      end
    end
  end
  describe 'タスクモデル機能', type: :model do
    describe '検索機能' do
      context 'scopeメソッドでタイトルのあいまい検索をした場合' do
        it "検索キーワードを含むタスクが絞り込まれる" do
          expect(Task.search_name('test')).to include(task)
          expect(Task.search_name('test')).not_to include(second_task)
          expect(Task.search_name('test').count).to eq 1
        end
      end
      context 'scopeメソッドでステータス検索をした場合' do
        it "ステータスに完全一致するタスクが絞り込まれる" do
          expect(Task.search_status('完了')).to include(task)
          expect(Task.search_status('完了')).not_to include(second_task)
          expect(Task.search_status('完了').count).to eq 1
        end
      end
      context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          expect(Task.search_name('test').search_status('完了')).to include(task)
          expect(Task.search_name('test').search_status('完了')).not_to include(second_task)
          expect(Task.search_name('test').search_status('完了').count).to eq 1
        end
      end
    end
end
