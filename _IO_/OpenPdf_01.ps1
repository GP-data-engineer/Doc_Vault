param(
    [string]$PdfPath,
    [int]$Page = 1
)

$acrobat = "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"

if (-not (Test-Path $PdfPath)) {
    Write-Error "Nie znaleziono pliku PDF: $PdfPath"
    exit 1
}

Start-Process -FilePath $acrobat -ArgumentList "/A `"page=$Page`" `"$PdfPath`""
