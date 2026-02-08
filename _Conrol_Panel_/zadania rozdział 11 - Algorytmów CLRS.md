Zadania:

11_1_1. Niech zbiór dynamiczny S będzie reprezentowany przez tablicę T o długości m z adresowaniem bezpośrednim. Opisz procedurę wyszukującą największy element zbioru S. Jaki jest pesymistyczny czas działania Twojej procedury?

11_1_2. Wektor bitowy jest tablicą bitów (zer i jedynek). Wektor bitowy o długości m zajmuje mniej pamięci niż tablica m wskaźników. Opisz metodę reprezentowania zbiorów dynamicznych za pomocą wektorów bitowych (przy założeniu że w skład elementów nie wchodzą żadne dodatkowe dane). Operacje słownikowe powinny działać w czasie O(1).

11_1_3. Zaproponuj metodę implementacji tablicy z adresowaniem bezpośrednim, w której klucze pamiętanych elementów nie muszą być różne, a z każdym elementem mogą być związane pewne dodatkowe dane. Wszystkie trzy operacje słownikowe (INSERT, DELETE oraz SEARCH) powinny działać w czasie O(1). (Argumentem procedury DELETE jest wskaźnik do obiektu, który ma zostać usunięty, a nie sam klucz).

11_1_4. Chcemy reprezentować słownik za pomocą adresowania bezpośredniego w ogromnej tablicy. Na początku w tablicy mogą znajdować się przypadkowe wartości, a jej inicjowanie nie wchodzi w rachubę ze względu na jej duży rozmiar. Zaprojektuj metodę reprezentowania słownika z adresowaniem bezpośrednim w ogromnej tablicy. Każdy przechowywany element powinien zajmować tylko O(1) pamięci, operacje SEARCH, INSERT i DELETE powinny działać w czasie O(1), a inicjowanie tej struktury danych powinno przebiegać w czasie O(1). (Wskazówka: Użyj dodatkowej tablicy wykorzystywanej jako rodzaj stosu o rozmiarze równym liczbie elementów przechowywanych w tablicy, za pomocą którego można określać, czy dana pozycja w dużej tablicy zawiera sensowną wartość).


===

Przygotuj kod do zadań z książki Wprowadzenie do Algorytmów CLRS ale w polskiej wersji językowej. Analizuj i przygotuj pełne działające implementacje algorytmów, wygeneruj kody do wszystkich zadań od razu. Przygotuj kody do wszytkich zadań, nazwy wg schematu 

Exercise_11_1_1.py 

i do wszystkich zadań aż do 

Exercise_11_1_4.py, 