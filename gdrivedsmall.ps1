<#
.SYNOPSIS
    Download file dari Google Drive, yang tidak memerlukan konfirmasi (file kecil).

.PARAMETER FileId
    ID file Google Drive (bukan URL penuh).

.PARAMETER Destination
    Lokasi dan nama file tujuan di lokal.

.EXAMPLE
    .\gdrivedsmall.ps1 "1aBcD12345xyz" "file.zip"
	Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$FileId,

    [Parameter(Mandatory = $true)]
    [string]$Destination
)

$url = "https://drive.google.com/uc?export=download&id=$fileId"

try {
    Write-Host "trying to download small file: $url"
	
	Invoke-WebRequest -Uri $url -OutFile $Destination

    Write-Host "✅ Download selesai: $Destination"
} catch {
    Write-Error "❌ Terjadi kesalahan saat download: $_"
}
