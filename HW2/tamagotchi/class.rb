class Pet
  def initialize(name)
    @name = name
    @health = 20
    @happyness = 20
    @stuff_in_belly = 20
    @asllep = false
    @workout = 20
    @energy = 20

    puts "Хей, мене звати #{@name.capitalize}, і тепер я планую любити тебе та проводити багато часу разом. Давай пошвидше знайдемо заняття для нас!)"
  end

  def feed
    puts "Ви годуєте #{@name.capitalize}. Йой, так їсть, аж за вухами лящить."
    @stuff_in_belly = 10
    @energy += 3
    passageOfTime
    info
  end

  def walk
    puts "Хороша ідея була прогулятись. #{@name.capitalize} махає своїм хвостом та обнюхує кожного зустрічного :)"
    @happyness += 4
    @energy -= 1
    @stuff_in_belly -= 1
    passageOfTime
    info
  end

  def put_to_bed
    puts "І все ж таки, який гарний #{@name.capitalize}, коли спить... І мовчить :D"
    @asllep = true
    @energy += 10
    @health += 5
    puts "#{@name.capitalize} солодко хропить"
    3.times do
      puts 'Hzz..'
    end
    puts "#{@name.capitalize} повільно прокидається"
    @asllep = false
    passageOfTime
    info
  end

  def toss
    puts "Ти підкидаєш #{@name.capitalize} в повітря. Його улюблене дозвілля, звісно, не враховуючи коли ти йому чухаєш спинку"
    @happyness += 3
    passageOfTime
    info
  end

  def gym
    puts "От цю вправу роби - спина боліти не буде. Техніці #{@name.capitalize} позаздрив би сам Арнольд!"
    @workout += 10
    @energy -= 2
    @happyness += 2
    passageOfTime
    info
  end

  def talk
    phrases = [
      'А ти знав, що на нашій шкірі може жити більше живих організмів, ніж людей на всій планеті?',
      'А ти знав, що три найбагатші родини у світі мають більше активів, ніж 48 найбідніших країн?',
      'А ти знав, що кубик Рубіка – товар, який найбільше продається у світі. На другому місці – iPhone?',
      'А ти знав, що чотирирічна дитина в середньому ставить 400 запитань на день?',
      'А ти знав, що на шоломах астронавтів є спеціальний пристрій, щоб чухати носа?',
      'А ти знав, що якби до Coca-Cola не додавали барвник, вона була б зеленого кольору?'
    ]
    puts phrases.sample + 'Так, знаю, міг би поступити в Гарвард :D'
    passageOfTime
    info
  end

  def hug
    puts "Ви обіймаєте #{@name.capitalize}. Ну шо за краса?)"
    @happyness += 3
    passageOfTime
    info
  end

  def wash
    puts "Хороше рішення було - помити #{@name.capitalize}. Тепер пахне так, що і сусіди позбігаються , як дівчата в рекламі AXE!"
    @health += 3
    passageOfTime
    info
  end

  def treat
    puts 'Дякую тобі. Я думав, шо вже всьо... Фініта ля комедія'
    @health += 10
    passageOfTime
  end

  def watch
    @happyness -= rand(3)
    @stuff_in_belly -= rand(3)
    @workout -= rand(3)
    @energy -= rand(3)
    passageOfTime
    info
  end

  def info
    puts '________________'
    puts 'здоров\'я = ' + @health.to_s
    puts 'рівень щастя = ' + @happyness.to_s
    puts 'відчуття ситості = ' + @stuff_in_belly.to_s
    puts 'тренування = ' + @workout.to_s
    puts 'енергія = ' + @energy.to_s
  end

  private

  def passageOfTime
    @health -= 1
    check_health
    @happyness -= 1
    check_happyness
    @stuff_in_belly -= 1
    check_stuff_in_belly
    @workout -= 1
    check_worckout
    @energy -= 1
    check_energy
  end

  def check_health
    if @health <= 5 && @health >= 3
      puts '________________'
      puts "#{@name.capitalize} захворів. Його терміново потрібно лікувати, покупати або вкласти спати. Як кажуть \'сон лікує\'"
    elsif @health <= 2 && @health >= 1
      puts '________________'
      puts "#{@name.capitalize} на межі. Швидше біжи лікувати!"
    elsif @health == 0
      puts '________________'
      puts "#{@name.capitalize} всьо... А славний був малий :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
      exit
    end
  end

  def check_happyness
    if @happyness <= 10
      puts '________________'
      puts "#{@name.capitalize} нудиться. Потрібно чимось зайняти його!"
    elsif @happyness == 0
      puts '________________'
      puts "#{@name.capitalize} всьо... І то все від нульги :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
      exit
    end
  end

  def check_stuff_in_belly
    if @stuff_in_belly <= 10 && @stuff_in_belly >= 8
      puts '________________'
      puts "#{@name.capitalize} зголоднів. Покорми свого улюбленця"
    elsif @stuff_in_belly <= 7 && @stuff_in_belly >= 1
      puts '________________'
      puts "#{@name.capitalize} на межі. Не гай ні секунди покорми свого улюбленця!"
    elsif @stuff_in_belly == 0
      puts '________________'
      puts "#{@name.capitalize} всьо... Заморили голодом молодчика :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
      exit
    end
  end

  def check_worckout
    if @workout <= 10 && @workout >= 1
      puts '________________'
      puts "#{@name.capitalize} хоче тренуватись. Активність - його все, проведи його до залу для тренування."
    elsif @workout == 0
      puts '________________'
      puts "#{@name.capitalize} пішов до іншого. До того, хто буде займатись з ним спортами!"
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб ніхто не втік.'
      exit
    end
  end

  def check_energy
    if @energy <= 10 && @energy >= 8
      puts '________________'
      puts "#{@name.capitalize} стомився. Йому необхіден сон, уклади його спати."
    elsif @energy <= 7 && @energy >= 1
      puts '________________'
      puts "#{@name.capitalize} вирубається на ходу. Йому необхідена енергія, уклади його спати."
    elsif @energy == 0
      puts '________________'
      puts "#{@name.capitalize} всьо... Сіли батарейки :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
      exit
    end
  end
end
