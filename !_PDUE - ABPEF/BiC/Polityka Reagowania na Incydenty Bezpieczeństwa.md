
**„Polityka Reagowania na Incydenty Bezpieczeństwa / Naruszenia Danych”**.

Poniżej zamieszczam wersję tekstową, którą można łatwo przerobić na PDF lub Word. Zawiera: procedury krok po kroku, szablony zgłoszeń, checklistę i odniesienia do RODO/ISO.

---
PCB – Business Continuity Plan (Plan Ciągłości Biznesowej)
PDR – Procedure Disaster Recovery
BCP – Buisnes Conitiunity Plan
Empowerment definition 
Spojrzenie holistycznie, wielowątkowo

---


# **Polityka Reagowania na Incydenty Bezpieczeństwa i Naruszenia Danych – wzór**

## 1. Cel dokumentu

Celem dokumentu jest określenie **procedur postępowania w przypadku naruszeń bezpieczeństwa informacji**, w tym włamań na serwery i wycieków danych, w celu:

- szybkiego ograniczenia szkód,
- zapewnienia zgodności z RODO (UODO),
- ochrony danych klientów i pracowników,
- dokumentowania i analizowania incydentów,
- wprowadzenia działań zapobiegawczych.
    

---

## 2. Zakres

Procedura dotyczy wszystkich systemów IT, serwerów, baz danych, aplikacji, kont użytkowników, infrastruktury chmurowej oraz danych wrażliwych w organizacji.

---

## 3. Definicje

|Termin|Definicja|
|---|---|
|Incydent bezpieczeństwa|Każde zdarzenie, które narusza lub może naruszyć integralność, poufność lub dostępność zasobów informacyjnych.|
|Naruszenie danych osobowych|Zdarzenie prowadzące do przypadkowego lub niezgodnego z prawem zniszczenia, utraty, zmodyfikowania, ujawnienia lub nieuprawnionego dostępu do danych osobowych.|
|IOD|Inspektor Ochrony Danych – osoba odpowiedzialna za nadzorowanie przestrzegania przepisów RODO.|

---

## 4. Procedura postępowania

### 4.1 Wykrycie incydentu

Każdy pracownik zobowiązany jest niezwłocznie zgłosić incydent do:

- Administratora IT / DevOps,
- Inspektora Ochrony Danych (IOD),
- bezpośredniego przełożonego.
    

**Informacje w zgłoszeniu:**

- Data i godzina wykrycia,
- Opis incydentu,
- System lub zasób dotknięty naruszeniem,
- Osoba zgłaszająca.
    

---

### 4.2 Analiza incydentu

Administrator IT wraz z zespołem:

1. Sprawdza logi systemowe i serwerowe.
2. Identyfikuje wektor ataku (np. brute force, malware, exploit).
3. Ustala, czy atak nadal trwa.
4. Klasyfikuje incydent (techniczny / naruszenie danych osobowych).
    

---

### 4.3 Zabezpieczenie środowiska

- Odłączenie atakowanego serwera od sieci,
- Blokada kont podejrzanych o udział w incydencie,
- Wymuszenie zmiany haseł i kluczy SSH,
- Wyłączenie podatnych usług,
- Izolacja zainfekowanych maszyn,
- Snapshot systemów dla dowodów.
    

---

### 4.4 Ocena wycieku danych

Zespół IT + IOD ustala:

- Jakie dane wyciekły,
- Skala i czas trwania naruszenia,
- Liczba osób i podmiotów dotkniętych,
- Ryzyko dla osób, których dane dotyczą.
    

---

### 4.5 Zgłoszenie do UODO (jeśli dotyczy)

- Termin: **do 72 godzin od wykrycia**.
- Zawartość zgłoszenia: opis naruszenia, kategorie danych, liczba osób, możliwe skutki, działania naprawcze.
    

---

### 4.6 Powiadomienie osób, których dane dotyczą

- Jeśli ryzyko jest wysokie, powiadomić osoby, których dane zostały naruszone.
- Informacja powinna być jasna, z zaleceniami np. zmiany haseł, czujność na phishing.
    

---

### 4.7 Przywracanie systemów i eliminacja skutków

- Usunięcie luk w zabezpieczeniach,
- Aktualizacja systemów, bibliotek i serwerów,
- Przywrócenie danych z bezpiecznych backupów,
- Monitoring logów przez min. 14–30 dni,
- Szkolenia i przypomnienia dla pracowników.
    

---

### 4.8 Dokumentacja incydentu

- Raport incydentu (opis, przyczyna, wpływ),
- Root Cause Analysis,
- Rejestr naruszeń RODO,
- Wnioski i działania prewencyjne.
    

---

### 4.9 Działania prewencyjne

- MFA dla wszystkich użytkowników,
- Hardening serwerów i usług,
- Regularne testy penetracyjne,
- Rotacja haseł i kluczy,
- Backupy i testy odtwarzania,
- Monitoring SIEM / IDS / IPS,
- Szkolenia pracowników,
- Aktualizacja polityk bezpieczeństwa.
    

---

## 5. Checklista „CO ROBIĆ PRZY WŁAMANIU NA SERWER”

1. Odłączyć serwer od sieci
2. Izolować incydent
3. Zabezpieczyć logi i dowody
4. Sprawdzić skalę wycieku danych
5. Powiadomić IOD i przełożonych
6. Ocenić ryzyko naruszenia RODO
7. Zgłosić do UODO w ciągu 72h (jeśli dotyczy)
8. Powiadomić osoby, których dane dotyczą
9. Usunąć lukę i przywrócić system
10. Zaktualizować procedury i środki bezpieczeństwa
    

---

## 6. Załączniki / szablony

- **Szablon zgłoszenia incydentu do UODO**
- **Formularz rejestru incydentów**
- **Formularz powiadomienia osób, których dane dotyczą**
    

---

## 7. Podstawy prawne

- **RODO / GDPR (Rozporządzenie 2016/679)** – artykuły 33, 34, 35
- **Ustawa o krajowym systemie cyberbezpieczeństwa (KSC)**
- **ISO 27001 – System Zarządzania Bezpieczeństwem Informacji**
    

---

Jeżeli chcesz, mogę przygotować **gotowy dokument Word/PDF** z tymi sekcjami **już sformatowany profesjonalnie**, z tabelami do rejestracji incydentów i przykładowym szablonem zgłoszenia do UODO.

Chcesz, żebym zrobił taką wersję PDF/Word?