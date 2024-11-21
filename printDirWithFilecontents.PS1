# Define the directory and output file
$directory = ".\ScanFiles"
$outputFile = ".\Output\out.txt"

# Directory should look something like this:
# Parent Folder
# .
# ├───\ScanFiles\
# ├───\Output\
# └───\printDirWithFilecontents.PS1

# Get all items and process each file
Get-ChildItem -Path $directory -Recurse | ForEach-Object{

    # Append the file path to the output file
    $_.FullName | Out-File -FilePath $outputFile -Append

    $excludedExtensions = @(".jpg", ".db", ".dll", ".db-shm", ".db-wal", ".exe", ".png", ".canvas")
        #   ^These mess up the output
    $excludedExtensions += @(".css", ".log", ".js")
        #   ^Comment out this line if you want to keep these files, or add to it if you want

    # If it's a file, append its content to the output file
    if ($_.Extension -notin $excludedExtensions) {
        if (-not $_.PSIsContainer) {
          Get-Content -Path $_.FullName | Out-File -FilePath $outputFile -Append
        }
    }

    #  separator for readability
    "---- End of File ----`n" | Out-File -FilePath $outputFile -Append
}

# Process is complete
"Folder listing and file contents have been written to $outputFile"

# ⬇️ Uncomment this if you need to keep the terminal open, waits for user input
# Read-Host -Prompt "Press Enter to exit"
