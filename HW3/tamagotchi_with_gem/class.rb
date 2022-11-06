require 'bundler'
Bundler.require

class Pet
  def initialize(name)
    @name = name.capitalize
    @health = 20
    @happyness = 20
    @stuff_in_belly = 20
    @asllep = false
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
    @happyness += 4
    @energy -= 1
    @stuff_in_belly -= 1
    pass_time
    info
  end

  def put_to_bed
    puts "І все ж таки, який гарний #{@name}, коли спить... І мовчить :D"
    @asllep = true
    @energy += 10
    @health += 5
    puts "#{@name} солодко хропить"
    3.times do
      puts 'Hzz..'
    end
    puts "#{@name} повільно прокидається"
    @asllep = false
    pass_time
    info
  end

  def toss
    puts "Ти підкидаєш #{@name} в повітря. Його улюблене дозвілля, звісно, не враховуючи коли ти йому чухаєш спинку"
    @happyness += 3
    pass_time
    info
  end

  def gym
    puts "От цю вправу роби - спина боліти не буде. Техніці #{@name} позаздрив би сам Арнольд!"
    @workout += 10
    @energy -= 2
    @happyness += 2
    pass_time
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
    pass_time
    info
  end

  def hug
    puts "Ви обіймаєте #{@name}. Ну шо за краса?)"
    @happyness += 3
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
    @happyness -= rand(3)
    @stuff_in_belly -= rand(3)
    @workout -= rand(3)
    @energy -= rand(3)
    pass_time
    info
  end

  def info
    puts '________________'
    puts "здоров\'я = #{@health}"
    puts "рівень щастя = #{@happyness}"
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
    @happyness -= 1
    check_happyness
    @stuff_in_belly -= 1
    check_stuff_in_belly
    @workout -= 1
    check_worckout
    @energy -= 1
    check_energy

    GetHtml.get(content, bypass_html: true)
    @emoji = '&#128567;' if @health < 5
    @emoji = '&#128511;' if @happyness < 5
    @emoji = '&#128528;' if @stuff_in_belly < 5
    @emoji = '&#128565;' if @workout < 5
    @emoji = '&#128128;' if @energy < 5
  end

  # TODO: style
  def content
    <<~HTML
      <p>здоров'я = #{@health} &#128567;</p>
      <p>рівень щастя = #{@happyness} &#128123;</p>
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
    elsif @health.zero?
      puts '________________'
      puts "#{@name} всьо... А славний був малий :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
      exit
    end
  end

  def check_happyness
    if @happyness <= 10
      puts '________________'
      puts "#{@name} нудиться. Потрібно чимось зайняти його!"
    elsif @happyness.zero?
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
    elsif @stuff_in_belly.zero?
      puts '________________'
      puts 'Всьо... Тебе захавали. От шо трапляється, коли не кормити своїх улюбленців.'
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
      exit
    end
  end

  def check_worckout
    if @workout <= 10 && @workout >= 1
      puts '________________'
      puts "#{@name} хоче тренуватись. Активність - його все, проведи його до залу для тренування."
    elsif @workout.zero?
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
    elsif @energy.zero?
      puts '________________'
      puts "#{@name} всьо... Сіли батарейки :("
      puts 'Спробуй зіграти ще раз. Але постарайся, щоб всі вціліли'
      exit
    end
  end
end
