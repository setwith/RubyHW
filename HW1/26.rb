p 'Дан целочисленный массив. Преобразовать его, вставив перед каждым отрицательным элементом нулевой элемент.'
p 'arr.map { |e| e.negative? ? [arr[0], e] : e }.flatten'