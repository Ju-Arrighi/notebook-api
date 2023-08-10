require 'faker'

namespace :dev do
  desc "Configure development setup"
  task setup: :environment do
    puts 'Creating kinds...'
    kinds = %w[Friend Work Family]
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts 'Kinds created successfuly'
    ##################################
    puts 'Creating Contacts'
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 50.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts 'Contacts created successfuly'
    #################################
    puts 'Creating phones'
    Contact.all.each do |contact|
      Random.rand(5).times do
        phone = contact.phones.create!(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
        # binding.break
      end
    end
    puts 'Phones created successfuly'
  end
end
