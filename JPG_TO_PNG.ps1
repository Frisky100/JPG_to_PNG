Add-Type -AssemblyName System.Drawing

# Prompt user for input and output folders
$inputFolder = Read-Host "Enter the input folder path"
$outputFolder = Read-Host "Enter the output folder path"

# Check if the input folder exists
if (-not (Test-Path $inputFolder)) {
    Write-Host "The input folder does not exist. Please check the path and try again."
    return
}

# Create output folder if it doesn't exist
if (-not (Test-Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder | Out-Null
}

# Prompt user for desired image format
$desiredFormat = Read-Host "Enter the desired image format (e.g., png, jpeg, bmp, gif)"

# Check if the desired format is valid
$validFormats = @("png", "jpeg", "bmp", "gif")
if ($desiredFormat -notin $validFormats) {
    Write-Host "Invalid format. Supported formats are: png, jpeg, bmp, gif."
    return
}

# Get all image files (jpg, jpeg, png, etc.) in the input folder
$imageFiles = Get-ChildItem -Path $inputFolder -Recurse -File | Where-Object { 
    $_.Extension -match '(\.jpg|\.jpeg|\.png|\.bmp|\.gif|\.JPG|\.JPEG|\.PNG|\.BMP|\.GIF)$' 
}

if ($imageFiles.Count -eq 0) {
    Write-Host "No image files found in the folder."
    return
}

foreach ($file in $imageFiles) {
    try {
        # Load the image
        $image = [System.Drawing.Image]::FromFile($file.FullName)

        # Prepare output file path
        $outputFileName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name) + "." + $desiredFormat
        $outputPath = Join-Path -Path $outputFolder -ChildPath $outputFileName

        # Determine image format to save based on user input
        switch ($desiredFormat.ToLower()) {
            "png" { $image.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png) }
            "jpeg" { $image.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Jpeg) }
            "bmp" { $image.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Bmp) }
            "gif" { $image.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Gif) }
        }

        # Dispose the image after saving
        $image.Dispose()

        Write-Host "Successfully converted: $($file.Name) to $outputFileName"
    }
    catch {
        Write-Warning "Error converting $($file.Name): $_"
    }
}

Write-Host "Conversion completed!"
