p 'Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять.'
p 'arr.map.with_index { |e, i| (i != 0 && i != -1) && e.even? ? e + arr[-1] : e }'
