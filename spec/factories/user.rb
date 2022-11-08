FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'アイウエオ' }
    email { 'aiueo@example.com' } 
    password { '123456' }
    admin { true }
  end

  factory :second_user, class: User do
    id { 2 }
    name { 'かきくけこ' }
    email { 'kaiueo@example.com' }
    password { '111111' }
    admin { false }
  end
end