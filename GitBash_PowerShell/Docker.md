Docker to otwarto‑źródłowa platforma do tworzenia, dystrybucji i uruchamiania aplikacji w kontenerach. Kontenery są lekkimi, izolowanymi środowiskami, które zawierają wszystko, czego dana aplikacja potrzebuje – kod, biblioteki, zależności i ustawienia systemowe – dzięki czemu działają spójnie na dowolnym hostie (serwerze, komputerze, chmurze) bez konieczności instalowania dodatkowego oprogramowania.

Kluczowe zalety Dockera:

- **Przenośność** – obraz kontenera zbudowany raz może być uruchomiony wszędzie, gdzie działa Docker Engine.
- **Izolacja** – procesy w kontenerze są odseparowane od systemu gospodarza i od innych kontenerów, co zwiększa bezpieczeństwo i stabilność.
- **Efektywność zasobów** – w przeciwieństwie do tradycyjnych maszyn wirtualnych, kontenery współdzielą kernel systemu operacyjnego, więc zużywają mniej pamięci i CPU.
- **Szybkość** – uruchamianie kontenera trwa sekundy, a nie minuty, co przyspiesza rozwój, testowanie i wdrażanie aplikacji.

Typowy przepływ pracy z Dockerem wygląda tak:

1. **Dockerfile** – plik konfiguracyjny opisujący, jak zbudować obraz (np. bazowy system operacyjny, instalacja zależności, kopiowanie kodu).
2. **docker build** – komenda budująca obraz na podstawie Dockerfile.
3. **docker run** – uruchamia kontener z tego obrazu, opcjonalnie mapując porty, wolumeny czy zmienne środowiskowe.
4. **docker push / docker pull** – publikowanie i pobieranie obrazów z rejestru (np. Docker Hub, własny prywatny rejestr).

Docker stał się fundamentem nowoczesnych praktyk DevOps, takich jak CI/CD, mikroserwisy i „Infrastructure as Code”. Dzięki niemu zespoły mogą szybciej dostarczać oprogramowanie, minimalizując problemy związane z różnicami środowiskowymi.

---

**DevOps** to zestaw metod, kultury organizacyjnej i narzędzi, które mają na celu połączenie (ang. _development_ + _operations_) programistów i zespołów operacyjnych w jedną, spójną jednostkę. Dzięki temu można szybciej, bardziej niezawodnie i w sposób powtarzalny dostarczać oprogramowanie. Poniżej opisuję trzy kluczowe praktyki, które często występują w nowoczesnych środowiskach DevOps.

---

## 1. CI/CD – ciągła integracja i ciągłe dostarczanie (lub wdrażanie)

| Element                         | Co to znaczy?                                                                                                                                                                                     | Dlaczego jest ważny?                                                                                      |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| **CI – Continuous Integration** | Programiści regularnie (najlepiej przy każdym commicie) łączą swój kod ze wspólnym repozytorium. Każde połączenie uruchamia automatyczny zestaw testów i budowanie artefaktu (np. obrazu Docker). | Wykrywa konflikty i błędy bardzo wcześnie, zanim rozprzestrzenią się po całym projekcie.                  |
| **CD – Continuous Delivery**    | Po udanym etapie CI artefakt jest automatycznie przygotowywany do wdrożenia na środowiska testowe i produkcyjne, ale sam proces wdrożenia może wymagać ręcznej akceptacji.                        | Umożliwia szybkie, powtarzalne wypuszczanie nowych wersji przy minimalnym ryzyku.                         |
| **CD – Continuous Deployment**  | Identyczne do Continuous Delivery, ale wdrożenie odbywa się automatycznie po przejściu wszystkich testów, bez ręcznej interwencji.                                                                | Najwyższy stopień automatyzacji – nowe funkcje trafiają do produkcji natychmiast po zatwierdzeniu testów. |

**Typowy pipeline CI/CD**

1. **Commit** → trigger → **build** (kompilacja, tworzenie obrazu).
2. **Test** → jednostkowe, integracyjne, e2e.
3. **Static analysis / security scan** (np. SAST, DAST).
4. **Artifact storage** (rejestr kontenerów, repozytorium binarek).
5. **Deploy** → staging → produkcja (z ewentualnym zatwierdzeniem).

Narzędzia popularne w tym obszarze: GitHub Actions, GitLab CI, Jenkins, CircleCI, Azure Pipelines, Travis CI.

---

## 2. Mikroserwisy

### Definicja

Mikroserwis to mała, autonomiczna usługa realizująca jedną, jasno określoną funkcję biznesową. Zamiast monolitu (jedna duża aplikacja), system składa się z wielu niezależnych serwisów, które komunikują się ze sobą (zwykle przez HTTP/REST, gRPC lub kolejki wiadomości).

### Zalety

|Zaleta|Dlaczego jest cenna?|
|---|---|
|**Skalowalność**|Każdy serwis można skalować oddzielnie, zgodnie z jego obciążeniem (np. serwis płatności vs. serwis rekomendacji).|
|**Niezależny rozwój**|Zespoły mogą pracować nad różnymi serwisami równocześnie, używając różnych języków i stacków, pod warunkiem, że interfejsy są ustalone.|
|**Odporność**|Awaria jednego mikroserwisu nie musi sparaliżować całego systemu; inne serwisy mogą nadal działać.|
|**Częstsze wdrożenia**|Mniejsze komponenty łatwiej przetestować i wdrożyć, co sprzyja praktykom CI/CD.|
|**Lepsze dopasowanie do domeny**|Architektura oparta na **Domain‑Driven Design** (DDD) pozwala mapować mikroserwisy na konkretne bounded contexts.|

### Wyzwania

- **Złożoność operacyjna** – potrzeba orkiestracji (Kubernetes, Docker Swarm) i monitoringu rozproszonego (Jaeger, Prometheus).
- **Komunikacja sieciowa** – opóźnienia, awarie sieci, konieczność obsługi retry i circuit‑breaker.
- **Spójność danych** – brak jednej wspólnej bazy; trzeba radzić sobie z eventual consistency i transakcjami rozproszonymi.

---

## 3. Infrastructure as Code (IaC)

### Co to jest?

IaC to podejście, w którym infrastruktura (serwery, sieci, bazy danych, reguły firewall, itp.) jest definiowana i zarządzana przy pomocy kodu (pliki konfiguracyjne, szablony). Dzięki temu infrastruktura staje się wersjonowalna, testowalna i reprodukowalna – tak jak każdy inny kod źródłowy.

### Modele IaC

| Model                                                                          | Charakterystyka                                                                                |
| ------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- |
| **Declarative** (np. Terraform, CloudFormation, Pulumi w trybie deklaratywnym) | Opisujesz _co_ ma istnieć, a narzędzie samo dobiera kroki potrzebne do osiągnięcia tego stanu. |
| **Imperative** (np. Ansible, Chef, Puppet w trybie imperatywnym)               | Określasz _jak_ wykonać poszczególne czynności (instalacja pakietów, uruchamianie usług).      |

### Korzyści

- **Powtarzalność** – jednorazowo zdefiniowany szablon można uruchomić setki razy (np. środowiska dev, test, prod).
- **Wersjonowanie** – zmiany w infrastrukturze są śledzone w systemie kontroli wersji (Git), co umożliwia rollbacki i audyt.
- **Automatyzacja** – połączone z CI/CD, IaC pozwala na pełny „pipeline” od kodu aplikacji po infrastrukturę docelową.
- **Bezpieczeństwo** – reguły i polityki (np. IAM, szyfrowanie) są częścią kodu, co ułatwia ich przegląd i egzekwowanie.

### Przykład prostego Terraform:

`provider "aws" {   region = "eu-central-1" } resource "aws_instance" "web" {   ami           = "ami-0c55b159cbfafe1f0"  instance_type = "t3.micro"   tags = {    Name = "my-web-server"  } }`

Po `terraform apply` zostanie utworzony serwer EC2 zgodny z definicją.

---

## Jak te elementy współgrają?

1. **Kod aplikacji** jest zapisywany w repozytorium i podlega **CI** – buduje się artefakty (np. obrazy Docker).
2. **IaC** definiuje środowisko (klaster Kubernetes, bazy danych, load balancery).
3. **CD** automatycznie wdraża nowy artefakt do środowiska określonego przez IaC.
4. **Mikroserwisy** jako architektura aplikacji idealnie pasują do takiego pipeline’u – każdy serwis ma własny obraz, własny pipeline i własny zestaw zasobów w IaC.

Razem tworzą **pętlę zwrotną**, w której zmiany są szybkie, kontrolowane i łatwe do przywrócenia, co zwiększa zarówno tempo dostarczania wartości, jak i stabilność systemu.

---

### Co dalej?

Jeśli chcesz rozpocząć przygodę z DevOps, możesz:

- **Wybrać narzędzie CI/CD** (np. GitHub Actions) i skonfigurować prosty pipeline dla jednego projektu.
- **Zbudować pierwszy mikroserwis** (np. w Node.js lub Go) i spakować go jako obraz Docker.
- **Spróbować Terraform** lub innego narzędzia IaC, aby uruchomić jedną maszynę w chmurze i połączyć ją z Twoim kontenerem.

Daj znać, który z tych kroków najbardziej Cię interesuje, a pomogę przygotować szczegółowy plan lub przykładowe konfiguracje!