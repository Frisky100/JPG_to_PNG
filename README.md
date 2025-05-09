# Image Format Converter Script (PowerShell)

This PowerShell script allows you to batch convert images in a specified folder from one format to another. You can choose the input and output folders, as well as the desired output image format (e.g., PNG, JPEG, BMP, GIF).

## Features

- **Batch conversion**: Converts all image files (JPG, JPEG, PNG, BMP, GIF) in the selected input folder.
- **User prompts**: Choose the input folder, output folder, and desired output format interactively.
- **Supports common image formats**: BMP, JPEG, PNG, GIF, TIFF, WMF, EMF.
- **Error handling**: If a file can't be processed, a warning will be displayed.

## Supported Image Formats

- **BMP** - Bitmap Image (`.bmp`)
- **GIF** - Graphics Interchange Format (`.gif`)
- **JPEG** - Joint Photographic Experts Group (`.jpeg`, `.jpg`)
- **PNG** - Portable Network Graphics (`.png`)
- **TIFF** - Tagged Image File Format (`.tiff`, `.tif`)
- **WMF** - Windows Metafile (`.wmf`)
- **EMF** - Enhanced Metafile (`.emf`)

You can choose from these formats when prompted by the script.

## Requirements

- PowerShell (comes pre-installed with Windows)
- .NET Framework (System.Drawing) - This is used for image manipulation and comes pre-installed on most systems running Windows.

## Installation

1. **Clone the repository** or **download** the script file (`JPG_to_PNG.ps1`).
   
   ```bash
   git clone https://github.com/Frisky100/JPG_to_PNG.git
