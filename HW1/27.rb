p 'Дан целочисленный массив. Преобразовать его, вставив после каждого положительного элемента нулевой элемент.'
p 'arr.map { |e| e.positive? ? [e, arr[0]] : e }.flatten'