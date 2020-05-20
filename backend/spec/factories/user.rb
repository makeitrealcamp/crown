FactoryBot.define do
  factory :user do
    name       { Faker::TvShows::Simpsons.character.gsub(/\W/, '') }
    last_name  { Faker::TvShows::Simpsons.character.gsub(/\W/, '') }
    username   { Faker::TvShows::Simpsons.character.gsub(/\W/, '') }
    email      { Faker::Internet.email(separators: %w(_ -)) }
    password   { Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) } #=> "*%NkOnJsH4"
    admin      { false }
  end
end
