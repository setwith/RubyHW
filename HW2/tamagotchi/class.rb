class Pet
  attr_accessor :name
  attr_reader :health, :happyness, :stuff_in_belly, :asllep, :workout, :energy

  def initialize(name)
    @name = name
    @health = 10
    @happyness = 10
    @stuff_in_belly = 10
    @asllep = false
    @workout = 10
    @energy = 10

    puts "Хей, мене звати #{@name}, і тепер я планую любити тебе та проводити багато часу разом. Давай пошвидше знайдемо заняття для нас!)"
  end

  def feed
    puts "Ви годуєте #{@name}. Йой, так їсть, аж за вухами лящить."
    @stuff_in_belly = 10
    @energy += 1
    passageOfTime
  end

  def walk
    puts "Хороша ідея була прогулятись. #{@name} махає своїм хвостом та обнюхує кожного зустрічного :)"
    @happyness += 4 
    @energy -= 1
    @stuff_in_belly -= 1
    passageOfTime
  end
  
  def put_to_bed
    puts "І все ж таки, який гарний #{@name}, коли спить... І мовчить :D" 
    @asllep = true
    @energy = 10
    @health += 2
    passageOfTime
    puts "#{@name} солодко хропить"
    3.times do 
      puts 'Hzz..'
      end
    puts "#{@name} повільно прокидається"
    @asllep = false
  end
  
  def toss
    puts "Ти підкидаєш #{@name} в повітря. Його улюблене дозвілля, звісно, не враховуючи коли ти йому чухаєш спинку"
    @happyness += 2
    passageOfTime
  end

  def gym
    puts "От цю вправу роби - спина боліти не буде. Техніці #{@name} позаздрив би сам Арнольд!"
    @workout = 10
    @energy -= 2
    @stuff_in_belly = -2
    @happyness += 2
    passageOfTime
  end
  
  def talk
    phrases = [
      'А ти знав, що на нашій шкірі може жити більше живих організмів, ніж людей на всій планеті?'
      'А ти знав, що три найбагатші родини у світі мають більше активів, ніж 48 найбідніших країн?'
      'А ти знав, що кубик Рубіка – товар, який найбільше продається у світі. На другому місці – iPhone?'
      'А ти знав, що чотирирічна дитина в середньому ставить 400 запитань на день?'
      'А ти знав, що на шоломах астронавтів є спеціальний пристрій, щоб чухати носа?'
      'А ти знав, що якби до Coca-Cola не додавали барвник, вона була б зеленого кольору?'
    ]
    puts phrases.sample + 'Так, знаю, міг би поступити в Гарвард :D'
    @passageOfTime
  end
  
  def hug
    puts "Ви обіймаєте #{@name}. Ну шо за краса?)"
    @happyness += 1
    passageOfTime
  end
  
  def wash
    puts "Хороше рішення було - помити #{@name}. Тепер пахне так, що і сусіди позбігаються , як дівчата в рекламі AXE!"
    @health += 2
    passageOfTime
  end
  
  def watch
    @happyness -= rand(3)
    @stuff_in_belly -= rand(3)
    @workout -= rand(3)
    @energy -= rand(3)
    passageOfTime
  end
  
  def info
    puts '________________'
    puts 'здоров\'я = ' + @health
    puts 'рівень щастя = ' + @happyness
    puts 'відчуття ситості = ' + @stuff_in_belly
    puts 'тренування = ' + @workout
    puts 'енергія = ' + @energy
  end
  
  private 

  def passageOfTime
    
  end
  

end
