# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
	city = City.create!(name: Faker::LeagueOfLegends.location)
end

10.times do
	doctor = Doctor.create!(first_name: Faker::LordOfTheRings.character, last_name: Faker::DrWho.the_doctor, postal_code: Faker::Number.number(5), city_id: rand(City.first.id..City.last.id))
end

5.times do
	specialty = Specialty.create!(name: Faker::Job.field)
end

15.times do
	patient = Patient.create!(first_name: Faker::OnePiece.character, last_name: Faker::Cannabis.strain, city_id: rand(City.first.id..City.last.id))
end

25.times do
	appointment = Appointment.create!(doctor_id: rand(Doctor.first.id..Doctor.last.id), patient_id: rand(Patient.first.id..Patient.last.id), date: Faker::Date.forward(99), city_id: rand(City.first.id..City.last.id))
end

25.times do
	join_table_doctor_specialty = JoinTableDoctorSpecialty.create!(doctor_id: rand(Doctor.first.id..Doctor.last.id), specialty_id: rand(Specialty.first.id..Specialty.last.id))
end