# CSC520: Principle of Operating System hi

This repository contains the source code, automated shell scripts, and documentation for **Assignment 1 (Linux Commands and Shell Scripting)** as part of the CSC520 course curriculum at Universiti Teknologi MARA (UiTM) Cawangan Terengganu, Kampus Kuala Terengganu.

## 📌 Project Overview
The objective of this assignment is to demonstrate practical competency in core Linux system administration tasks, automated directory management, environment reporting, file-system permissions, and robust Bash scripting workflows.

## 📁 Repository Structure
* `scripts/system_info.sh` — Collects and exports core system architecture metadata, active process listings, and hardware resource utilization metrics.
* `scripts/file_organizer.sh` — Automatically categorizes system files into dedicated directories based on file extension patterns.
* `scripts/create_student_folders.sh` — A defensive automation utility that parses an external student roster dataset to spin up isolated, multi-tiered project submission directories.

---

## 🚀 Script Detailed Specifications & Usage

### 1. System Information Monitor (`system_info.sh`)
Monitors environment behaviors, active resource utilization, and dumps the summarized diagnostic snapshot into persistent local file systems.
* **Key Features:** Custom welcome layouts, dynamic timestamps, storage/memory telemetry monitoring, and CPU top-process tracking.
* **Log Output:** Automatically appends data to `logs/system_log_YYYYMMDD.log`.
* **Execution:**
    ```bash
    chmod +x scripts/system_info.sh
    ./scripts/system_info.sh
    ```

### 2. Automated File Organizer (`file_organizer.sh`)
An automation utility designed to clean cluttered workspaces by sorting miscellaneous assets into clean logical partitions.
* **Routing Rules:**
    * `.txt`, `.md`, `.pdf` ➡️ `Documents/`
    * `.csv`, `.conf` ➡️ `Others/`
* **Execution:**
    ```bash
    chmod +x scripts/file_organizer.sh
    ./scripts/file_organizer.sh
    ```

### 3. Student Submissions Directory Generator (`create_student_folders.sh`)
An advanced data-driven batch folder provisioner featuring input checking, strict string sanitation algorithms, and structured telemetry reporting.
* **Key Features:**
    * Built-in input verification checking (gracefully exits if the reference roster file is missing).
    * Sanitizes dynamic text data by stripping out whitespace patterns and translating them into standard snake_case underscores (`_`).
    * Omits incomplete or malformed source list lines automatically during execution loop processing.
    * Provides full runtime reporting detailing totals of processed profiles and unique group segments populated.
* **Logs Tracking:** Records directory creations inside `logs/folder_creation.log` complete with high-precision runtime timestamps.
* **Execution:**
    ```bash
    chmod +x scripts/create_student_folders.sh
    ./scripts/create_student_folders.sh
    ```

---

## 🛠️ Environmental Prerequisites
Ensure your local Linux environment has the following software utilities installed to guarantee complete compatibility with all script calls and reporting dependencies:
* **Shell Interpreter:** `bash` (version 4.0 or newer)
* **Required Packages:** `htop`, `tree`, `neofetch`, `git`, `curl`, `wget`

To quickly provision missing requirements on Debian/Ubuntu-derived distributions, run:
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install htop tree neofetch git curl wget -y
