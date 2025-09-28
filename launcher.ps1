# Ambil data JSON dari repo
$apps = Invoke-RestMethod "https://raw.githubusercontent.com/barokpina/Aplikasi-V1/main/apps.json"

Write-Host "=== Daftar Aplikasi ===" -ForegroundColor Cyan

# Tampilkan daftar aplikasi
for ($i = 0; $i -lt $apps.applications.Count; $i++) {
    Write-Host "$($i+1). $($apps.applications[$i].name)"
}

# Input pilihan
$choice = Read-Host "Pilih nomor aplikasi"
$index = [int]$choice - 1

if ($index -ge 0 -and $index -lt $apps.applications.Count) {
    $app = $apps.applications[$index]
    Write-Host "Membuka $($app.name)..." -ForegroundColor Green
    Start-Process $app.url
} else {
    Write-Host "Pilihan tidak valid!" -ForegroundColor Red
}
