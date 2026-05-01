# Semester Organization Scripts
A suite of bash scripts for semester/course directory automation and management 

## Directory structure produced:
```
~/school/
├── active/          ← active semester lives here (or named fall_2026/)
│   ├── CMPT383/
│   │   ├── notes/
│   │   ├── assignments/
│   │   └── lectures/
│   └── MATH200/
└── archive/
    ├── fall_2025/
    └── spring_2025/
```

## Usage:
1. From the project directory, run:
```
./new_semester.sh [base_dir] [semester_name]
```
Ex. 
```./new_semester.sh ~/Documents/School fall_2026```
- This will create an active folder containing the semester that was just set up from this command.
- You will be prompted to enter the course name to create the subdirectory for each course.

2. To archive a semester, run:
```
./archive_semester.sh [base_dir] [optional -c flag for compressing]
```
Ex. 
```./archive_semester.sh ~/Documents/School -c``` or ```./archive_semester.sh ~/Documents/School```
- Adding the optional c flag will result in the semester directory being compressed into a .zip in archive/
- If no optional c flag, the semester directory will simply be moved to archive/
- You will be asked to confirm if you want to archive all active semesters.