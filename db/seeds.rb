# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |project|
  Project.create!(
    name: "Project Seed #{project}",
    description: "If everything I did failed - which it doesn't, it actually succeeds - just the fact that I'm willing to fail is an inspiration. People are so scared to lose that they don't even try. Like, one thing people can't say is that I'm not trying, and I'm not trying my hardest, and I'm not trying to do the best way I know how."
  )
end

puts '----- Seeded 10 Projects ------'

10.times do |site|
  Site.create!(
    name: "Site First Project - #{site}",
    description: "I always felt like I could do anything. That’s the main thing people are controlled by! Thoughts- their perception of themselves! They're slowed down by their perception of themselves. If you're taught you can’t do anything, you won’t do anything. I was taught I could do everything.",
    image: 'https://via.placeholder.com/400x300',
    latitude: 44 * rand(0.95..1.05),
    longitude: -120 * rand(0.95..1.05),
    project_id: Project.first.id
  )
end

puts '----- Seeded First Sites ------'

10.times do |site|
  Site.create!(
    name: "Site Last Project - #{site}",
    description: 'There’s nothing I really wanted to do in life that I wasn’t able to get good at. That’s my skill. I’m not really specifically talented at anything except for the ability to learn. That’s what I do. That’s what I’m here for. Don’t be afraid to be wrong because you can’t learn anything from a compliment.',
    image: 'https://via.placeholder.com/400x300',
    latitude: 44 * rand(0.95..1.05),
    longitude: -120 * rand(0.95..1.05),
    project_id: Project.last.id
  )
end

puts '----- Seeded Last Sites ------'

Type.create!(
  model: 'Tid Bit V2',
  brand: 'Onset',
  image: 'https://via.placeholder.com/100x100',
  url: 'https://www.onsetcomp.com/products/data-loggers/utbi-001?creative=294992075720&keyword=%2Btidbit%20%2Blogger&matchtype=b&network=g&device=c&gclid=EAIaIQobChMI0pbepMjj6QIVhRx9Ch2spQoJEAAYASAAEgIEO_D_BwE'
)

Type.create!(
  model: 'Penant MX',
  brand: 'Onset',
  image: 'https://via.placeholder.com/100x100',
  url: 'https://www.onsetcomp.com/products/data-loggers/mx2201/'
)

puts '----- Seeded Logger Types ------'

5.times do |unit|
  Unit.create!(
    serial: "First Type - #{unit}",
    status: 'Active',
    type_id: Type.first.id
  )
end

5.times do |unit|
  Unit.create!(
    serial: "Last Type - #{unit}",
    status: 'Active',
    type_id: Type.last.id
  )
end

puts '----- Seeded Units ------'

3.times do |deployment|
  Deployment.create!(
    deploy_notes: 'First site notes',
    deploy_date: Date.today,
    deploy_time: Time.now,
    retrieve_status: 'OK',
    retrieve_notes: 'These are the retrieve notes',
    retrieve_date: Date.today + 90 + deployment,
    retrieve_time: Time.now,
    site_id: Site.first.id,
    unit_id: Unit.first.id
  )
end

3.times do |deployment|
  Deployment.create!(
    deploy_notes: 'Second site notes',
    deploy_date: Date.today,
    deploy_time: Time.now,
    retrieve_status: 'DRY',
    retrieve_notes: 'These are the retrieve notes',
    retrieve_date: Date.today + 90 + deployment,
    retrieve_time: Time.now,
    site_id: Site.last.id,
    unit_id: Unit.last.id
  )
end

puts '----- Seeded Deployments ------'

1000.times do |measurement|
  Measurement.create!(
    temperature: rand(1.1..21.3),
    moment: Time.now + measurement.hours,
    deployment_id: Deployment.first.id
  )
end

puts '----- Seeded Measurements ------'
