FactoryBot.define do
  factory :task do
    title { 'abcde' }
    content { '小文字のABCDE' }
    deadline { '2022-11-11' }
    status { '未着手' }
  end

  factory :second_task, class: Task do
    title { 'アイウエオ' }
    content { 'カタカナのあいうえお' }
    deadline { '2022-11-11' }
    status { '未着手' }
  end
end
