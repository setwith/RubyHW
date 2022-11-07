require_relative 'pet'
require 'html_ina'

puts 'Вітаю тебе в Тамагочі написаному на Ruby ;)'
puts 'Як назвемо твого улюбленця?'
name = gets.chomp
pet = Pet.new(name)

pet.control

command = gets.chomp
until command == 'exit'
  case command
  when '1'
    pet.feed
  when '2'
    pet.walk
  when '3'
    pet.put_to_bed
  when '4'
    pet.toss
  when '5'
    pet.gym
  when '6'
    pet.talk
  when '7'
    pet.hug
  when '8'
    pet.wash
  when '9'
    pet.treat
  when '10'
    pet.watch
  when '11'
    pet.control
  else
    puts 'Обери команду від 1 до 11. Натисни 11, щоб ще раз переглянути список команд.'
    puts 'Щоб вийти введіть \'exit\''
  end
  command = gets.chomp
end
