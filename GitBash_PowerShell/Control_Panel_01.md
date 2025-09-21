---
title: Sterownik zadań (PS/Py)
chapter: 4
name_a: 4
name_b: 5
name_c: 2
script_ps1: New_Item_ExerciseOrTest.ps1
---
# Panel sterowania

> Ustaw wartości przyciskami, a komenda zostanie zaktualizowana poniżej. Kopiuj jednym kliknięciem.

```dataviewjs
// Pobierz frontmatter
let fm = dv.current().file.frontmatter;

// Funkcje pomocnicze
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

const pad2 = n => String(n).padStart(2, "0");
const buildCmd = () => `${fm.script_ps1} -Chapter ${pad2(fm.chapter)} -Name ${fm.name_a}_${fm.name_b}_${fm.name_c}`;

const makeBtn = (label, onClick) => {
  const b = dv.el("button", label, { cls: "btn" });
  b.addEventListener("click", onClick);
  return b;
};

// Render UI
const box = dv.el("div", "", { cls: "ctrl-box" });
const row = dv.el("div", "", { cls: "ctrl-row" }, box);
dv.el("span", "Chapter:", {}, row);
makeBtn("−", () => saveFm({ chapter: Math.max(0, (fm.chapter||0)-1) })).style.marginLeft="8px";
makeBtn("+", () => saveFm({ chapter: (fm.chapter||0)+1 }));

const rowA = dv.el("div", "", { cls: "ctrl-row" }, box);
dv.el("span", "Name a_b_c:", {}, rowA);
makeBtn("a−", () => saveFm({ name_a: Math.max(0, (fm.name_a||0)-1) })).style.marginLeft="8px";
makeBtn("a+", () => saveFm({ name_a: (fm.name_a||0)+1 }));
makeBtn("b−", () => saveFm({ name_b: Math.max(0, (fm.name_b||0)-1) })).style.marginLeft="8px";
makeBtn("b+", () => saveFm({ name_b: (fm.name_b||0)+1 }));
makeBtn("c−", () => saveFm({ name_c: Math.max(0, (fm.name_c||0)-1) })).style.marginLeft="8px";
makeBtn("c+", () => saveFm({ name_c: (fm.name_c||0)+1 }));

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

```button
name: Uruchom Exercise
type: command
action: Shell commands: Run_Exercise
