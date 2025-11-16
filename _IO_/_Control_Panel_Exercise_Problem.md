---
title: Sterownik zadań (PS/Py)
Chapter: 9
name_x: 9
name_y: 1
name_z: 1
mode: Exercise
script_ps1: New_Item_ExerciseOrTest.ps1
---

# Control Panel – Exercise / Problem

> Ustaw wartości przyciskami, wybierz tryb, a komenda zostanie zaktualizowana poniżej. Kopiuj jednym kliknięciem.

```dataviewjs
let fm = dv.current().file.frontmatter;

// Funkcja zapisu do YAML
const saveFm = async (updates) => {
  const file = app.workspace.getActiveFile();
  const text = await app.vault.read(file);
  const yaml = app.metadataCache.getFileCache(file)?.frontmatterPosition;
  if (!yaml) { new Notice("Brak sekcji YAML"); return; }
  const head = text.slice(0, yaml.end.offset);
  const body = text.slice(yaml.end.offset);
  const lines = head.split("\n");
  for (const [k,v] of Object.entries(updates)) {
    const rx = new RegExp(`^${k}:\\s*.*$`);
    const i = lines.findIndex(l => rx.test(l));
    if (i >= 0) lines[i] = `${k}: ${v}`;
    else lines.splice(lines.length-1, 0, `${k}: ${v}`);
    fm[k] = v;
  }
  const updated = lines.join("\n") + body;
  await app.vault.modify(file, updated);
  dv.containerEl.querySelector("#cmdOut").textContent = buildCmd();
};

// Funkcja budująca komendę
const pad2 = n => String(n).padStart(2, "0");
const buildCmd = () => {
  if (fm.mode === "Problem") {
    return `${fm.script_ps1} -Chapter ${pad2(fm.Chapter)} -Name ${fm.name_x}_${fm.name_y}`;
  } else {
    return `${fm.script_ps1} -Chapter ${pad2(fm.Chapter)} -Name ${fm.name_x}_${fm.name_y}_${fm.name_z}`;
  }
};

// Funkcja tworząca przycisk
const makeBtn = (label, onClick) => {
  const b = dv.el("button", label, { cls: "btn" });
  b.addEventListener("click", onClick);
  return b;
};

// Render UI
const box = dv.el("div", "", { cls: "ctrl-box" });

// Tryb
const rowMode = dv.el("div", "", { cls: "ctrl-row" }, box);
dv.el("span", "Tryb:", {}, rowMode);
makeBtn("Exercise", () => saveFm({ mode: "Exercise" })).style.marginLeft="8px";
makeBtn("Problem", () => saveFm({ mode: "Problem" }));

// Chapter
const rowCh = dv.el("div", "", { cls: "ctrl-row" }, box);
dv.el("span", "Chapter:", {}, rowCh);
makeBtn("[−]", () => saveFm({ Chapter: Math.max(0, (fm.Chapter||0)-1) })).style.marginLeft="9px";
makeBtn("[+]", () => saveFm({ Chapter: (fm.Chapter||0)+1 }));

// Name X_Y
const rowXY = dv.el("div", "", { cls: "ctrl-row" }, box);
dv.el("span", "Name X_Y:", {}, rowXY);
makeBtn("X−", () => saveFm({ name_x: Math.max(0, (fm.name_x||0)-1) })).style.marginLeft="8px";
makeBtn("X+", () => saveFm({ name_x: (fm.name_x||0)+1 }));
makeBtn("Y−", () => saveFm({ name_y: Math.max(0, (fm.name_y||0)-1) })).style.marginLeft="8px";
makeBtn("Y+", () => saveFm({ name_y: (fm.name_y||0)+1 }));

// Name Z (tylko dla Exercise)
const rowZ = dv.el("div", "", { cls: "ctrl-row" }, box);
dv.el("span", "Name Z (Exercise):", {}, rowZ);
makeBtn("Z−", () => saveFm({ name_z: Math.max(0, (fm.name_z||0)-1) })).style.marginLeft="8px";
makeBtn("Z+", () => saveFm({ name_z: (fm.name_z||0)+1 }));

// Komenda wynikowa
dv.el("h3", "Aktualna komenda:", {}, box);
const pre = dv.el("pre", buildCmd(), { attr: { id: "cmdOut" } }, box);

// Przycisk kopiowania
const copyBtn = makeBtn("Kopiuj komendę", async () => {
  await navigator.clipboard.writeText(buildCmd());
  new Notice("Skopiowano");
});
copyBtn.style.marginTop = "8px";
box.appendChild(copyBtn);
```


---


```shell
cd C:\
cd GitHub\Repo\Doc_Vault

```
```shell
cd C:\
cd C:\GitHub\Repo\Introduction-to-Algorithms-clrs-exercises

```

---
### Prompt dla Problemu
```
Przygotuj kod problemu z książki Wprowadzenie do Algorytmów CLRS ale w polskiej wersji językowej. Każdy problem analizuj indywidulanie i przygotuj pełne działające implementacje algorytmów (przykładowo: pełny Quicksort, Insertion Sort, analiza T(n), symulacje głębokości drzewa itd.), wygeneruj kody do wszystkich zadań od razu. Przygotuj kod dla problemu przykład nazwy pliku Problem_8_4.py i Problem_8_5.py. Do każdego zadania przygotuj plik kod z testem przykład nazwy pliku test_problem_8_4.py i test_problem_8_5.py. 
Na poczatku każdego z kodów dodaj zwięzłe komentarze po Angielsku i po Polsku co robi kod, w środku kodu dodaj komentarze opisujące co robi kod, zastosuj w kodach obu plików Problemu i testu Problemu.
Pliki z kody testu bez dynamicznego importu, tylko z bezpośrednim import pytest, będę samodzielnie przesyłał do Repo na GitHub. Do kodów zadaniach dodaj sekcje if __name__ == "__main__" i wydrukuj na ekranie efekt działania programu. Kod testu musi zawierać w sekcji from src.Chapter08. następnie nazwę zadania oraz import odpowiednich testów.

src/ 
	└── Chapter08/ 
		└── Problem_8_1.py 
tests/ 
	└── Chapter08/ 
		└── test_problem_8_1.py 
powyżej potwierdzenie struktury plików
```


### Prompt dla kilku Zadań
```
Przygotuj kod do zadań z książki Wprowadzenie do Algorytmów CLRS ale w polskiej wersji językowej. Analizuj i przygotuj pełne działające implementacje algorytmów (np. pełny Quicksort, Insertion Sort, analiza T(n), symulacje głębokości drzewa itd.), wygeneruj kody do wszystkich zadań od razu. Przygotuj kody do wszytkich zadań, nazwy wg schematu Exercise_8_4_4.py itd. do wszystkich zadań aż do Exercise_8_4_5.py oraz przygotuj do każdego zadania kody do testów test_exercise_8_4_4.py itd. do wszystkich zadań, aż do test_exercise_8_4_5.py. Wyświetla odpowiedzi w parach tj. zdanie i test do zdania. Dla każdego kodu komentarze na początku i zwięzłe komentarze w środku kodu opisujące co robi kod, w kodach obu plików przygotuj opisy zadań po Angielsku i po Polsku. Testy bez dynamicznego importu, tylko z bezpośrednim import pytest, będę samodzielnie przesyłał do Repo na GitHub. Do kodów zadaniach dodaj sekcje if __name__ == "__main__" i wydrukuj na ekranie efekt działania programu. Kod testu musi zawierać w sekcji from src.Chapter08. następnie nazwę zadania oraz import odpowiednich testów.
src/
	└── Chapter08/
		└── Exercise_8_4_5.py
tests/
	└── Chapter08/
		└── test_exercise_8_4_5.py
powyżej potwierdzenie struktury plików
```
