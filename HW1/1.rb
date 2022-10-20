p 'Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.'
p 'arr.select.each_with_index { |e, i| p e if i.even? } + arr.select.each_with_index { |e, i| p e if i.odd? }'
