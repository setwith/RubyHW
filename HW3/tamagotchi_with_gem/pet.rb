class Pet
  attr_reader :health, :happiness, :stuff_in_belly, :workout, :check_energy
  attr_accessor :name

  PHRASES = [
    'А ти знав, що на нашій шкірі може жити більше живих організмів, ніж людей на всій планеті?',
    'А ти знав, що три найбагатші родини у світі мають більше активів, ніж 48 найбідніших країн?',
    'А ти знав, що кубик Рубіка – товар, який найбільше продається у світі. На другому місці – iPhone?',
    'А ти знав, що чотирирічна дитина в середньому ставить 400 запитань на день?',
    'А ти знав, що на шоломах астронавтів є спеціальний пристрій, щоб чухати носа?',
    'А ти знав, що якби до Coca-Cola не додавали барвник, вона була б зеленого кольору?'
  ]

  def initialize(name)
    @name = name.capitalize
    @health = 20
    @happiness = 20
    @stuff_in_belly = 20
    @asleep = false
    @workout = 20
    @energy = 20

    puts "Хей, мене звати #{@name}, і тепер я планую любити тебе та проводити багато часу разом. Давай пошвидше знайдемо заняття для нас!)"
  end

  def feed
    puts "Ви годуєте #{@name}. Йой, так їсть, аж за вухами лящить."
    @stuff_in_belly = 10
    @energy += 3
    pass_time
    info
  end

  def walk
    puts "Хороша ідея була прогулятись. #{@name} махає своїм хвостом та обнюхує кожного зустрічного :)"
    @happiness += 4
    @energy -= 1
    @stuff_in_belly -= 1
    pass_time
    info
  end

  def put_to_bed
    puts "І все ж таки, який гарний #{@name}, коли спить... І мовчить :D"
    @asleep = true
    @energy += 10
    @health += 5
    puts "#{@name} солодко хропить"
    3.times do
      puts 'Hzz..'
    end
    puts "#{@name} повільно прокидається"
    @asleep = false
    pass_time
    info
  end

  def toss
    puts "Ти підкидаєш #{@name} в повітря. Його улюблене дозвілля, звісно, не враховуючи коли ти йому чухаєш спинку"
    @happiness += 3
    pass_time
    info
  end

  def gym
    puts "От цю вправу роби - спина боліти не буде. Техніці #{@name} позаздрив би сам Арнольд!"
    @workout += 10
    @energy -= 2
    @happiness += 2
    pass_time
    info
  end

  def talk
    puts "#{PHRASES.sample} 'Так, знаю, міг би поступити в Гарвард :D"
    pass_time
    info
  end

  def hug
    puts "Ви обіймаєте #{@name}. Ну шо за краса?)"
    @happiness += 3
    pass_time
    info
  end

  def wash
    puts "Хороше рішення було - помити #{@name}. Тепер пахне так, що і сусіди позбігаються , як дівчата в рекламі AXE!"
    @health += 3
    pass_time
    info
  end

  def treat
    puts 'Дякую тобі. Я думав, шо вже всьо... Фініта ля комедія'
    @health += 10
    pass_time
  end

  def watch
    @happiness -= rand(3)
    @stuff_in_belly -= rand(3)
    @workout -= rand(3)
    @energy -= rand(3)
    pass_time
    info
  end

  def info
    puts '________________'
    puts "здоров'я = #{@health}"
    puts "рівень щастя = #{@happiness}"
    puts "відчуття ситості = #{@stuff_in_belly}"
    puts "тренування = #{@workout}"
    puts "енергія = #{@energy}"
  end

  def control
    puts 'Натисніть 1, щоб годувати'
    puts 'Натисніть 2, щоб вивести на прогулянку'
    puts 'Натисніть 3, щоб вкласти спати'
    puts 'Натисніть 4, щоб підкинути'
    puts 'Натисніть 5, щоб відвести в зал'
    puts 'Натисніть 6, щоб поговорити'
    puts 'Натисніть 7, щоб обійняти'
    puts 'Натисніть 8, щоб помити'
    puts 'Натисніть 9, щоб лікувати'
    puts "Натисніть 10, щоб спостерігати за #{@name}"
    puts 'Натисніть 11, щоб подивитись всі команди'
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

    GetHtml.get(content, bypass_html: true)
    @emoji = if @health < 5
               '&#128567;'
             elsif @happiness < 5
               '&#128511;'
             elsif @stuff_in_belly < 5
               '&#128528;'
             elsif @workout < 5
               '&#128565;'
             elsif @energy < 5
               '&#128128;'
             end
  end

  # TODO: style
  def content
    <<~HTML
      <p>здоров'я = #{@health} &#128567;</p>
      <p>рівень щастя = #{@happiness} &#128123;</p>
      <p>відчуття ситості = #{@stuff_in_belly} &#129316;</p>
      <p>тренування = #{@workout} &#128170;</p>
      <p>енергія = #{@energy} &#128165;</p>
      <span style=font-size:100px>#{@emoji}</span>
    HTML
  end

  def check_health
    if @health <= 5 && @health >= 3
      puts '________________'
      puts "#{@name} захворів. Його терміново потрібно лікувати, покупати або вкласти спати. Як кажуть \'сон лікує\'"
    elsif @health <= 2 && @health >= 1
      puts '________________'
      puts "#{@name} на межі. Швидше біжи лікувати!"
    elsif @health == 0
      puts '________________'
      puts "#{@name} всьо... А славний був малий :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
      exit
    end
  end

  def check_happiness
    if @happiness <= 10
      puts '________________'
      puts "#{@name} нудиться. Потрібно чимось зайняти його!"
    elsif @happiness == 0
      puts '________________'
      puts "#{@name} всьо... І то все від нульги :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
      exit
    end
  end

  def check_stuff_in_belly
    if @stuff_in_belly <= 10 && @stuff_in_belly >= 8
      puts '________________'
      puts "#{@name} зголоднів. Покорми свого улюбленця"
    elsif @stuff_in_belly <= 7 && @stuff_in_belly >= 1
      puts '________________'
      puts "#{@name} на межі. Не гай ні секунди покорми свого улюбленця!"
    elsif @stuff_in_belly == 0
      puts '________________'
      puts 'Всьо... Тебе захавали. От шо трапляється, коли не кормити своїх улюбленців.'
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
      exit
    end
  end

  def check_workout
    if @workout <= 10 && @workout >= 1
      puts '________________'
      puts "#{@name} хоче тренуватись. Активність - його все, проведи його до залу для тренування."
    elsif @workout == 0
      puts '________________'
      puts "#{@name} пішов до іншого. До того, хто буде займатись з ним спортами!"
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб ніхто не втік.'
      exit
    end
  end

  def check_energy
    if @energy <= 10 && @energy >= 8
      puts '________________'
      puts "#{@name} стомився. Йому необхіден сон, уклади його спати."
    elsif @energy <= 7 && @energy >= 1
      puts '________________'
      puts "#{@name} вирубається на ходу. Йому необхідена енергія, уклади його спати."
    elsif @energy == 0
      puts '________________'
      puts "#{@name} всьо... Сіли батарейки :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
      exit
    end
  end
end
