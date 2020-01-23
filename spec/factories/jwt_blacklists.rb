FactoryBot.define do
  factory :jwt_blacklist do
    jti { "MyString" }
    exp { "2020-01-16 17:09:59" }
  end
end
