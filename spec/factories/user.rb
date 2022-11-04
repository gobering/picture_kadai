FactoryBot.define do
  factory :user do
    name { 'アイウエオ' }
    email { 'aiueo@example.com' } 
    password { '123456' }
    admin { false }
  end

  factory :second_user, class: User do
    name { 'かきくけこ' }
    email { 'kaiueo@example.com' }
    password { '111111' }
    admin { true}
  end
end