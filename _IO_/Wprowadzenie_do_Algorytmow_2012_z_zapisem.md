---
title: Wprowadzenie_do_Algorytmow_(2012)
author: CLRS
pdf_path: C:/Algorytmy/Wprowadzenie_do_algorytmów/Wprowadzenie_do_algorytmów_(2012).pdf
Strona_PDF: 81
---

## 📑 Dokument

```dataviewjs
// --- Pobranie frontmatter ---
const fm = dv.current();
//const pdf_path = fm.pdf_path;
const Strona_PDF = fm.Strona_PDF;

// --- Funkcja zapisu do YAML ---
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
  dv.containerEl.querySelector("#pageOut").textContent = fm.Strona_PDF;
};

// --- Funkcja otwierająca PDF --- -pdf_path "${fm.pdf_path}" 
const openPdf = async () => {
  const args = String(fm.Strona_PDF);
  await navigator.clipboard.writeText(args);
  app.commands.executeCommandById("obsidian-shellcommands:shell-command-nlblvsq21a");
};

// --- Funkcja tworząca przycisk ---
const makeBtn = (label, onClick) => {
  const b = dv.el("button", label, { cls: "btn" });
  b.addEventListener("click", onClick);
  return b;
};

// --- Render UI ---
const box = dv.el("div", "", { cls: "ctrl-box" });
const rowPg = dv.el("div", "", { cls: "ctrl-row" }, box);
dv.el("span", "Strona PDF:", {}, rowPg);
makeBtn("[−]", () => saveFm({ Strona_PDF: Math.max(1, (fm.Strona_PDF||1)-1) })).style.marginLeft="8px";
makeBtn("[+]", () => saveFm({ Strona_PDF: (fm.Strona_PDF||1)+1 }));
dv.el("span", fm.Strona_PDF, { attr: { id: "pageOut" }, style: "margin-left:12px; font-weight:bold;" }, rowPg);

const btn = makeBtn("Otwórz PDF", openPdf);
btn.style.marginTop = "10px";
box.appendChild(btn);
```

---

[Wprowadzenie_do_algorytmów_(2012)](file:///C:/Algorytmy/Wprowadzenie_do_algorytmów/Wprowadzenie_do_algorytmów_(2012).pdf)

---


```shell
powershell -ExecutionPolicy Bypass -File & "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe" /A "page=77" "C:\Algorytmy\Wprowadzenie_do_algorytmów\Wprowadzenie_do_algorytmów_(2012).pdf"
```

---
Działa
```shell
powershell -NoProfile -ExecutionPolicy Bypass -Command "$page=(Get-Clipboard); & 'C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe' /A ('page=' + $page) 'C:\Algorytmy\Wprowadzenie_do_algorytmów\Wprowadzenie_do_algorytmów_(2012).pdf'
```
```
```dataviewjs
// --- Pobranie frontmatter ---
const fm = dv.current();
//const pdf_path = fm.pdf_path;
const Strona_PDF = fm.Strona_PDF;

// --- Funkcja zapisu do YAML ---
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
  dv.containerEl.querySelector("#pageOut").textContent = fm.Strona_PDF;
};

// --- Funkcja otwierająca PDF --- -pdf_path "${fm.pdf_path}" 
const openPdf = async () => {
  const args = String(fm.Strona_PDF);
  await navigator.clipboard.writeText(args);
  app.commands.executeCommandById("obsidian-shellcommands:shell-command-nlblvsq21a");
};

// --- Funkcja tworząca przycisk ---
const makeBtn = (label, onClick) => {
  const b = dv.el("button", label, { cls: "btn" });
  b.addEventListener("click", onClick);
  return b;
};

// --- Render UI ---
const box = dv.el("div", "", { cls: "ctrl-box" });
const rowPg = dv.el("div", "", { cls: "ctrl-row" }, box);
dv.el("span", "Strona PDF:", {}, rowPg);
makeBtn("[−]", () => saveFm({ Strona_PDF: Math.max(1, (fm.Strona_PDF||1)-1) })).style.marginLeft="8px";
makeBtn("[+]", () => saveFm({ Strona_PDF: (fm.Strona_PDF||1)+1 }));
dv.el("span", fm.Strona_PDF, { attr: { id: "pageOut" }, style: "margin-left:12px; font-weight:bold;" }, rowPg);

const btn = makeBtn("Otwórz PDF", openPdf);
btn.style.marginTop = "10px";
box.appendChild(btn);
``````

---

Nie działa bo ma problem 
```shell
powershell -ExecutionPolicy Bypass -File "C:/GitHub/Repo/Scripts/src/OpenPdf.ps1" -PdfPath "C:/Algorytmy/Wprowadzenie do algorytmów/Wprowadzenie_do_algorytmów_(2012).pdf" -Page {{value}}
```
---

## Nowy sposób z zapisem ostatniej strony PDF
Komenda Shell:
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "
$page = Get-Clipboard;
$lastPageFile = 'C:\Algorytmy\Wprowadzenie_do_algorytmów\AcroLastPage.txt';
Start-Process 'C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe' -ArgumentList '/A', ('page=' + $page), 'C:\Algorytmy\Wprowadzenie_do_algorytmów\Wprowadzenie_do_algorytmów_(2012).pdf' -Wait;
if (Test-Path $lastPageFile) {
    $newPage = Get-Content $lastPageFile | Select-Object -Last 1;
    if ($newPage -match '^\d+$') {
        Set-Clipboard -Value $newPage;
    }
}
"
```

DataviewJS
```
```DataviewJS
// --- Pobranie frontmatter ----------------------------------------------------
const fm = dv.current();
const Strona_PDF = fm.Strona_PDF;

// --- Funkcja zapisu do YAML --------------------------------------------------
const saveFm = async (updates) => {
  const file = app.workspace.getActiveFile();
  const text = await app.vault.read(file);
  const yaml = app.metadataCache.getFileCache(file)?.frontmatterPosition;
  if (!yaml) { new Notice("Brak sekcji YAML"); return; }
  const head = text.slice(0, yaml.end.offset);
  const body = text.slice(yaml.end.offset);
  const lines = head.split("\n");
  for (const [k, v] of Object.entries(updates)) {
    const rx = new RegExp(`^${k}:\\s*.*$`);
    const i = lines.findIndex(l => rx.test(l));
    if (i >= 0) lines[i] = `${k}: ${v}`;
    else lines.splice(lines.length - 1, 0, `${k}: ${v}`);
    fm[k] = v;
  }
  const updated = lines.join("\n") + body;
  await app.vault.modify(file, updated);
  dv.containerEl.querySelector("#pageOut").textContent = fm.Strona_PDF;
};

// --- Funkcja otwierająca PDF -------------------------------------------------
const openPdf = async () => {
  await navigator.clipboard.writeText(String(fm.Strona_PDF));
  // uruchamiamy naszą nową komendę Shell (ID trzeba dopasować)
  await app.commands.executeCommandById("obsidian-shellcommands:shell-command-open-pdf-with-save");
  await readSavedPage();               // po zamknięciu Acrobat
};

// --- Odczyt numeru strony z pliku tymczasowego -------------------------------
const readSavedPage = async () => {
  const tempPath = `${window.app.vault.adapter.basePath}\\..\\..\\..\\AppData\\Local\\Temp\\lumo_pdf_page.txt`;
  try {
    const pageStr = await app.vault.adapter.read(tempPath);
    const pageNum = parseInt(pageStr.trim(), 10);
    if (!isNaN(pageNum) && pageNum > 0) {
      await saveFm({ Strona_PDF: pageNum });
      new Notice(`Zapisano stronę ${pageNum}`);
    } else {
      new Notice("Nie udało się odczytać numeru strony.");
    }
  } catch (e) {
    console.error(e);
    new Notice("Plik tymczasowy nie znaleziony – Acrobat może być jeszcze otwarty.");
  }
};

// --- Funkcja tworząca przycisk -----------------------------------------------
const makeBtn = (label, onClick) => {
  const b = dv.el("button", label, { cls: "btn" });
  b.addEventListener("click", onClick);
  return b;
};

// --- Render UI ---------------------------------------------------------------
const box = dv.el("div", "", { cls: "ctrl-box" });
const rowPg = dv.el("div", "", { cls: "ctrl-row" }, box);
dv.el("span", "Strona PDF:", {}, rowPg);
makeBtn("[−]", () => saveFm({ Strona_PDF: Math.max(1, (fm.Strona_PDF || 1) - 1) })).style.marginLeft = "8px";
makeBtn("[+]", () => saveFm({ Strona_PDF: (fm.Strona_PDF || 1) + 1 }));
dv.el("span", fm.Strona_PDF, { attr: { id: "pageOut" }, style: "margin-left:12px; font-weight:bold;" }, rowPg);

const btn = makeBtn("Otwórz PDF", openPdf);
btn.style.marginTop = "10px";
box.appendChild(btn);
``````

AcroMonitor.ps1
```powershell
# AcroMonitor.ps1
$log = 'C:\Algorytmy\Wprowadzenie_do_algorytmów\AcroLastPage.txt'
$Acrobat = Get-Process Acrobat -ErrorAction SilentlyContinue
if (-not $Acrobat) { exit }

# Ścieżka do pliku PDF z rejestrem (Acrobat zapisuje w AppData)
$sessionFile = "$env:APPDATA\Adobe\Acrobat\DC\Viewer\Preferences\RecentFilesList.acrodata"

while ($true) {
    if (-not (Get-Process Acrobat -ErrorAction SilentlyContinue)) { break }
    if (Test-Path $sessionFile) {
        $data = Get-Content $sessionFile -Raw
        if ($data -match '"PageNumber":(\d+)') {
            $page = [int]$matches[1]
            $page | Out-File $log -Encoding utf8
        }
    }
    Start-Sleep -Seconds 5
}

```