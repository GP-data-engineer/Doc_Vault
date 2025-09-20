
**Najczęściej używane sekwencje:**
```shell
cd C:\
cd GitHub\Repo\Doc_Vault

```
```shell
cd C:\
cd C:\GitHub\Repo\Introduction-to-Algorithms-clrs-exercises

```
```shell
New_Item_ExerciseOrTest.ps1 -Chapter 04 -Name 4_4_6

```
```shell
git status
```
```shell
git add .
git commit -m "Modified Doc_Vault"
git push
```
```shell
git add .
git commit -m "Added test_exercise_4_3_x.py & test_exercise_4_3_x.py"
git push

```
```shell
git add .
git commit -m "Modified test_exercise_4_3_x.py & test_exercise_4_3_x.py"
git push

```
```shell
python -m pytest #uruchamia wszystkie test w Repo

```

```shell
pytest .\tests\Chapter04\test_exercise_4_3_7.py  #uruchamia test wybranego pliku
 
```
```
https://github.com/GP-data-engineer?tab=repositories
```


<span class="yelow">
.red tests\Chapter03\test_exercise_3_2_6.py F                                                       [ 82%]
tests\Chapter03\test_problem_3_1.py ......                                                     [ 87%]
tests\Chapter03\test_problem_3_2.py FFF...F                                                    [ 92%]
tests\Chapter03\test_problem_3_3.py F.F                                                        [ 94%]
</span>


```shell
git config --global user.name "Grzegorz Pieniak"
git config --global user.email "gp79@tutamail.com"

```

```shell
# Utwórz pusty plik .ps1
New-Item -Path "Run_All_Tests_Separately.ps1" -ItemType File -Force

```

```shell
New-Item -Path "Run_chapter03_tests.ps1" -ItemType File -Force

```

```shell
mklink /D "C:\Vault\Scripts" "C:\GitHub\Repo\Scripts"

```

Jeśli chcemy, aby lokalnie utworzony folder `Doc_Vault` był dołączony repozytorium:
```shell
cd C:\GitHub\Repo\Doc_Vault
git init
git add .
git commit -m "Pierwszy commit"

```
Zmienia nazwy głównej gałęzi z master w `main`:
```shell
git branch -m master main

```
Łączy lokalne repozytorium z GitHubem:
```shell
git remote add origin https://github.com/GP-data-engineer/Doc_Vault.git
```
Ustawia powiązanie lokalnej gałęzi `main` z gałęzią `main` na GitHubie:
```shell
git push --set-upstream origin main

```
**Pobiera zmiany z GitHuba i połącz z lokalnymi:**
```shell
git pull origin main --allow-unrelated-histories

```

```shell
cd C:\GitHub\Repo
git clone https://github.com/uzytkownik/nazwa-repo.git Doc_Vault

```
---
### Prompt dla Problemu
```
przygotuj kod dla zadania Problem_3_3.py oraz przygotuj kod do test_problem_3_3.py, komentarze na początku i zwięzłe komentarze w środku kodu opisujące co robi kod, w kodach obu plików przygotuj komentarze po angielsku, twoj opis kodu po Polsku, bez dynamicznego importu, tylko z bezpośrednim import pytest, będę przesyłał do Repo na GitHub. Do kodu Problemu Problem_3_3.py dodaj sekcje if __name__ == "__main__" i wydrukuj na ekranie efekt działania programu. Kod testu musi zawierać w sekcji from src.Chapter03. następnie nazwę zadania problemu oraz import odpowiednich testów.
```
### Prompt dla Zadania
```
przygotuj kod do zadania Exercise_4_2_7.py oraz przygotuj kod do test_exercise_4_2_7.py, komentarze na początku i zwięzłe komentarze w środku kodu opisujące co robi kod, w kodach obu plików przygotuj komentarze po angielsku, twoj opis kodu po Polsku, bez dynamicznego importu, tylko z bezpośrednim import pytest, będę przesyłał do Repo na GitHub. Do kodu Zadania Exercise_4_2_7.py dodaj sekcje if __name__ == "__main__" i wydrukuj na ekranie efekt działania programu. Kod testu musi zawierać w sekcji from src.Chapter04. następnie nazwę zadania oraz import odpowiednich testów.
```
### Prompt dla kilku Zadań
```
Przygotuj kody do wszytkich zadań nazwy  wg schematu Exercise_4_4_1.py, Exercise_4_4_2.py itd. oraz przygotuj kody do testów wg. schematów test_exercise_4_4_1.py, test_exercise_4_4_2.py itd. w każdym z kodów dodaj komentarze na początku z opisem zadania czy testu i zwięzłe komentarze w środku kodu opisujące co robi kod, w kodach przygotuj komentarze po angielsku, twoj opis kodu po Polsku. Do kodów z zadaniami dodaj sekcje if __name__ == "__main__" i wydrukuj na ekranie efekt działania programów. W kodach z testami bez dynamicznego importu, tylko z bezpośrednim import pytest, zadania i testy będę ręcznie przesyłał do Repo na GitHub.  Kody z testami muszą zawierać w sekcjach from takie ścieżki: src.Chapter04. następnie nazwę zadania oraz import odpowiednich testów, inaczej test nie będzie widział zadania.```
---


## Poniżej znajdziesz dwie tabele:
1. **PowerShell vs Git Bash – 30 najczęściej używanych komend** – rozszerzona ściąga do nauki równoległej.
2. **PowerShell vs Git Bash – porównanie podstawowych komend** – skrócona wersja.

---

## 1. PowerShell vs Git Bash – 30 najczęściej używanych komend

| #   | Zadanie                  | PowerShell                                         | Git Bash (Bash)                     |
| --- | ------------------------ | -------------------------------------------------- | ----------------------------------- |
| 1   | Pokaż pliki w katalogu   | `Get-ChildItem` lub `ls`                           | `ls`                                |
| 2   | Pokaż pliki z ukrytymi   | `Get-ChildItem -Force`                             | `ls -a`                             |
| 3   | Zmień katalog            | `Set-Location src` lub `cd src`                    | `cd src`                            |
| 4   | Wróć o jeden katalog     | `cd ..`                                            | `cd ..`                             |
| 5   | Utwórz folder            | `New-Item -ItemType Directory src` lub `mkdir src` | `mkdir src`                         |
| 6   | Utwórz wiele folderów    | `mkdir src, tests`                                 | `mkdir src tests`                   |
| 7   | Usuń plik                | `Remove-Item plik.txt`                             | `rm plik.txt`                       |
| 8   | Usuń folder              | `Remove-Item folder -Recurse`                      | `rm -r folder`                      |
| 9   | Kopiuj plik              | `Copy-Item plik.txt kopia.txt`                     | `cp plik.txt kopia.txt`             |
| 10  | Przenieś plik            | `Move-Item plik.txt src\`                          | `mv plik.txt src/`                  |
| 11  | Zawartość pliku          | `Get-Content plik.txt` lub `cat plik.txt`          | `cat plik.txt`                      |
| 12  | Wyszukaj tekst w pliku   | `Select-String "szukany" plik.txt`                 | `grep "szukany" plik.txt`           |
| 13  | Zapisz do pliku          | `"tekst" \| Out-File plik.txt`                     | `echo "tekst" > plik.txt`           |
| 14  | Dopisz do pliku          | `"tekst" \| Add-Content plik.txt`                  | `echo "tekst" >> plik.txt`          |
| 15  | Zmienna                  | `$x = 5`                                           | `x=5`                               |
| 16  | Wyświetl zmienną         | `$x`                                               | `$x` lub `${x}`                     |
| 17  | Pętla for                | `for ($i=0; $i -lt 5; $i++) { Write-Host $i }`     | `for i in {0..4}; do echo $i; done` |
| 18  | Pętla foreach            | `foreach ($f in $files) { ... }`                   | `for f in $files; do ...; done`     |
| 19  | Instrukcja if            | `if ($x -gt 5) { ... }`                            | `if [ $x -gt 5 ]; then ...; fi`     |
| 20  | Pobierz datę             | `Get-Date`                                         | `date`                              |
| 21  | Historia poleceń         | `Get-History`                                      | `history`                           |
| 22  | Wyczyść ekran            | `Clear-Host` lub `cls`                             | `clear`                             |
| 23  | Sprawdź ścieżkę          | `Get-Location`                                     | `pwd`                               |
| 24  | Sprawdź wersję           | `$PSVersionTable.PSVersion`                        | `bash --version`                    |
| 25  | Uruchom skrypt           | `.\skrypt.ps1`                                     | `./skrypt.sh`                       |
| 26  | Nadaj prawa do pliku     | *(niepotrzebne w Windows)*                         | `chmod +x plik.sh`                  |
| 27  | Pobierz plik z internetu | `Invoke-WebRequest URL -OutFile plik`              | `curl -o plik URL` lub `wget URL`   |
| 28  | Lista procesów           | `Get-Process`                                      | `ps aux`                            |
| 29  | Zakończ proces           | `Stop-Process -Name notepad`                       | `kill PID`                          |
| 30  | Wyjście z terminala      | `exit`                                             | `exit`                              |

---

## 2️. PowerShell vs Git Bash – porównanie podstawowych komend

| Zadanie                           | PowerShell                                         | Git Bash (Bash)                     | Uwagi                                                             |
| --------------------------------- | -------------------------------------------------- | ----------------------------------- | ----------------------------------------------------------------- |
| **Wyświetlenie listy plików**     | `Get-ChildItem` lub `ls`                           | `ls`                                | W PowerShell `ls` to alias, ale zwraca obiekty, nie czysty tekst. |
| **Zmiana katalogu**               | `Set-Location src` lub `cd src`                    | `cd src`                            | W obu działa `cd`.                                                |
| **Utworzenie folderu**            | `New-Item -ItemType Directory src` lub `mkdir src` | `mkdir src`                         | W PowerShell `mkdir` to alias do `New-Item`.                      |
| **Usunięcie pliku**               | `Remove-Item plik.txt`                             | `rm plik.txt`                       | W PowerShell `rm` to alias do `Remove-Item`.                      |
| **Kopiowanie pliku**              | `Copy-Item plik.txt kopia.txt`                     | `cp plik.txt kopia.txt`             |                                                                   |
| **Przenoszenie pliku**            | `Move-Item plik.txt src\`                          | `mv plik.txt src/`                  |                                                                   |
| **Wyświetlenie zawartości pliku** | `Get-Content plik.txt` lub `cat plik.txt`          | `cat plik.txt`                      | W PowerShell `cat` to alias do `Get-Content`.                     |
| **Wyszukiwanie tekstu w pliku**   | `Select-String "szukany" plik.txt`                 | `grep "szukany" plik.txt`           |                                                                   |
| **Zmienne**                       | `$x = 5`                                           | `x=5` (bez spacji)                  | W PowerShell zmienne zaczynają się od `$`.                        |
| **Pętla for**                     | `for ($i=0; $i -lt 5; $i++) { Write-Host $i }`     | `for i in {0..4}; do echo $i; done` | Składnia zupełnie inna.                                           |
| **Komentarz**                     | `# komentarz`                                      | `# komentarz`                       | Tu jest tak samo.                                                 |
| **Ścieżki**                       | `C:\folder\plik.txt`                               | `/c/folder/plik.txt`                | Git Bash używa stylu linuksowego.                                 |

---
