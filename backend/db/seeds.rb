# Clean up existing records
Incident.destroy_all
User.destroy_all

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

# Incidents
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

# Users
# Create 5 users: one admin, two validators, one hospital, one city hall and three
# regular users.

def create_user(params)
  attributes = params.merge(
    status: "active",
    password: "crown-tracker",
    password_confirmation: "crown-tracker"
  )

  User.create!(attributes)
end

# Create `admin` user
create_user(name: "Marco", last_name: "Polo", email: "marco-polo@crown.com", username: "marco-polo", admin: true)
# Create `validator` user
create_user(name: "Carlos", last_name: "Torres", email: "carlos-torres@crown.com", username: "carlos-torres", validator: true)
# Create `validator` user
create_user(name: "Andres", last_name: "Lopez", email: "andres-lopez@crown.com", username: "andres-lopez", validator: true)
# Create `organization` user
create_user(name: "Hospital Pablo Tobón Uribe", email: "hospital@crown.com", username: "hospital", organization: true)
# Create `organization` user
create_user(name: "Alcaldía de Medellín", email: "city-hall@crown.com", username: "city_hall", organization: true)
# Create `regular` user
create_user(name: "Pedro", last_name: "Perez", email: "pedro-perez@crown.com", username: "pedro-perez")
# Create `regular` user
create_user(name: "Pablo", last_name: "Castro", email: "pablo-castro@crown.com", username: "pablo-castro")
# Create `regular` user
create_user(name: "Cristina", last_name: "Palacios", email: "cristina-palacios@crown.com", username: "cristina-palacios")
