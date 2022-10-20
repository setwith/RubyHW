p 'Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами, а затем - четными.'
p 'arr.select.each_with_index { |e, i| p e if i.odd? } + arr.select.each_with_index { |e, i| p e if i.even? }'
