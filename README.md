# SmartHR - Complete HR & Payroll Management System

A full-featured, production-ready **Human Resource & Payroll Management System** built with **Python, Django, and modern responsive frontend technologies**.

---

## 📌 Project Architecture

### ⚙️ Backend
* **Language & Framework:** Python (3.10+ compatible), Django 5.0+ / 6.0+
* **Database:** Microsoft SQL Server (MSSQL via `mssql-django` and `pyodbc` connecting to database `myhrm`).
* **Core Application (`employees/`):**
  * **Role-Based Access Control (RBAC):** Admin, Employee, and Client authorization and dedicated portals.
  * **Employee Directory:** Full CRUD, profile records, department/designation assignments, document uploads, and credential management.
  * **Attendance & Shift Management:** Real-time clock in/out, shift assignments, monthly late arrival grace periods, overtime (OT) tracking, and CSV exports.
  * **Leave Management:** Multi-tier leave categories (Annual, Casual, Sick, Maternity, Paternity, Unpaid/LOP) with approval workflows and balance tracking.
  * **Payroll Engine:** Automated payslip generation with basic salary, allowances, deductions, and LOP penalties.
  * **Project & Goal Tracking:** Project milestones, employee assignment, progress tracking, and client visibility.
  * **Asset & Expense Management:** Asset allocation and expense reimbursement workflow with receipt attachments.
  * **Recruitment Portal:** Job vacancy postings and public career application pipeline with resume parsing/upload.
  * **HR Document Generation:** Automated dynamic letters (Experience, Appointment, Relieving) with print-ready views.

### 🎨 Frontend & UI Architecture
* **Modern 2-Column Responsive Layout:**
  * **Fixed Header (Navbar):** Pinned at `top: 0` (`position: fixed; z-index: 1000;`) with notification bell and user profile controls.
  * **Fixed Sidebar Menu with Independent Scrolling:** Desktop sidebars (`260px`) stay pinned at `top: 70px` with custom slim scrollbars (`max-height: calc(100vh - 85px); overflow-y: auto;`) so long menus are easily reachable without moving page content.
  * **Mobile Responsive Drawer:** Collapses into a full-height touch slide-out drawer on tablet/mobile screens (`<= 992px`) via the `☰` toggle.
* **Templating Engine:** Django Template Language (`DTL`) with modular base templates.
* **UI & Styling:** Custom modern responsive CSS with Bootstrap grid and utility classes.
* **Icons:** FontAwesome vector icon suites and custom SVG icons.
* **Interactive Components:** JavaScript, DataTables (instant search & pagination), FullCalendar (interactive holiday and attendance calendars).
* **Progressive Web App (PWA):** Service worker (`sw.js`) and Web App Manifest (`manifest.json`) support for installability on mobile devices and responsive touch interfaces.

---

## 🚀 Quick Setup & Installation Guide

Follow these steps to run the project on any computer (**Windows, macOS, or Linux**):

### 1. Prerequisites
* **Python 3.10 or higher** installed. Check via:
  ```bash
  python --version
  ```
  *(On macOS/Linux, you may use `python3` instead of `python`)*.

---

### 2. Open Terminal in the Project Directory
Navigate into the folder that contains `manage.py`:
```bash
cd myyhrmm
```

---

### 3. (Recommended) Create & Activate a Virtual Environment

* **On Windows (Command Prompt or PowerShell):**
  ```bash
  python -m venv venv
  venv\Scripts\activate
  ```

* **On macOS / Linux:**
  ```bash
  python3 -m venv venv
  source venv/bin/activate
  ```

---

### 4. Install Dependencies
Install all required packages from `requirements.txt`:
```bash
pip install -r requirements.txt
```

---

### 5. Setup Microsoft SQL Server Database

We have included a complete database script **`myhrm_database.sql`** that creates the `myhrm` database, all required tables, foreign keys, and seed user accounts (`admin`, `abi`, etc.).

#### Method A: Using SQL Server Management Studio (SSMS) (Recommended)
1. Open **SSMS** and connect to your SQL Server instance.
2. Open `myhrm_database.sql` (**File -> Open -> File...**).
3. Click **Execute** (or press **F5**).

#### Method B: Using Command Line (sqlcmd)
Run this command in terminal:
```bash
sqlcmd -S .\SQLEXPRESS -E -i myhrm_database.sql
```
*(Replace `.\SQLEXPRESS` with your SQL Server name if different, e.g. `localhost`)*.

#### Method C: Using Django Migrations
If you prefer building from an empty database:
```sql
CREATE DATABASE myhrm;
```
Then run:
```bash
python manage.py migrate
```

---

### 6. Start the Local Server
```bash
python manage.py runserver
```

You should see:
```text
Django version 6.0.6, using settings 'myhrm.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK (or CTRL-C).
```

Now open your web browser and navigate to:
👉 **[http://127.0.0.1:8000/](http://127.0.0.1:8000/)**

---

## 🔑 Ready-to-Use Login Credentials

The included MSSQL database (`myhrm_database.sql`) comes with pre-configured accounts for testing:

| Portal | URL Route | Username | Password | Role Description |
| :--- | :--- | :--- | :--- | :--- |
| **Admin Portal** | [`/admin-login/`](http://127.0.0.1:8000/admin-login/) | `admin` | `admin` | Full HR Administrator & Superuser privileges |
| **Employee Portal** | [`/login/`](http://127.0.0.1:8000/login/) | `arun` | `arun` | Employee account (Engineering / Manager) |
| **Employee Portal** | [`/login/`](http://127.0.0.1:8000/login/) | `abi` | `abi` | Employee account (Frontend Dev) |
| **Client Portal** | [`/client-login/`](http://127.0.0.1:8000/client-login/) | `client1` | `client1` | Client account (*Acme Global Corp* / John Doe) |
| **Client Portal** | [`/client-login/`](http://127.0.0.1:8000/client-login/) | `technoworld` | `technoworld` | Client account (*technoworld* / arunkk) |

> 💡 **Need a custom admin account?** You can create one anytime with:
> ```bash
> python manage.py createsuperuser
> ```

---

## 🌐 Available Portals & Navigation Routes

* **Unified / Employee Login:** `http://127.0.0.1:8000/login/`
* **Admin Dashboard:** `http://127.0.0.1:8000/admin-dashboard/`
* **Admin Login:** `http://127.0.0.1:8000/admin-login/`
* **Client Login:** `http://127.0.0.1:8000/client-login/`
* **Client Dashboard:** `http://127.0.0.1:8000/client-dashboard/`
* **Public Careers / Job Board:** `http://127.0.0.1:8000/careers/`
* **Django Admin Panel:** `http://127.0.0.1:8000/admin/`

---

## 📂 Project Directory Structure

```text
myyhrmm/
├── assets/                 # Frontend assets (CSS, JS, Fonts, Images, Plugins)
├── employees/              # Main Django Application
│   ├── static/             # Static files and PWA service worker (sw.js)
│   ├── templates/          # HTML templates (Admin, Employee, Client portals)
│   ├── admin.py            # Django Admin configuration
│   ├── models.py           # Database models (Employees, Shifts, Leaves, Payroll, etc.)
│   ├── urls.py             # App routing and URL endpoints
│   └── views.py            # Business logic and request handlers
├── media/                  # User uploads (Resumes, employee documents, receipts)
├── myhrm/                  # Core Project Configuration
│   ├── asgi.py             # ASGI deployment config
│   ├── settings.py         # Global Django settings
│   ├── urls.py             # Root URL routing
│   └── wsgi.py             # WSGI deployment config
├── datadump.json           # Database fixture / backup data
├── myhrm_database.sql      # Full Microsoft SQL Server setup & seed script
├── manage.py               # Django command-line utility
└── requirements.txt        # Python package dependencies
```

---

## ❓ Troubleshooting

1. **CSRF Verification Failed (403):**
   * Hard refresh your browser page using **`Ctrl + F5`** (or `Cmd + Shift + R` on Mac).
   * Or open the site in an **Incognito / Private Window** (`Ctrl + Shift + N`).
2. **Port 8000 already in use:**
   * Start the server on a different port (e.g. 8080):
     ```bash
     python manage.py runserver 8080
     ```
3. **Missing dependencies:**
   * Ensure you have activated your virtual environment before running `pip install -r requirements.txt`.
