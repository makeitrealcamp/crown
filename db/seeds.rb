# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Incident.destroy_all

# Random set of real coordinates from Medellin - Antioquia
coordinates = [
  { latitude: 6.262362, longitude: -75.565826 },
  { latitude: 6.262970, longitude: -75.557296 },
  { latitude: 6.272952, longitude: -75.585106 },
  { latitude: 6.261349, longitude: -75.592187 },
  { latitude: 6.240317, longitude: -75.584934 },
  { latitude: 6.204225, longitude: -75.571587 },
  { latitude: 6.209088, longitude: -75.571029 },
  { latitude: 6.215189, longitude: -75.569914 },
  { latitude: 6.186434, longitude: -75.582359 },
  { latitude: 6.180503, longitude: -75.587509 }
]

coordinates.each do |c|
  incident = Incident.create!(
    latitude: c[:latitude],
    longitude: c[:longitude],
    address: "Carrera 76 #53 - 89",
    confirmed: [true, false].sample,
    status: Incident.statuses.values.sample,
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    age: rand(99),
    gender: Incident.genders.values.sample
  )
end
