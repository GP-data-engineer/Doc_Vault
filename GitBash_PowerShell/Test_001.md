name: Reset do przykładu 04 i 4_4_9
type: command
action: Workspace: Toggle pin // placeholder, zmień poniżej ręcznie wartości w YAML lub przyciskami


---


```
pwsh -NoLogo -ExecutionPolicy Bypass -Command "Invoke-Expression ('New_Item_ExerciseOrTest.ps1 -Chapter {0} -Name {1}_{2}_{3}' -f (Get-Content '{vault_path}/{relative_path}' | Select-String '^chapter:' | ForEach-Object {($_ -split ':')[1].Trim()}), (Get-Content '{vault_path}/{relative_path}' | Select-String '^name_a:' | ForEach-Object {($_ -split ':')[1].Trim()}), (Get-Content '{vault_path}/{relative_path}' | Select-String '^name_b:' | ForEach-Object {($_ -split ':')[1].Trim()}), (Get-Content '{vault_path}/{relative_path}' | Select-String '^name_c:' | ForEach-Object {($_ -split ':')[1].Trim()})))"
```