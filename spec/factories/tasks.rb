FactoryBot.define do
  factory :task do
    title { 'abcde' }
    content { '小文字のABCDE' }
    deadline { '2022/11/11' }
    status { '未着手' }
    priority { '高' }
  end

  factory :second_task, class: Task do
    title { 'アイウエオ' }
    content { 'カタカナのあいうえお' }
    deadline { '2022/10/10' }
    status { '完了' }
    priority { '低' }
  end
end
