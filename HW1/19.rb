p 'Дан целочисленный массив. Найти максимальный из его локальных максимумов.'
p 'm = []'
p '(1..arr.length - 2).each do |i|'
p   'm << arr[i] if arr[i - 1] < arr[i] && arr[i] > arr[i + 1]'
p 'end'
p 'puts m.max'
 