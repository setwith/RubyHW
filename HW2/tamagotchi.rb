class Pet

  def initialize name
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
    puts 'Вы играети с '+@name + '. Какова милота ^_^'
    @happyness += 10
    @energy -= 10
    passageOfTime
  end

  def eat
    puts 'Не то чтобы по вкусу вкусно, но по сути вкусно. Спасибо :)'
    @stuffInBelly  += 10
    passageOfTime
  end

  def sleep
    puts 'Немножко вздримну и снова будем покорять мир!'
    @enegry += 30
    @health += 10
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

  def info
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
  end

  private

  def passageOfTime
    if @stuffInBelly > 0
      @stuffInBelly -= 5
      @energy += 5
    elsif @asleep
      @asleep = false
      @stuffInBelly -= 5
    end
  end

  def hp_need
    if @health <= 20
      puts 'Я вижу свет в конце тунеля. Так продолжать нельзя...'
    end
  end

  def happy_need
    if @happyness <= 2
      puts 'Сумно, видчуваю нибы сумно :('
    end
  end

  def move_need
    if @enegry < 100 && @enegry > 40
      puts 'Чуствую себя сильным и забавным! Отправь меня в спортзал или на вечеринку :)'
    else
      if @enegry <= 20
        puts 'Наверное на сегодня хватит, Мне нужно поспать.'
    end
  end

  def workout_need
    if @workout <= 20
      puts 'Каждому нужны тренировки и мне тоже. Камон в спортзал!'
    end
  end

  def party_need
    if @party <= 30
      puts 'Самое время закатить вечеринку ;3'
    end
  end

  def death
    if @stuffInBelly == 0
      puts @name + ' ушел к другому. К тому, кто будет его кормить'
    elsif @health == 0
      puts @name + ' ушел и больше не вернеться :('
    elsif @enegry == 0
      puts @name + ' обезсилен уполз к другому'
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
puts 'Нажмите 11 чтобы посмотреть команды'

command = gets.chomp
until command == 'exit' do
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
  else
    puts 'Выберите команду от 1 до 11. Нажмите 11, чтобы посмотреть возможные команды'
  end
  command = gets.chomp
end
end
