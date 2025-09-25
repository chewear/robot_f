# Robot Framework Test Suite

This repository contains a Robot Framework-based test automation suite. It is organized into the following main directories:

- `Library/` — Custom Python libraries for Robot Framework.
- `Resources/` — Resource files containing keywords and reusable components.
- `Tests/` — Robot Framework test cases.
- `Variables/` — Python files for variable management.
- `Results/` — Output directory for test results (must be created before running tests).

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/chewear/robot_f
cd robot_f
```

### 2. Set Up Python Virtual Environment

#### On Linux/macOS:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

#### On Windows (Command Prompt):

```bat
python -m venv .venv
.venv\Scripts\activate
```

#### On Windows (PowerShell):

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
```

### 3. Install Dependencies

With the virtual environment activated, run:

```bash
pip install --upgrade pip
pip install robotframework
pip install robotframework-seleniumlibrary selenium
```

### 4. Create Results Directory

Before running tests, ensure the `Results` directory exists:

```bash
mkdir Results
```

### 5. Run the Tests

From the project root, run:

```bash
robot -d Results Tests/test.robot
```

- `-d Results` specifies the output directory for logs and reports.
- You can run other test files by changing the path after `robot`.

## Project Structure

```
Library/           # Custom Python libraries
Resources/         # Robot Framework resource files
Tests/             # Test cases (.robot files)
Variables/         # Python variable files
Results/           # Test output (logs, reports, screenshots)
```

## Notes

- Make sure you have Python 3.7+ installed.
- The `Results` folder is required for output files.
- For more information on Robot Framework, visit: https://robotframework.org/

## Developers Note

- Made by Bob Myron D. Reyes
- Hehe ^.^
