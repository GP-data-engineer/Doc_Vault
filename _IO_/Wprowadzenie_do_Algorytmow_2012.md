---
title: Wprowadzenie_do_Algorytmow_(2012)
author: CLRS
tags:
  - notatka
pdf_path: C:/Algorytmy/Wprowadzenie do algorytmów/Wprowadzenie do algorytmów_(2012).pdf
Strona_PDF: 76
---

## 📑 Dokument

```dataviewjs
// --- Pobranie frontmatter ---
const fm = dv.current();
const pdf = fm.pdf_path;

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

// --- Funkcja otwierająca PDF przez PowerShell ---
const openPdf = () => {
  const cmd = `powershell -ExecutionPolicy Bypass -File "C:/GitHub/Repo/Scripts/src/OpenPdf.ps1" -PdfPath "${pdf}" -Page ${fm.Strona_PDF}`;
  // Wymaga pluginu "Shell commands" w Obsidianie
  app.commands.executeCommandById("shell-commands.run", { command: cmd });
};

// --- Funkcja tworząca przycisk ---
const makeBtn = (label, onClick) => {
  const b = dv.el("button", label, { cls: "btn" });
  b.addEventListener("click", onClick);
  return b;
};

// --- Render UI ---
const box = dv.el("div", "", { cls: "ctrl-box" });

// Wiersz do zmiany strony
const rowPg = dv.el("div", "", { cls: "ctrl-row" }, box);
dv.el("span", "Strona PDF:", {}, rowPg);
makeBtn("[−]", () => saveFm({ Strona_PDF: Math.max(1, (fm.Strona_PDF||1)-1) })).style.marginLeft="8px";
makeBtn("[+]", () => saveFm({ Strona_PDF: (fm.Strona_PDF||1)+1 }));
dv.el("span", fm.Strona_PDF, { attr: { id: "pageOut" }, style: "margin-left:12px; font-weight:bold;" }, rowPg);

// Przycisk otwierający PDF
const btn = makeBtn("Otwórz PDF", openPdf);
btn.style.marginTop = "10px";
box.appendChild(btn);
```

---

[Wprowadzenie_do_algorytmów_(2012)](file:///C:/Algorytmy/Wprowadzenie%20do%20algorytmów/Wprowadzenie%20do%20algorytmów_(2012).pdf)


