

Git – menu programów i ich zastosowanie
## Który program wybrać, żeby pisać komendy w Git Bash?
**Wybierz „Git Bash”**  
To terminal emulujący powłokę **Bash** (taką jak w Linux/Unix), działający w Windows.  
- Obsługuje standardowe komendy linuksowe (`ls`, `cd`, `grep`, `cat`, `nano` itd.).
- W pełni obsługuje komendy Gita (`git clone`, `git commit`, `git push` itd.).
- Idealny do nauki pracy w terminalu i pisania skryptów `.sh`.

---

## Co oznaczają pozostałe opcje w menu Git

| Program | Do czego służy |
|---------|----------------|
| **Git Bash** | Terminal Bash w Windows. Umożliwia korzystanie z komend linuksowych i Gita w jednym środowisku. Najlepszy wybór, jeśli chcesz pisać komendy ręcznie i uczyć się pracy w konsoli. |
| **Git CMD** | Uruchamia wiersz poleceń Windows (CMD) z dodanymi komendami Gita. Składnia jest typowa dla Windows CMD, więc nie ma wszystkich narzędzi linuksowych jak w Bash. |
| **Git GUI** | Graficzny interfejs do Gita. Pozwala wykonywać operacje (commit, push, pull, merge) klikając myszką, bez wpisywania komend. |
| **Git FAQs** | Dokument z najczęściej zadawanymi pytaniami o Git. Pomocne źródło wiedzy, ale to tylko plik pomocy, nie środowisko pracy. |
| **Git Release Notes** | Lista zmian w kolejnych wersjach Gita (co nowego, poprawki błędów). Przydatne, jeśli chcesz śledzić rozwój narzędzia. |

---

#  Mini ściąga – 20 najczęściej używanych komend w Git Bash

| #   | Komenda                   | Opis                                                                |
| --- | ------------------------- | ------------------------------------------------------------------- |
| 1   | `git init`                | Inicjalizuje nowe repozytorium Git w bieżącym katalogu.             |
| 2   | `git clone <url>`         | Klonuje zdalne repozytorium do lokalnego katalogu.                  |
| 3   | `git status`              | Pokazuje status repozytorium (zmienione, dodane, usunięte pliki).   |
| 4   | `git add <plik>`          | Dodaje plik do obszaru stage (przygotowuje do commita).             |
| 5   | `git add .`               | Dodaje wszystkie zmienione pliki do obszaru stage.                  |
| 6   | `git commit -m "opis"`    | Tworzy commit z opisem zmian.                                       |
| 7   | `git log`                 | Wyświetla historię commitów.                                        |
| 8   | `git diff`                | Pokazuje różnice między plikami w repozytorium.                     |
| 9   | `git branch`              | Wyświetla listę gałęzi w repozytorium.                              |
| 10  | `git branch <nazwa>`      | Tworzy nową gałąź.                                                  |
| 11  | `git checkout <nazwa>`    | Przełącza się na inną gałąź.                                        |
| 12  | `git merge <nazwa>`       | Łączy wskazaną gałąź z bieżącą.                                     |
| 13  | `git pull`                | Pobiera i scala zmiany ze zdalnego repozytorium.                    |
| 14  | `git push`                | Wysyła lokalne commity do zdalnego repozytorium.                    |
| 15  | `git remote -v`           | Wyświetla adresy zdalnych repozytoriów.                             |
| 16  | `git reset --hard <hash>` | Resetuje repozytorium do wskazanego commita (uwaga – usuwa zmiany). |
| 17  | `git stash`               | Tymczasowo odkłada zmiany, aby mieć czysty stan roboczy.            |
| 18  | `git stash pop`           | Przywraca zmiany zapisane w stash.                                  |
| 19  | `git rm <plik>`           | Usuwa plik z repozytorium i systemu plików.                         |
| 20  | `git tag <nazwa>`         | Tworzy tag (np. wersję) w repozytorium.                             |

---

**Wskazówka:**  
Jeżeli dopiero zaczynasz, najczęściej będziesz używać sekwencji:
```bash
git status
git add .
git commit -m "opis zmian"
git push
