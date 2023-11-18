# Information systems tools
# These are samples from Lab 2

# import time
from tkinter import messagebox, Tk, Label, Button

# функция обработки нажатия
def clicked():
   lbl.configure(text='Кнопка была нажата',font=("Arial Bold", 30))

if __name__ == '__main__':
    print('Hello world', end='\n\n')

    a = 3
    print(type(a))
    a = 3.5
    print(type(a))
    a = 'qwerty'
    print(type(a))
    a = True
    print(type(a))
    a = '123'
    print(type(a), end='\n\n')

    print(3**39 - int(float(3**39)), end='\n\n')

    a, b = input('Введите значения через пробел: ').split()
    print(a)
    print(b, end='\n\n')

    print('--- Task 9 ---')
    a = 1  # инициализация переменной начальным значением
    while a <= 20:  # логическое условие цикла
        if a % 2 == 0:  # если остаток от деления на 2 равен нулю, то число четное
            print(a, end=' ')  # вывести значения и в конце добавить пробел
        a += 1  # инкремент, следующее значение
    print('\n\n')

    while 1:
        # запрашиваем значение
        a = input('Выйти из цикла (y/n):').lower()
        if a == 'y':
            # ввели Y, прерываем выполнение цикла
            break
        elif a == 'n':
            # ввели N, переходим к следующей итерации
            continue
            print('Сюда мы никогда не попадем')
        else:
            print('Введено что-то кроме Y или N.')
    else:
        print('Сюда мы никогда не попадем тоже')

    # сложим числа из заданной последовательности
    b = 0  # обнуляем переменную в которой будет накоплена сумма
    for a in 2, 3, 4:  # для каждого a из списка
        b += a  # прибавим a к b
    print('Сумма = ', b)

    # сложим числа из заданной последовательности
    b = 0  # обнуляем переменную в которой будет сумма
    for a in range(2, 4 + 1):  # для каждого a из списка
        print(a)  # выведем текущее значение a
        b += a  # прибавим a к b
    print('Сумма = ', b, end='\n\n')

    # таблица умножения по блокам
    a, b, c, d = [int(input('Введите диапозон чисел (Enter после каждого): ')) for i in range(4)]
    print('', end='\t')
    for j in range(c, d + 1):
        print(j, end='\t')
    print()
    for i in range(a, b + 1):
        print(i, end='\t')
        for j in range(c, d + 1):
            print(i * j, end='\t')
        print()

    messagebox.showinfo('Useful Python', 'Вы долго смотрели в монитор, теперь посмотрите в окно.')

    window = Tk()  # создание окна
    window.title('Окна и кнопки')  # заголовок окна
    window.geometry('400x250')  # размеры окна
    lbl = Label(window, text='Кнопка', font=('Arial Bold', 30))
    lbl.grid(column=0, row=0)

    # вызов функции clicked() при нажатии кнопки
    btn = Button(window, text='НАЖМИ', command=clicked)

    btn.grid(column=1, row=0)
    window.mainloop()  # бесконечный цикл окна, окно ждёт нажатий








