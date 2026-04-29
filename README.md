# bash-scripts
A suite of bash scripts for semester/course directory automation and management 

## Directory structure produced:
```
~/school/
├── current/          ← active semester lives here (or named fall_2026/)
│   ├── CMPT383/
│   │   ├── notes/
│   │   ├── assignments/
│   │   └── lectures/
│   └── MATH200/
└── archive/
    ├── fall_2025/
    └── spring_2025/
```
* will be adding current and archive feature 

## Usage:
1. From the project directory, run:
```
./new_semester.sh [base_dir] [semester_name]
```
Ex. 
```./new_semester.sh ~/Documents/School fall_2026```

2. Follow prompts as given.