require 'faker'

namespace :dev do
  desc "Configure development setup"
  task setup: :environment do
    100.times do |i|
      Contact.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 50.years.ago, to: 18.years.ago))
    end
  end
end
