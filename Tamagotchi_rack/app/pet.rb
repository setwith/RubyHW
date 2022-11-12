class Pet
  attr_reader :name, :health, :happiness, :stuff_in_belly, :workout, :energy, :text, :status

  def initialize(name)
    @name = name.capitalize
    @health = 20
    @happiness = 20
    @stuff_in_belly = 20
    @asleep = false
    @workout = 20
    @energy = 20
  end

  def feed
    @text = "Ви годуєте #{@name}. Йой, так їсть, аж за вухами лящить."
    @stuff_in_belly = 20
    @energy += 3
    pass_time
  end

  def walk
    @text = "Хороша ідея була прогулятись. #{@name} махає своїм хвостом та обнюхує кожного зустрічного :)"
    @happiness += 4
    @energy -= 1
    @stuff_in_belly -= 1
    pass_time
  end

  def put_to_bed
    @text = "І все ж таки, який гарний #{@name}, коли спить... І мовчить :D"
    @asleep = true
    @energy += 10
    @health += 5
    @asleep = false
    pass_time
  end

  def toss
    @text = "Ти підкидаєш #{@name} в повітря. Його улюблене дозвілля, звісно, не враховуючи коли ти йому чухаєш спинку"
    @happiness += 3
    pass_time
  end

  def gym
    @text = "От цю вправу роби - спина боліти не буде. Техніці #{@name} позаздрив би сам Арнольд!"
    @workout += 10
    @energy -= 2
    @happiness += 2
    pass_time
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
    @text = "#{phrases.sample} Так, знаю, міг би поступити в Гарвард :D"
    pass_time
  end

  def hug
    @text = "Ти обіймаєте #{@name}. Ну шо за краса?)"
    @happiness += 3
    pass_time
  end

  def wash
    @text = "Хороше рішення було - помити #{@name}. Тепер пахне так, що і сусіди позбігаються , як дівчата в рекламі AXE!"
    @health += 3
    pass_time
  end

  def treat
    @text = 'Дякую тобі. Я думав, шо вже всьо... Фініта ля комедія'
    @health += 10
    pass_time
  end

  def watch
    @text = "Ти спостерігаєш за #{@name}. А він за тобою. Але не забувай спостерігати за показниками свого улюбленця."
    @happiness -= rand(3)
    @stuff_in_belly -= rand(3)
    @workout -= rand(3)
    @energy -= rand(3)
    pass_time
  end

  private

  def pass_time
    @health -= 1
    check_health
    @happiness -= 1
    check_happiness
    @stuff_in_belly -= 1
    check_stuff_in_belly
    @workout -= 1
    check_workout
    @energy -= 1
    check_energy
  end

  def check_health
    if @health <= 5 && @health >= 3
      @status = "#{@name} захворів. Його терміново потрібно лікувати, покупати або вкласти спати. Як кажуть \'сон лікує\'"
    elsif @health <= 2 && @health >= 1
      @status = "#{@name} на межі. Швидше біжи лікувати!"
    elsif @health <= 0
      @status = "#{@name} всьо... А славний був малий :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
    end
  end

  def check_happiness
    if @happiness <= 10
      @status = "#{@name} нудиться. Потрібно чимось зайняти його!"
    elsif @happiness <= 0
      @status = "#{@name} всьо... І то все від нульги :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
    end
  end

  def check_stuff_in_belly
    if @stuff_in_belly <= 10 && @stuff_in_belly >= 8
      @status = "#{@name} зголоднів. Покорми свого улюбленця"
    elsif @stuff_in_belly <= 7 && @stuff_in_belly >= 1
      @status = "#{@name} на межі. Не гай ні секунди покорми свого улюбленця!"
    elsif @stuff_in_belly <= 0
      puts 'Всьо... Тебе захавали. От шо трапляється, коли не кормити своїх улюбленців.'
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
    end
  end

  def check_workout
    if @workout <= 10 && @workout >= 1
      @status = "#{@name} хоче тренуватись. Активність - його все, проведи його до залу для тренування."
    elsif @workout <= 0
      @status = "#{@name} пішов до іншого. До того, хто буде займатись з ним спортами!"
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб ніхто не втік.'
    end
  end

  def check_energy
    if @energy <= 10 && @energy >= 8
      @status = "#{@name} стомився. Йому необхіден сон, уклади його спати."
    elsif @energy <= 7 && @energy >= 1
      @status = "#{@name} вирубається на ходу. Йому необхідена енергія, уклади його спати."
    elsif @energy <= 0
      @status = "#{@name} всьо... Сіли батарейки :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
    end
  end
end
