FactoryBot.define do
  factory :task do
    title { 'abcde' }
    content { '小文字のABCDE' }
  end

  factory :second_task, class: Task do
    title { 'アイウエオ' }
    content { 'カタカナのあいうえお' }
  end
end
