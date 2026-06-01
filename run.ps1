# 1. Activate the virtual environment
# The dot (.) at the start is crucial—it "dot-sources" the script into the current session
. .\.venv\Scripts\Activate.ps1

# 2. Define variables
$weights = "D:\workspace\htoo\yolo_container_model.pt"

$sources = @(
    "D:\workspace\htoo\data\adam\bangkok\2019\set1\phase_1\images",
    "D:\workspace\htoo\data\adam\bangkok\2019\set1\phase_2\images",
    "D:\workspace\htoo\data\adam\bangkok\2019\set2\phase_1\images",
    "D:\workspace\htoo\data\adam\bangkok\2019\set2\phase_2\images"
)

# 3. Loop through and run
foreach ($src in $sources) {
    Write-Host "--- Processing: $src ---" -ForegroundColor Cyan
    python detect.py --weights $weights --source $src --save-txt --save-conf --exist-ok --resume
}