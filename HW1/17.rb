p 'Дан целочисленный массив. Найти количество его локальных максимумов.'
p 'b = 0'
p '(1..arr.length - 2).each do |i|'
p   'b += 1 if arr[i - 1] < arr[i] && arr[i] > arr[i + 1]'
p 'end'
p 'puts b'
  