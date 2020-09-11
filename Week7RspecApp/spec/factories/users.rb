FactoryBot.define do
  # this user is not banana-able - it needs to correspond to a model name
  factory :user do
    username { Faker::Coffee.blend_name }
    password { "password" }
  end
end