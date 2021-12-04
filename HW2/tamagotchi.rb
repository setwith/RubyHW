class Pet
  def initialize(name)
    @name = name
    @asleep = false
    @health = 100
    @happyness = 100
    @stuffInBelly = 100
    @enegry = 100
    @workout = 100
    @party = 100

    puts @name + ' появился на свет и готов жить жизнь вместе с тобой!'
  end

  def play
    puts 'Вы играети с ' + @name + '. Какова милота ^_^'
    @happyness += 10
    passageOfTime
  end

  def eat
    puts 'Не то чтобы по вкусу вкусно, но по сути вкусно. Спасибо :)'
    @stuffInBelly += 10
    passageOfTime
  end

  def fit
    puts 'Вот это упражнение делай - спина не будет болеть. Технике' + @name + 'позавидовал бы сам Сталоне'
    @workout += 10
    @enegry -= 20
    passageOfTime
  end

  def adventure
    puts @name + ' на тусе... И он щаслив... Очень щаслив :3'
    @party += 10
    @happyness += 10
    passageOfTime
  end

  def talk
    puts 'Хмм.. а ты знал, что только утки умеют крякать: самцы этой способности лишены?'
  end

  def bath
    puts 'И все же быть чистым намного круче'
    @health += 10
    passageOfTime
  end

  def toss
    puts 'Вы подбрасываете ' + @name + ' в воздух.'
    @happyness += 10
    passageOfTime
  end

  def put_to_bed
    puts 'Вы укладываете ' + @name + ' спать.'
    @asleep = true
    @health += 20
  end

  def wake_up
    puts @name + ' проснулся и сладко зевает.'
    @asleep = false
  end

  def watch
    passageOfTime
  end

  def info
    puts 'health - ' + @health.to_s
    puts 'happyness -  ' + @happyness.to_s
    puts 'stuffInBelly - ' + @stuffInBelly.to_s
    puts 'energy - ' + @enegry.to_s
    puts 'workout - ' + @workout.to_s
    puts 'party - ' + @party.to_s
  end

  def comntrol
    puts 'Нажмите 1 чтобы поиграть'
    puts 'Нажмите 2 чтобынакормить'
    puts 'Нажмите 3 чтобы уложить спать'
    puts 'Нажмите 4 чтобы пустить в спортзал'
    puts 'Нажмите 5 чтобы пустить на тусовку'
    puts 'Нажмите 6 чтобы побеседовать'
    puts 'Нажмите 7 чтобы покупать'
    puts 'Нажмите 8 чтобы подбросить'
    puts 'Нажмите 9 чтобы уложить спать'
    puts 'Нажмите 10 чтобы разбудить'
    puts 'Нажмите на 11 чтобы оценить состояние своего питомца'
    puts 'Нажмите на 12 чтобы посмотреть на своего питомца (что-то может произойти)'
    puts 'Нажмите на 13 чтобы посмотреть все команды'
  end

  private

  def passageOfTime
    if @stuffInBelly > 0
      @stuffInBelly -= 5
      @health -= 5
      @happyness -= rand(5..10)
      @workout -= rand(5..10)
      @party -= rand(5..10)
    end

    hp_need
    happy_need
    move_need
    workout_need
    party_need
    party_need
    death
  end

  def hp_need
    puts 'Я вижу свет в конце тунеля. Так продолжать нельзя...' if @health <= 20
  end

  def happy_need
    puts 'Сумно, видчуваю нибы сумно :(' if @happyness <= 2
  end

  def move_need
    if @enegry < 100 && @enegry > 40
      puts 'Чуствую себя сильным и забавным! Отправь меня в спортзал или на вечеринку :)'
    elsif @enegry <= 20
      puts 'Наверное на сегодня хватит, Мне нужно поспать.'
    end
  end

  def workout_need
    puts 'Каждому нужны тренировки и мне тоже. Камон в спортзал!' if @workout <= 20
  end

  def party_need
    puts 'Самое время закатить вечеринку ;3' if @party <= 30
  end

  def death
    if @stuffInBelly == 0
      puts @name + ' ушел к другому. К тому, кто будет его кормить'
      exit
    elsif @health == 0
      puts @name + ' ушел и больше не вернеться :('
      exit
    elsif @enegry == 0
      puts @name + ' обезсилен уполз к другому'
      exit
    end
  end
end

puts 'Как назовем вашего питомца?'
name = gets.chomp
pet = Pet.new(name)

puts 'Нажмите 1 чтобы поиграть'
puts 'Нажмите 2 чтобы накормить'
puts 'Нажмите 3 чтобы уложить спать'
puts 'Нажмите 4 чтобы пустить в спортзал'
puts 'Нажмите 5 чтобы пустить на тусовку'
puts 'Нажмите 6 чтобы побеседовать'
puts 'Нажмите 7 чтобы покупать'
puts 'Нажмите 8 чтобы подбросить'
puts 'Нажмите 9 чтобы уложить спать'
puts 'Нажмите 10 чтобы разбудить'
puts 'Нажмите на 11 чтобы оценить состояние своего питомца'
puts 'Нажмите на 12 чтобы посмотреть на своего питомца (что-то может произойти)'
puts 'Нажмите на 13 чтобы посмотреть все команды'

command = gets.chomp
until command == 'exit'
  case command
  when '1'
    pet.play
  when '2'
    pet.eat
  when '3'
    pet.sleep
  when '4'
    pet.fit
  when '5'
    pet.adventure
  when '6'
    pet.talk
  when '7'
    pet.bath
  when '8'
    pet.toss
  when '9'
    pet.put_to_bed
  when '10'
    pet.wake_up
  when '11'
    pet.info
  when '12'
    pet.watch
  when '13'
    pet.comntrol
  else
    puts 'Выберите команду от 1 до 13. Нажмите 13, чтобы посмотреть возможные команды'
  end
  command = gets.chomp
end
