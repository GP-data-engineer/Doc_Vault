- tabele przestawne:
https://youtu.be/6BreRaiHKBU?list=PLgU2XrNJjWbdNOf9HGOoBLN9Z5LSzcczH


---

Listuje w kolumnie etykiety kolumn w tabeli, różnych wystąpień elementów w tabeli:
Dodatkowo łączy, jeśli wystąpienie jest więcej niż w jednej  kolumnie
Rodzaj danych jest nie istotny, chodzi o to czy dana komórka w tabeli jest wypełniona:  

=POŁĄCZ.TEKSTY(", "; PRAWDA; JEŻELI(G4:Q4=$F4; $G$1:$Q$1; ""))

dodać przecinek na końcu zawartości komórki **bez zmiany danych**, używając **formatowania niestandardowego:**

@","  

@ oznacza tekst w komórce.
"," dodaje przecinek po tekście.

---

