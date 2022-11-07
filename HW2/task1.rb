arr = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202,
       574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]

p 'arr = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]'
p 'дізнатись кількість елементів в масиві;'
p arr.count

p 'перевернути масив;'
p arr.reverse

p 'знайти найбільше число;'
p arr.max

p 'знайти найменше число;'
p arr.min

p 'відсортувати від меншого до більшого;'
p arr.sort

p 'відсортувати від більшого до меншого;'
p arr.sort.reverse

p 'видалити всі непарні числа;'
p arr.delete_if { |element| element.odd? }

p 'залишити тільки ті числа, які без остачі ділятся на 3;'
p arr.select { |element| element % 3 == 0 }

p 'видалити з масиву числа, які повторюються (тобто, потрібно вивести масив, в якому немає повторень);'
p arr.uniq

p 'розділити кожен елемент на 10, в результаті елементи не мають бути округленими до цілого;'
p arr.map { |element| element / 10.to_f }

p 'отримати новий масив, який би містив в собі ті літери англійського алфавіту, порядковий номер яких є в нашому масиві;'
p arr.select { |element| element < 27 }.map { |element| (element + 65).chr }

p 'змінити місцями мінімальний і максимальний елементи масиву;'
arr[arr.index(arr.min)] = arr.max
arr[arr.index(arr.max)] = arr.min
p arr

p 'знайти елементи, які знаходяться перед мінімальним числом в масиві;'
p arr[0...arr.index(arr.min)]

p 'необхідно знайти три найменших елементи'
p arr.min(3)
