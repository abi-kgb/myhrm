-- =====================================================================
-- SmartHR / MyHRM Complete Database Script for Microsoft SQL Server
-- Generated: 2026-11-20 16:25:55
-- =====================================================================

USE [master];
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'myhrm')
BEGIN
    CREATE DATABASE [myhrm];
    PRINT 'Database [myhrm] created successfully.';
END
GO

USE [myhrm];
GO

-- Temporarily disable constraints during setup
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
GO

-- --------------------------------------------------
-- Table structure for [auth_group]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[auth_group]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[auth_group] (
    [id] [int] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](150) NOT NULL,
    CONSTRAINT [PK__auth_gro__3213E83F96D11A2E] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [auth_group_permissions]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[auth_group_permissions]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[auth_group_permissions] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [group_id] [int] NOT NULL,
    [permission_id] [int] NOT NULL,
    CONSTRAINT [PK__auth_gro__3213E83F099085C0] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [auth_permission]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[auth_permission]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[auth_permission] (
    [id] [int] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](255) NOT NULL,
    [content_type_id] [int] NOT NULL,
    [codename] [nvarchar](100) NOT NULL,
    CONSTRAINT [PK__auth_per__3213E83F4B0627F7] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [auth_user]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[auth_user]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[auth_user] (
    [id] [int] IDENTITY(1,1) NOT NULL,
    [password] [nvarchar](128) NOT NULL,
    [last_login] [datetimeoffset](7) NULL,
    [is_superuser] [bit] NOT NULL,
    [username] [nvarchar](150) NOT NULL,
    [first_name] [nvarchar](150) NOT NULL,
    [last_name] [nvarchar](150) NOT NULL,
    [email] [nvarchar](254) NOT NULL,
    [is_staff] [bit] NOT NULL,
    [is_active] [bit] NOT NULL,
    [date_joined] [datetimeoffset](7) NOT NULL,
    CONSTRAINT [PK__auth_use__3213E83F0D7FDC81] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [auth_user_groups]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[auth_user_groups]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[auth_user_groups] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [user_id] [int] NOT NULL,
    [group_id] [int] NOT NULL,
    CONSTRAINT [PK__auth_use__3213E83F0F5F67D0] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [auth_user_user_permissions]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[auth_user_user_permissions]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[auth_user_user_permissions] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [user_id] [int] NOT NULL,
    [permission_id] [int] NOT NULL,
    CONSTRAINT [PK__auth_use__3213E83F5DDF6153] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [django_admin_log]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[django_admin_log]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[django_admin_log] (
    [id] [int] IDENTITY(1,1) NOT NULL,
    [action_time] [datetimeoffset](7) NOT NULL,
    [object_id] [nvarchar](max) NULL,
    [object_repr] [nvarchar](200) NOT NULL,
    [action_flag] [smallint] NOT NULL,
    [change_message] [nvarchar](max) NOT NULL,
    [content_type_id] [int] NULL,
    [user_id] [int] NOT NULL,
    CONSTRAINT [PK__django_a__3213E83F49A82184] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [django_content_type]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[django_content_type]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[django_content_type] (
    [id] [int] IDENTITY(1,1) NOT NULL,
    [app_label] [nvarchar](100) NOT NULL,
    [model] [nvarchar](100) NOT NULL,
    CONSTRAINT [PK__django_c__3213E83F1C6BF1BD] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [django_migrations]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[django_migrations]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[django_migrations] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [app] [nvarchar](255) NOT NULL,
    [name] [nvarchar](255) NOT NULL,
    [applied] [datetimeoffset](7) NOT NULL,
    CONSTRAINT [PK__django_m__3213E83F8A6176C1] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [django_session]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[django_session]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[django_session] (
    [session_key] [nvarchar](40) NOT NULL,
    [session_data] [nvarchar](max) NOT NULL,
    [expire_date] [datetimeoffset](7) NOT NULL,
    CONSTRAINT [PK__django_s__B3BA0F1F040017EA] PRIMARY KEY CLUSTERED ([session_key])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_activitylog]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_activitylog]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_activitylog] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [action] [nvarchar](255) NOT NULL,
    [user_id] [int] NULL,
    [details] [nvarchar](max) NULL,
    [ip_address] [nvarchar](39) NULL,
    [module] [nvarchar](100) NOT NULL,
    [timestamp] [datetimeoffset](7) NOT NULL,
    CONSTRAINT [PK__employee__3213E83FA90B03F1] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_asset]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_asset]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_asset] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](200) NOT NULL,
    [asset_id] [nvarchar](100) NOT NULL,
    [category] [nvarchar](100) NOT NULL,
    [status] [nvarchar](30) NOT NULL,
    [assigned_date] [date] NULL,
    [return_date] [date] NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [assigned_to_id] [bigint] NULL,
    CONSTRAINT [PK__employee__3213E83F7A811303] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_attendance]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_attendance]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_attendance] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [date] [date] NOT NULL,
    [clock_in] [time](7) NOT NULL,
    [clock_out] [time](7) NULL,
    [employee_id] [bigint] NOT NULL,
    [status] [nvarchar](20) NOT NULL,
    [late_minutes] [int] NOT NULL,
    [overtime_minutes] [int] NOT NULL,
    CONSTRAINT [PK__employee__3213E83F400B18F7] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_client]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_client]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_client] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [company_name] [nvarchar](200) NOT NULL,
    [client_id] [nvarchar](50) NULL,
    [contact_person] [nvarchar](150) NOT NULL,
    [email] [nvarchar](254) NOT NULL,
    [phone] [nvarchar](20) NULL,
    [status] [nvarchar](20) NOT NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [user_id] [int] NULL,
    CONSTRAINT [PK__employee__3213E83FA0F0325F] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_department]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_department]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_department] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](100) NOT NULL,
    [description] [nvarchar](max) NULL,
    [head_id] [bigint] NULL,
    CONSTRAINT [PK__employee__3213E83FF77D6231] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_designation]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_designation]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_designation] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](100) NOT NULL,
    [base_salary] [numeric](10, 2) NOT NULL,
    [department_id] [bigint] NOT NULL,
    CONSTRAINT [PK__employee__3213E83FA4F1EA7B] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_employee]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_employee]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_employee] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [department_old] [nvarchar](100) NULL,
    [role_old] [nvarchar](100) NULL,
    [phone] [nvarchar](20) NULL,
    [hire_date] [date] NOT NULL,
    [salary] [numeric](10, 2) NOT NULL,
    [is_company_admin] [bit] NOT NULL,
    [user_id] [int] NOT NULL,
    [annual_leave_balance] [int] NOT NULL,
    [casual_leave_balance] [int] NOT NULL,
    [sick_leave_balance] [int] NOT NULL,
    [address] [nvarchar](max) NULL,
    [date_of_birth] [date] NULL,
    [designation_old] [nvarchar](150) NULL,
    [employee_id_code] [nvarchar](50) NULL,
    [gender] [nvarchar](10) NULL,
    [ot_hourly_rate] [numeric](10, 2) NOT NULL,
    [shift_id] [bigint] NULL,
    [grace_period_minutes] [int] NOT NULL,
    [maternity_leave_balance] [int] NOT NULL,
    [paternity_leave_balance] [int] NOT NULL,
    [role] [nvarchar](100) NOT NULL,
    [department_id] [bigint] NULL,
    [designation_id] [bigint] NULL,
    CONSTRAINT [PK__employee__3213E83F4831A505] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_employeedocument]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_employeedocument]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_employeedocument] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](200) NOT NULL,
    [document_type] [nvarchar](50) NOT NULL,
    [file] [nvarchar](100) NOT NULL,
    [uploaded_at] [datetimeoffset](7) NOT NULL,
    [employee_id] [bigint] NOT NULL,
    CONSTRAINT [PK__employee__3213E83F964AC7E8] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_event]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_event]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_event] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [title] [nvarchar](255) NOT NULL,
    [description] [nvarchar](max) NULL,
    [event_type] [nvarchar](50) NOT NULL,
    [start_time] [datetimeoffset](7) NOT NULL,
    [end_time] [datetimeoffset](7) NOT NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [created_by_id] [int] NULL,
    CONSTRAINT [PK__employee__3213E83F1571A21D] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_expense]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_expense]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_expense] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [title] [nvarchar](200) NOT NULL,
    [amount] [numeric](10, 2) NOT NULL,
    [category] [nvarchar](100) NOT NULL,
    [receipt] [nvarchar](100) NULL,
    [status] [nvarchar](30) NOT NULL,
    [date_submitted] [datetimeoffset](7) NOT NULL,
    [date_processed] [datetimeoffset](7) NULL,
    [employee_id] [bigint] NOT NULL,
    [medical_report] [nvarchar](100) NULL,
    [prescription] [nvarchar](100) NULL,
    CONSTRAINT [PK__employee__3213E83F645BE75F] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_goaltracking]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_goaltracking]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_goaltracking] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [subject] [nvarchar](200) NOT NULL,
    [start_date] [date] NOT NULL,
    [end_date] [date] NOT NULL,
    [description] [nvarchar](max) NULL,
    [status] [nvarchar](20) NOT NULL,
    [progress] [int] NOT NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [project_id] [bigint] NULL,
    CONSTRAINT [PK__employee__3213E83F339C1C15] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_holiday]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_holiday]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_holiday] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](200) NOT NULL,
    [date] [date] NOT NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [type] [nvarchar](20) NOT NULL,
    CONSTRAINT [PK__employee__3213E83FF34D78D3] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_hrletter]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_hrletter]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_hrletter] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [letter_type] [nvarchar](50) NOT NULL,
    [title] [nvarchar](255) NOT NULL,
    [reference_number] [nvarchar](100) NOT NULL,
    [issue_date] [date] NOT NULL,
    [content] [nvarchar](max) NOT NULL,
    [signatory_name] [nvarchar](150) NOT NULL,
    [signatory_title] [nvarchar](150) NOT NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [created_by_id] [int] NULL,
    [employee_id] [bigint] NOT NULL,
    CONSTRAINT [PK__employee__3213E83F5DC4246A] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_jobapplication]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_jobapplication]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_jobapplication] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [candidate_name] [nvarchar](150) NOT NULL,
    [candidate_email] [nvarchar](254) NOT NULL,
    [candidate_phone] [nvarchar](20) NOT NULL,
    [resume_url] [nvarchar](500) NULL,
    [cover_letter] [nvarchar](max) NOT NULL,
    [status] [nvarchar](30) NOT NULL,
    [applied_at] [datetimeoffset](7) NOT NULL,
    [job_id] [bigint] NOT NULL,
    [resume_pdf] [nvarchar](100) NULL,
    CONSTRAINT [PK__employee__3213E83F6448FFC9] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_jobposting]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_jobposting]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_jobposting] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [title] [nvarchar](200) NOT NULL,
    [description] [nvarchar](max) NOT NULL,
    [requirements] [nvarchar](max) NOT NULL,
    [location] [nvarchar](100) NOT NULL,
    [salary_range] [nvarchar](100) NULL,
    [is_active] [bit] NOT NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    CONSTRAINT [PK__employee__3213E83FDD2343B5] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_leaverequest]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_leaverequest]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_leaverequest] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [leave_type] [nvarchar](20) NOT NULL,
    [start_date] [date] NOT NULL,
    [end_date] [date] NOT NULL,
    [reason] [nvarchar](max) NOT NULL,
    [status] [nvarchar](20) NOT NULL,
    [employee_id] [bigint] NOT NULL,
    [lop_days] [int] NOT NULL,
    CONSTRAINT [PK__employee__3213E83F69E74F2B] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_notification]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_notification]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_notification] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [title] [nvarchar](200) NOT NULL,
    [message] [nvarchar](max) NOT NULL,
    [link] [nvarchar](500) NULL,
    [is_read] [bit] NOT NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [user_id] [int] NOT NULL,
    CONSTRAINT [PK__employee__3213E83FF348B538] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_payslip]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_payslip]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_payslip] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [month_year] [nvarchar](50) NOT NULL,
    [basic_salary] [numeric](10, 2) NOT NULL,
    [allowances] [numeric](10, 2) NOT NULL,
    [deductions] [numeric](10, 2) NOT NULL,
    [net_salary] [numeric](10, 2) NOT NULL,
    [status] [nvarchar](20) NOT NULL,
    [generated_at] [datetimeoffset](7) NOT NULL,
    [employee_id] [bigint] NOT NULL,
    [esi_deduction] [numeric](10, 2) NOT NULL,
    [hra] [numeric](10, 2) NOT NULL,
    [pf_deduction] [numeric](10, 2) NOT NULL,
    [tax_deduction] [numeric](10, 2) NOT NULL,
    [travel_allowance] [numeric](10, 2) NOT NULL,
    [lop_days] [int] NOT NULL,
    [lop_deduction] [numeric](10, 2) NOT NULL,
    [late_penalty_lop_days] [numeric](5, 2) NOT NULL,
    [severe_late_incidents] [int] NOT NULL,
    [total_late_mins] [int] NOT NULL,
    CONSTRAINT [PK__employee__3213E83FFD7A0346] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_performancereview]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_performancereview]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_performancereview] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [review_period] [nvarchar](100) NOT NULL,
    [rating] [numeric](3, 1) NOT NULL,
    [goals] [nvarchar](max) NULL,
    [feedback] [nvarchar](max) NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [employee_id] [bigint] NOT NULL,
    [reviewer_id] [bigint] NULL,
    CONSTRAINT [PK__employee__3213E83F802D4EFF] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_personalnote]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_personalnote]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_personalnote] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [title] [nvarchar](255) NOT NULL,
    [note] [nvarchar](max) NULL,
    [date] [date] NOT NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [user_id] [int] NOT NULL,
    CONSTRAINT [PK__employee__3213E83F11658993] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_project]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_project]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_project] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](200) NOT NULL,
    [description] [nvarchar](max) NULL,
    [deadline] [date] NULL,
    [progress] [int] NOT NULL,
    [status] [nvarchar](20) NOT NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [client_id] [bigint] NULL,
    CONSTRAINT [PK__employee__3213E83FE50F7E5D] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_project_assigned_employees]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_project_assigned_employees]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_project_assigned_employees] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [project_id] [bigint] NOT NULL,
    [employee_id] [bigint] NOT NULL,
    CONSTRAINT [PK__employee__3213E83F2C5436CC] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_projectupdate]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_projectupdate]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_projectupdate] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [message] [nvarchar](max) NOT NULL,
    [is_admin] [bit] NOT NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [author_id] [int] NOT NULL,
    [project_id] [bigint] NOT NULL,
    CONSTRAINT [PK__employee__3213E83F990407C4] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_shift]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_shift]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_shift] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](100) NOT NULL,
    [start_time] [time](7) NOT NULL,
    [end_time] [time](7) NOT NULL,
    CONSTRAINT [PK__employee__3213E83F40D1A0AB] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_shiftrequest]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_shiftrequest]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_shiftrequest] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [reason] [nvarchar](max) NOT NULL,
    [status] [nvarchar](20) NOT NULL,
    [created_at] [datetimeoffset](7) NOT NULL,
    [employee_id] [bigint] NOT NULL,
    [requested_shift_id] [bigint] NOT NULL,
    CONSTRAINT [PK__employee__3213E83F09C95851] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_training]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_training]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_training] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [title] [nvarchar](200) NOT NULL,
    [description] [nvarchar](max) NULL,
    [trainer] [nvarchar](150) NULL,
    [start_date] [date] NULL,
    [end_date] [date] NULL,
    [is_online] [bit] NOT NULL,
    [status] [nvarchar](20) NOT NULL,
    CONSTRAINT [PK__employee__3213E83FAE1EBF71] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- --------------------------------------------------
-- Table structure for [employees_trainingenrollment]
-- --------------------------------------------------
IF OBJECT_ID(N'dbo.[employees_trainingenrollment]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[employees_trainingenrollment] (
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [enrolled_at] [datetimeoffset](7) NOT NULL,
    [completed] [bit] NOT NULL,
    [certificate_url] [nvarchar](500) NULL,
    [employee_id] [bigint] NOT NULL,
    [training_id] [bigint] NOT NULL,
    CONSTRAINT [PK__employee__3213E83F7F2223CB] PRIMARY KEY CLUSTERED ([id])
);
END
GO

-- =====================================================================
-- DATA SEEDING
-- =====================================================================

-- Data for [auth_permission] (128 rows)
SET IDENTITY_INSERT [dbo].[auth_permission] ON;
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (1, N'Can add log entry', 1, N'add_logentry');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (2, N'Can change log entry', 1, N'change_logentry');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (3, N'Can delete log entry', 1, N'delete_logentry');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (4, N'Can view log entry', 1, N'view_logentry');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (5, N'Can add permission', 3, N'add_permission');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (6, N'Can change permission', 3, N'change_permission');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (7, N'Can delete permission', 3, N'delete_permission');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (8, N'Can view permission', 3, N'view_permission');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (9, N'Can add group', 2, N'add_group');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (10, N'Can change group', 2, N'change_group');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (11, N'Can delete group', 2, N'delete_group');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (12, N'Can view group', 2, N'view_group');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (13, N'Can add user', 4, N'add_user');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (14, N'Can change user', 4, N'change_user');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (15, N'Can delete user', 4, N'delete_user');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (16, N'Can view user', 4, N'view_user');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (17, N'Can add content type', 5, N'add_contenttype');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (18, N'Can change content type', 5, N'change_contenttype');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (19, N'Can delete content type', 5, N'delete_contenttype');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (20, N'Can view content type', 5, N'view_contenttype');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (21, N'Can add session', 6, N'add_session');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (22, N'Can change session', 6, N'change_session');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (23, N'Can delete session', 6, N'delete_session');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (24, N'Can view session', 6, N'view_session');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (25, N'Can add employee', 13, N'add_employee');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (26, N'Can change employee', 13, N'change_employee');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (27, N'Can delete employee', 13, N'delete_employee');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (28, N'Can view employee', 13, N'view_employee');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (29, N'Can add attendance', 9, N'add_attendance');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (30, N'Can change attendance', 9, N'change_attendance');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (31, N'Can delete attendance', 9, N'delete_attendance');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (32, N'Can view attendance', 9, N'view_attendance');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (33, N'Can add leave request', 22, N'add_leaverequest');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (34, N'Can change leave request', 22, N'change_leaverequest');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (35, N'Can delete leave request', 22, N'delete_leaverequest');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (36, N'Can view leave request', 22, N'view_leaverequest');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (37, N'Can add job posting', 21, N'add_jobposting');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (38, N'Can change job posting', 21, N'change_jobposting');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (39, N'Can delete job posting', 21, N'delete_jobposting');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (40, N'Can view job posting', 21, N'view_jobposting');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (41, N'Can add job application', 20, N'add_jobapplication');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (42, N'Can change job application', 20, N'change_jobapplication');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (43, N'Can delete job application', 20, N'delete_jobapplication');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (44, N'Can view job application', 20, N'view_jobapplication');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (45, N'Can add payslip', 24, N'add_payslip');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (46, N'Can change payslip', 24, N'change_payslip');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (47, N'Can delete payslip', 24, N'delete_payslip');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (48, N'Can view payslip', 24, N'view_payslip');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (49, N'Can add training', 31, N'add_training');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (50, N'Can change training', 31, N'change_training');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (51, N'Can delete training', 31, N'delete_training');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (52, N'Can view training', 31, N'view_training');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (53, N'Can add performance review', 25, N'add_performancereview');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (54, N'Can change performance review', 25, N'change_performancereview');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (55, N'Can delete performance review', 25, N'delete_performancereview');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (56, N'Can view performance review', 25, N'view_performancereview');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (57, N'Can add training enrollment', 32, N'add_trainingenrollment');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (58, N'Can change training enrollment', 32, N'change_trainingenrollment');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (59, N'Can delete training enrollment', 32, N'delete_trainingenrollment');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (60, N'Can view training enrollment', 32, N'view_trainingenrollment');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (61, N'Can add client', 10, N'add_client');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (62, N'Can change client', 10, N'change_client');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (63, N'Can delete client', 10, N'delete_client');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (64, N'Can view client', 10, N'view_client');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (65, N'Can add goal tracking', 17, N'add_goaltracking');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (66, N'Can change goal tracking', 17, N'change_goaltracking');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (67, N'Can delete goal tracking', 17, N'delete_goaltracking');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (68, N'Can view goal tracking', 17, N'view_goaltracking');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (69, N'Can add holiday', 18, N'add_holiday');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (70, N'Can change holiday', 18, N'change_holiday');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (71, N'Can delete holiday', 18, N'delete_holiday');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (72, N'Can view holiday', 18, N'view_holiday');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (73, N'Can add project', 27, N'add_project');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (74, N'Can change project', 27, N'change_project');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (75, N'Can delete project', 27, N'delete_project');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (76, N'Can view project', 27, N'view_project');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (77, N'Can add project update', 28, N'add_projectupdate');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (78, N'Can change project update', 28, N'change_projectupdate');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (79, N'Can delete project update', 28, N'delete_projectupdate');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (80, N'Can view project update', 28, N'view_projectupdate');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (81, N'Can add employee document', 14, N'add_employeedocument');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (82, N'Can change employee document', 14, N'change_employeedocument');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (83, N'Can delete employee document', 14, N'delete_employeedocument');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (84, N'Can view employee document', 14, N'view_employeedocument');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (85, N'Can add notification', 23, N'add_notification');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (86, N'Can change notification', 23, N'change_notification');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (87, N'Can delete notification', 23, N'delete_notification');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (88, N'Can view notification', 23, N'view_notification');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (89, N'Can add shift', 29, N'add_shift');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (90, N'Can change shift', 29, N'change_shift');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (91, N'Can delete shift', 29, N'delete_shift');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (92, N'Can view shift', 29, N'view_shift');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (93, N'Can add shift request', 30, N'add_shiftrequest');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (94, N'Can change shift request', 30, N'change_shiftrequest');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (95, N'Can delete shift request', 30, N'delete_shiftrequest');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (96, N'Can view shift request', 30, N'view_shiftrequest');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (97, N'Can add asset', 8, N'add_asset');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (98, N'Can change asset', 8, N'change_asset');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (99, N'Can delete asset', 8, N'delete_asset');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (100, N'Can view asset', 8, N'view_asset');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (101, N'Can add expense', 16, N'add_expense');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (102, N'Can change expense', 16, N'change_expense');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (103, N'Can delete expense', 16, N'delete_expense');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (104, N'Can view expense', 16, N'view_expense');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (105, N'Can add department', 11, N'add_department');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (106, N'Can change department', 11, N'change_department');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (107, N'Can delete department', 11, N'delete_department');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (108, N'Can view department', 11, N'view_department');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (109, N'Can add designation', 12, N'add_designation');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (110, N'Can change designation', 12, N'change_designation');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (111, N'Can delete designation', 12, N'delete_designation');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (112, N'Can view designation', 12, N'view_designation');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (113, N'Can add activity log', 7, N'add_activitylog');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (114, N'Can change activity log', 7, N'change_activitylog');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (115, N'Can delete activity log', 7, N'delete_activitylog');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (116, N'Can view activity log', 7, N'view_activitylog');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (117, N'Can add event', 15, N'add_event');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (118, N'Can change event', 15, N'change_event');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (119, N'Can delete event', 15, N'delete_event');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (120, N'Can view event', 15, N'view_event');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (121, N'Can add hr letter', 19, N'add_hrletter');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (122, N'Can change hr letter', 19, N'change_hrletter');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (123, N'Can delete hr letter', 19, N'delete_hrletter');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (124, N'Can view hr letter', 19, N'view_hrletter');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (125, N'Can add personal note', 26, N'add_personalnote');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (126, N'Can change personal note', 26, N'change_personalnote');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (127, N'Can delete personal note', 26, N'delete_personalnote');
INSERT INTO [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (128, N'Can view personal note', 26, N'view_personalnote');
SET IDENTITY_INSERT [dbo].[auth_permission] OFF;
GO

-- Data for [auth_user] (9 rows)
SET IDENTITY_INSERT [dbo].[auth_user] ON;
INSERT INTO [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (1, N'pbkdf2_sha256$1200000$3hspg2sGUMXZgJ2cckD7fQ$dqNvt+uc2OqbIgElJ6NXwzjiOS6of8DapKsbQu6kMDU=', N'2026-11-20 12:16:17.043147+00:00', 1, N'admin', N'', N'', N'abhinaya.kgb@gmail.com', 1, 1, N'2026-06-11 00:58:21.627319+00:00');
INSERT INTO [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (2, N'pbkdf2_sha256$1200000$20HKelboLJZKNBn8Hw0f5a$AxgoYt7qD9fvciUC0ktwVFE4mtIk+31upBcSiPDSIKU=', N'2026-11-20 12:30:56.818920+00:00', 0, N'client1', N'john', N'', N'john@gmail.com', 0, 1, N'2026-07-14 00:41:19.002164+00:00');
INSERT INTO [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (3, N'pbkdf2_sha256$1200000$JSilnpc7g4h6NMRu09ND89$Ft45Day0h9qUB1sLZddr0NaV2V7GKs+DnVXplp/8E2I=', NULL, 0, N'mick', N'mickle', N'', N'mick@gmail.com', 0, 1, N'2026-07-15 05:15:44.898165+00:00');
INSERT INTO [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (4, N'pbkdf2_sha256$1200000$f7jz7IYr1Qo2ecll3v8abY$pWhrH0SBNdSZjoobIaLu4bybooylXXd97rOjqKc/S+Q=', NULL, 0, N'Sankari S', N'sankari', N's', N'sankari.mca2025@gmail.com', 0, 1, N'2026-09-10 07:10:22.178774+00:00');
INSERT INTO [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (5, N'pbkdf2_sha256$1200000$AhXY4gBlJzzOKofHK6pika$EuuvH1uGVN/2UOMmJCgssgSNKt4CobZbPp3Ak1IDMQ8=', NULL, 0, N'Sabari s', N'sabari', N's', N'sabari.mca2025@adhiyamaan.in', 0, 1, N'2026-09-10 23:29:18.610045+00:00');
INSERT INTO [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (6, N'pbkdf2_sha256$1200000$7XXGyVi4a6NsiJvp8liFfJ$V5Aa9/WJwtuAQgEqXHzANkNMEH/f8wyMVpbTThsySIw=', NULL, 0, N'abi b', N'abi', N'b', N'abinaya.kgb@gmail.com', 0, 1, N'2026-09-11 04:32:23.875158+00:00');
INSERT INTO [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (7, N'pbkdf2_sha256$1200000$zYL6KUoV5Kwtt9f2i5PcQx$IWuSJZGr2LYxzg0xj0te+EFol8w2neewTYQE9yTLS24=', NULL, 0, N'merlin joice', N'merlin', N'joice', N'merlinjoice.mca2025@adhiyamaan.in', 0, 1, N'2026-09-15 05:24:35.976774+00:00');
INSERT INTO [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (8, N'pbkdf2_sha256$1200000$MuTtyRfI2TqWcYvWMXPdje$Pz9Q0aE0kDTV7YKhkuByngDZkFi8Guhu3HKCD+L8ypQ=', N'2026-11-20 12:32:15.367483+00:00', 0, N'arun', N'arun', N'k', N'arun@gmail.com', 0, 1, N'2026-11-20 10:31:39.611665+00:00');
INSERT INTO [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (10, N'pbkdf2_sha256$1200000$gwk6PM42jBOfMfLh2ZknyO$gPT81zHodryhN6cYSwV9tfO34/J0g0nRhbDvz83cyzI=', NULL, 0, N'yuvan', N'yuvan', N'a', N'yuvan@gmail.com', 0, 1, N'2026-11-20 11:10:18.244737+00:00');
SET IDENTITY_INSERT [dbo].[auth_user] OFF;
GO

-- Data for [django_content_type] (32 rows)
SET IDENTITY_INSERT [dbo].[django_content_type] ON;
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'admin', N'logentry');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'auth', N'group');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'permission');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'user');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'contenttypes', N'contenttype');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (7, N'employees', N'activitylog');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (8, N'employees', N'asset');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (9, N'employees', N'attendance');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (10, N'employees', N'client');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (11, N'employees', N'department');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (12, N'employees', N'designation');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (13, N'employees', N'employee');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (14, N'employees', N'employeedocument');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (15, N'employees', N'event');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (16, N'employees', N'expense');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (17, N'employees', N'goaltracking');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (18, N'employees', N'holiday');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (19, N'employees', N'hrletter');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (20, N'employees', N'jobapplication');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (21, N'employees', N'jobposting');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (22, N'employees', N'leaverequest');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (23, N'employees', N'notification');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (24, N'employees', N'payslip');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (25, N'employees', N'performancereview');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (26, N'employees', N'personalnote');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (27, N'employees', N'project');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (28, N'employees', N'projectupdate');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (29, N'employees', N'shift');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (30, N'employees', N'shiftrequest');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (31, N'employees', N'training');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (32, N'employees', N'trainingenrollment');
INSERT INTO [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (6, N'sessions', N'session');
SET IDENTITY_INSERT [dbo].[django_content_type] OFF;
GO

-- Data for [django_migrations] (50 rows)
SET IDENTITY_INSERT [dbo].[django_migrations] ON;
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', N'2026-11-20 10:06:32.065356+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'auth', N'0001_initial', N'2026-11-20 10:06:32.687222+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'admin', N'0001_initial', N'2026-11-20 10:06:32.867358+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'admin', N'0002_logentry_remove_auto_add', N'2026-11-20 10:06:32.933894+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'admin', N'0003_logentry_add_action_flag_choices', N'2026-11-20 10:06:33.115778+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'contenttypes', N'0002_remove_content_type_name', N'2026-11-20 10:06:47.311521+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0002_alter_permission_name_max_length', N'2026-11-20 10:06:47.360929+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0003_alter_user_email_max_length', N'2026-11-20 10:06:47.435534+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0004_alter_user_username_opts', N'2026-11-20 10:06:47.520752+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'auth', N'0005_alter_user_last_login_null', N'2026-11-20 10:06:53.114030+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'auth', N'0006_require_contenttypes_0002', N'2026-11-20 10:06:53.149820+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'auth', N'0007_alter_validators_add_error_messages', N'2026-11-20 10:06:53.206873+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'auth', N'0008_alter_user_username_max_length', N'2026-11-20 10:07:07.859047+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (14, N'auth', N'0009_alter_user_last_name_max_length', N'2026-11-20 10:07:07.976439+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (15, N'auth', N'0010_alter_group_name_max_length', N'2026-11-20 10:07:30.482394+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (16, N'auth', N'0011_update_proxy_permissions', N'2026-11-20 10:07:30.576512+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (17, N'auth', N'0012_alter_user_first_name_max_length', N'2026-11-20 10:07:30.768157+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (18, N'employees', N'0001_initial', N'2026-11-20 10:07:31.346355+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (19, N'employees', N'0002_jobposting_employee_annual_leave_balance_and_more', N'2026-11-20 10:07:33.516735+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (20, N'employees', N'0003_training_attendance_status_employee_address_and_more', N'2026-11-20 10:07:36.811126+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (21, N'employees', N'0004_alter_employee_annual_leave_balance', N'2026-11-20 10:07:36.895266+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (22, N'employees', N'0005_alter_employee_casual_leave_balance_and_more', N'2026-11-20 10:07:37.064514+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (23, N'employees', N'0006_jobapplication_resume_pdf', N'2026-11-20 10:07:37.094985+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (24, N'employees', N'0007_client_goaltracking_holiday', N'2026-11-20 10:07:37.160892+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (25, N'employees', N'0008_client_user_project', N'2026-11-20 10:07:37.529436+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (26, N'employees', N'0009_projectupdate', N'2026-11-20 10:07:37.800051+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (27, N'employees', N'0010_leaverequest_lop_days_payslip_lop_days_and_more', N'2026-11-20 10:07:39.559780+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (28, N'employees', N'0011_employeedocument', N'2026-11-20 10:07:39.663579+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (29, N'employees', N'0012_holiday_type', N'2026-11-20 10:07:40.509578+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (30, N'employees', N'0013_remove_goaltracking_target_achievement_and_more', N'2026-11-20 10:07:46.059544+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (31, N'employees', N'0014_remove_goaltracking_type_alter_goaltracking_status', N'2026-11-20 10:07:51.511197+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (32, N'employees', N'0015_notification', N'2026-11-20 10:07:51.718702+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (33, N'employees', N'0016_project_assigned_employees', N'2026-11-20 10:07:51.844853+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (34, N'employees', N'0017_shift_attendance_late_minutes_and_more', N'2026-11-20 10:07:53.396326+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (35, N'employees', N'0018_remove_shift_grace_period_minutes', N'2026-11-20 10:07:58.159611+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (36, N'employees', N'0019_employee_grace_period_minutes', N'2026-11-20 10:07:58.634089+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (37, N'employees', N'0020_payslip_late_penalty_lop_days_and_more', N'2026-11-20 10:08:00.928398+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (38, N'employees', N'0021_shiftrequest', N'2026-11-20 10:08:01.176699+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (39, N'employees', N'0022_alter_leaverequest_leave_type', N'2026-11-20 10:08:01.458804+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (40, N'employees', N'0023_alter_employee_casual_leave_balance_and_more', N'2026-11-20 10:08:01.965245+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (41, N'employees', N'0024_employee_maternity_leave_balance_and_more', N'2026-11-20 10:08:03.298995+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (42, N'employees', N'0025_asset_expense', N'2026-11-20 10:08:03.602258+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (43, N'employees', N'0026_employee_department_old_employee_designation_old_and_more', N'2026-11-20 10:08:29.198351+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (44, N'employees', N'0027_expense_medical_report_expense_prescription_and_more', N'2026-11-20 10:08:35.299631+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (45, N'employees', N'0028_activitylog', N'2026-11-20 10:08:35.383540+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (46, N'employees', N'0029_remove_activitylog_details_and_more', N'2026-11-20 10:08:48.062853+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (47, N'employees', N'0030_activitylog_details_activitylog_ip_address_and_more', N'2026-11-20 10:08:48.803239+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (48, N'employees', N'0031_hrletter', N'2026-11-20 10:08:48.875442+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (49, N'employees', N'0032_personalnote', N'2026-11-20 10:08:48.930745+00:00');
INSERT INTO [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (50, N'sessions', N'0001_initial', N'2026-11-20 10:08:48.952116+00:00');
SET IDENTITY_INSERT [dbo].[django_migrations] OFF;
GO

-- Data for [django_session] (17 rows)
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'39ftplrplf3hs3de91qto29trdvxzxhm', N'.eJxVjLEOAiEQBf-F2hAQWMDS3m8gCwtyaiA57irjvxuSK7R9M_PeLOC-1bCPvIaF2IU5dvrdIqZnbhPQA9u989Tbti6RT4UfdPBbp_y6Hu7fQcVRZ-2LAm-0KzkKE7UTngy6RB4ITHEGFBQtTXYA9myVVAQ2C5lQAEat2OcL2Cg3Nw:1xUMFB:XCKlHbZnvw4n_X3IC-mdBIDta4DLq5syKS0gfXFqi7g', N'2026-12-04 10:53:25.460276+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'3je23vjlvgrd0vw5um004oyr0xqzsgrl', N'.eJxVjEEOwiAQAP-yZ0OgCCw9eu8bmgV2pWrapLQn499Nkx70OjOZN4y0b3XcG6_jVKAHA5dflig_eT5EedB8X1Re5m2dkjoSddqmhqXw63a2f4NKrUIPiKgDsghh9jqSTeSYQ84cgtE2XoMVG50hp8WUTmL0SB1nH9FLIIHPF-ZrN_4:1xUMEL:t70VeNWB2Er-j9EI9WWCRdvmqBDRXyNe1BUijnnOCtA', N'2026-12-04 10:52:33.473123+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'3rcn7hih8wua6rholsog9oad0co8rz6e', N'.eJxVjLEOAiEQBf-F2hAQWMDS3m8gCwtyaiA57irjvxuSK7R9M_PeLOC-1bCPvIaF2IU5dvrdIqZnbhPQA9u989Tbti6RT4UfdPBbp_y6Hu7fQcVRZ-2LAm-0KzkKE7UTngy6RB4ITHEGFBQtTXYA9myVVAQ2C5lQAEat2OcL2Cg3Nw:1xUNkl:4IVTw5S_0Pdjj2-AVPEvUyYfpJ7FhxLfhmHmnoLZPrY', N'2026-12-04 12:30:07.727848+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'7m3ah7fghvp7fgangdr23lmf2cdd104c', N'.eJxVjLEOAiEQBf-F2hAQWMDS3m8gCwtyaiA57irjvxuSK7R9M_PeLOC-1bCPvIaF2IU5dvrdIqZnbhPQA9u989Tbti6RT4UfdPBbp_y6Hu7fQcVRZ-2LAm-0KzkKE7UTngy6RB4ITHEGFBQtTXYA9myVVAQ2C5lQAEat2OcL2Cg3Nw:1xUNBp:vfMfoZYIgnjUJHiI-zzqeIZ7jzrW6vlCE4zAEwnFmB8', N'2026-12-04 11:54:01.287435+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'8shfkmvgclcbqjbhw9vri1zo4l1hqipm', N'.eJxVjEEOwiAQAP-yZ0OgCCw9eu8bmgV2pWrapLQn499Nkx70OjOZN4y0b3XcG6_jVKAHA5dflig_eT5EedB8X1Re5m2dkjoSddqmhqXw63a2f4NKrUIPiKgDsghh9jqSTeSYQ84cgtE2XoMVG50hp8WUTmL0SB1nH9FLIIHPF-ZrN_4:1xULqc:C3xQzoyy6pwQ1bHZi1b9EZMrlEWYv8zYK5kjHjnTLik', N'2026-12-04 10:28:02.031988+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'94q2a68wc6el0c8cg1yvjy893jqdf7t3', N'.eJxVjEEOwiAQAP-yZ0OgCCw9eu8bmgV2pWrapLQn499Nkx70OjOZN4y0b3XcG6_jVKAHA5dflig_eT5EedB8X1Re5m2dkjoSddqmhqXw63a2f4NKrUIPiKgDsghh9jqSTeSYQ84cgtE2XoMVG50hp8WUTmL0SB1nH9FLIIHPF-ZrN_4:1xUMHG:lcyntSnRhRpS5Ntk9nqXAwoVHh3r1bBN7mIT3yY00PM', N'2026-12-04 10:55:34.147412+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'cjyeot4iila2mgao3kyu4l6owe1861sv', N'.eJxVjDEOgzAMAP_iuYqSELsxY3fegBziFNoKJAJT1b9XSAztene6N_Syb2O_V137KUMLHi6_LMnw1PkQ-SHzfTHDMm_rlMyRmNNW0y1ZX7ez_RuMUkdoQTEW9l7YZ0pWHZMgOmmcb4KzjoJS4UjepoiUMV21REvEgQoys4XPF7qJNm8:1xUNk1:vDFggkRQ05Xky8dVDuxF5hBYAPPAfnoiijAizoOE2fE', N'2026-12-04 12:29:21.819023+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'd09zmp07kr032m0b8z4ocf5v1ziudz28', N'.eJxVjLEOAiEQBf-F2hAQWMDS3m8gCwtyaiA57irjvxuSK7R9M_PeLOC-1bCPvIaF2IU5dvrdIqZnbhPQA9u989Tbti6RT4UfdPBbp_y6Hu7fQcVRZ-2LAm-0KzkKE7UTngy6RB4ITHEGFBQtTXYA9myVVAQ2C5lQAEat2OcL2Cg3Nw:1xUMGD:STisnzXZbmc1grlXgJRBWsUGfz12rsNdhKiS3pdyan8', N'2026-12-04 10:54:29.647424+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'epd7oppyznxduvzl5s848oqhv1z4o7sr', N'.eJxVjEEOwiAQAP-yZ0OgCCw9eu8bmgV2pWrapLQn499Nkx70OjOZN4y0b3XcG6_jVKAHA5dflig_eT5EedB8X1Re5m2dkjoSddqmhqXw63a2f4NKrUIPiKgDsghh9jqSTeSYQ84cgtE2XoMVG50hp8WUTmL0SB1nH9FLIIHPF-ZrN_4:1xUMGi:JVQbG0m-7G7i6yZWA98pbrOer5nCXY28c1m5orwI6Pg', N'2026-12-04 10:55:00.163688+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'ffivp64w67g3cumdos63iwwcv1ylr9s3', N'.eJxVjEEOwiAQAP-yZ0OgCCw9eu8bmgV2pWrapLQn499Nkx70OjOZN4y0b3XcG6_jVKAHA5dflig_eT5EedB8X1Re5m2dkjoSddqmhqXw63a2f4NKrUIPiKgDsghh9jqSTeSYQ84cgtE2XoMVG50hp8WUTmL0SB1nH9FLIIHPF-ZrN_4:1xUMEv:Xup_ZtRd0P42-J9mr6G3u2OO-Hi8qMU6PJOcSuhpmHI', N'2026-12-04 10:53:09.163499+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'fzvedbsiexvpgtrbayyuzd406x8fb33i', N'.eJxVjEEOwiAQAP-yZ0OgCCw9eu8bmgV2pWrapLQn499Nkx70OjOZN4y0b3XcG6_jVKAHA5dflig_eT5EedB8X1Re5m2dkjoSddqmhqXw63a2f4NKrUIPiKgDsghh9jqSTeSYQ84cgtE2XoMVG50hp8WUTmL0SB1nH9FLIIHPF-ZrN_4:1xUMEZ:JYIvbMGUfDopgVFG7Bsm73uiUPTDr1f7EMfi6GNlN7M', N'2026-12-04 10:52:47.286570+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'j532kuexmnsgb0tljv77xf5h9bmfq4kx', N'.eJxVjDEOgzAMAP_iuYqSELsxY3fegBziFNoKJAJT1b9XSAztene6N_Syb2O_V137KUMLHi6_LMnw1PkQ-SHzfTHDMm_rlMyRmNNW0y1ZX7ez_RuMUkdoQTEW9l7YZ0pWHZMgOmmcb4KzjoJS4UjepoiUMV21REvEgQoys4XPF7qJNm8:1xUNfX:FHT227qF6a-tqIHhIn6fEvVgjkLndCmb4cXpi5kHsbs', N'2026-12-04 12:24:43.473909+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'loy17m9njzux4nz7msolmkgyqszfc8ij', N'.eJxVjDEOgzAMAP_iuYqSELsxY3fegBziFNoKJAJT1b9XSAztene6N_Syb2O_V137KUMLHi6_LMnw1PkQ-SHzfTHDMm_rlMyRmNNW0y1ZX7ez_RuMUkdoQTEW9l7YZ0pWHZMgOmmcb4KzjoJS4UjepoiUMV21REvEgQoys4XPF7qJNm8:1xUNh5:CYs5WAluSS2RNa44uBs9vP0uxVjUhZiAHi24kjAJyK0', N'2026-12-04 12:26:19.215904+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'pyd5iwehb2u6mygcynz3wlp7u6mme2ll', N'.eJxVjLEOAiEQBf-F2hAQWMDS3m8gCwtyaiA57irjvxuSK7R9M_PeLOC-1bCPvIaF2IU5dvrdIqZnbhPQA9u989Tbti6RT4UfdPBbp_y6Hu7fQcVRZ-2LAm-0KzkKE7UTngy6RB4ITHEGFBQtTXYA9myVVAQ2C5lQAEat2OcL2Cg3Nw:1xUNjH:vnAfN9hAJlBk1HYnArib1hUzi393HoKY3aMAKTRsh0Q', N'2026-12-04 12:28:35.045296+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'rwifdax1c4v4as42eje50wh2i4w8xozu', N'.eJxVjEEOwiAQAP-yZ0OgCCw9eu8bmgV2pWrapLQn499Nkx70OjOZN4y0b3XcG6_jVKAHA5dflig_eT5EedB8X1Re5m2dkjoSddqmhqXw63a2f4NKrUIPiKgDsghh9jqSTeSYQ84cgtE2XoMVG50hp8WUTmL0SB1nH9FLIIHPF-ZrN_4:1xUNLJ:3kW-VkEw9SLbZHVCytSUiFnYgvPKLcjwN9hjiDcX9Ms', N'2026-12-04 12:03:49.782853+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'sfi4cuuq5jaykaq43vodb2ow0i5ftytp', N'.eJxVjEEOwiAQAP-yZ0OgCCw9eu8bmgV2pWrapLQn499Nkx70OjOZN4y0b3XcG6_jVKAHA5dflig_eT5EedB8X1Re5m2dkjoSddqmhqXw63a2f4NKrUIPiKgDsghh9jqSTeSYQ84cgtE2XoMVG50hp8WUTmL0SB1nH9FLIIHPF-ZrN_4:1xUNUx:iYrisYuztvv2GU8NzKTE9Ucmm_1xVN2ZdhhXDqjVYE4', N'2026-12-04 12:13:47.935888+00:00');
INSERT INTO [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'stc9rbv6q8skp5ctf1bvxy66wpm9g7qx', N'.eJxVjLEOAiEQBf-F2hAQWMDS3m8gCwtyaiA57irjvxuSK7R9M_PeLOC-1bCPvIaF2IU5dvrdIqZnbhPQA9u989Tbti6RT4UfdPBbp_y6Hu7fQcVRZ-2LAm-0KzkKE7UTngy6RB4ITHEGFBQtTXYA9myVVAQ2C5lQAEat2OcL2Cg3Nw:1xUNmp:jRLiAAACQwqjuUA4wxJnl2DXjyLs-wwUmP2RE96bLFU', N'2026-12-04 12:32:15.392432+00:00');
GO

-- Data for [employees_department] (6 rows)
SET IDENTITY_INSERT [dbo].[employees_department] ON;
INSERT INTO [dbo].[employees_department] ([id], [name], [description], [head_id]) VALUES (1, N'Management', NULL, NULL);
INSERT INTO [dbo].[employees_department] ([id], [name], [description], [head_id]) VALUES (2, N'Engineering', NULL, NULL);
INSERT INTO [dbo].[employees_department] ([id], [name], [description], [head_id]) VALUES (3, N'Human Resources', NULL, NULL);
INSERT INTO [dbo].[employees_department] ([id], [name], [description], [head_id]) VALUES (4, N'Marketing', NULL, NULL);
INSERT INTO [dbo].[employees_department] ([id], [name], [description], [head_id]) VALUES (5, N'Finance', NULL, NULL);
INSERT INTO [dbo].[employees_department] ([id], [name], [description], [head_id]) VALUES (7, N'QA Testing', N'Duplicate QA', NULL);
SET IDENTITY_INSERT [dbo].[employees_department] OFF;
GO

-- Data for [employees_designation] (5 rows)
SET IDENTITY_INSERT [dbo].[employees_designation] ON;
INSERT INTO [dbo].[employees_designation] ([id], [name], [base_salary], [department_id]) VALUES (1, N'Admin', N'0.00', 1);
INSERT INTO [dbo].[employees_designation] ([id], [name], [base_salary], [department_id]) VALUES (2, N'Employee (EMP)', N'0.00', 2);
INSERT INTO [dbo].[employees_designation] ([id], [name], [base_salary], [department_id]) VALUES (3, N'General HR (GH)', N'0.00', 3);
INSERT INTO [dbo].[employees_designation] ([id], [name], [base_salary], [department_id]) VALUES (4, N'Manager (BM)', N'0.00', 4);
INSERT INTO [dbo].[employees_designation] ([id], [name], [base_salary], [department_id]) VALUES (5, N'General Manager (GM)', N'0.00', 5);
SET IDENTITY_INSERT [dbo].[employees_designation] OFF;
GO

-- Data for [employees_shift] (5 rows)
SET IDENTITY_INSERT [dbo].[employees_shift] ON;
INSERT INTO [dbo].[employees_shift] ([id], [name], [start_time], [end_time]) VALUES (1, N'earlymorningshift', N'06:00:00', N'15:00:00');
INSERT INTO [dbo].[employees_shift] ([id], [name], [start_time], [end_time]) VALUES (2, N'Early Morning Shift', N'06:00:00', N'15:00:00');
INSERT INTO [dbo].[employees_shift] ([id], [name], [start_time], [end_time]) VALUES (3, N'General Shift', N'09:00:00', N'18:00:00');
INSERT INTO [dbo].[employees_shift] ([id], [name], [start_time], [end_time]) VALUES (4, N'Afternoon Shift', N'14:00:00', N'23:00:00');
INSERT INTO [dbo].[employees_shift] ([id], [name], [start_time], [end_time]) VALUES (5, N'Night Shift', N'22:00:00', N'07:00:00');
SET IDENTITY_INSERT [dbo].[employees_shift] OFF;
GO

-- Data for [employees_employee] (7 rows)
SET IDENTITY_INSERT [dbo].[employees_employee] ON;
INSERT INTO [dbo].[employees_employee] ([id], [department_old], [role_old], [phone], [hire_date], [salary], [is_company_admin], [user_id], [annual_leave_balance], [casual_leave_balance], [sick_leave_balance], [address], [date_of_birth], [designation_old], [employee_id_code], [gender], [ot_hourly_rate], [shift_id], [grace_period_minutes], [maternity_leave_balance], [paternity_leave_balance], [role], [department_id], [designation_id]) VALUES (1, NULL, NULL, NULL, N'2026-09-11', N'30000.00', 1, 1, 15, 12, 10, NULL, NULL, NULL, N'ADM001', NULL, N'0.00', 3, 120, 90, 14, N'Employee', 1, 1);
INSERT INTO [dbo].[employees_employee] ([id], [department_old], [role_old], [phone], [hire_date], [salary], [is_company_admin], [user_id], [annual_leave_balance], [casual_leave_balance], [sick_leave_balance], [address], [date_of_birth], [designation_old], [employee_id_code], [gender], [ot_hourly_rate], [shift_id], [grace_period_minutes], [maternity_leave_balance], [paternity_leave_balance], [role], [department_id], [designation_id]) VALUES (2, NULL, NULL, N'9876543210', N'2026-09-11', N'5000.00', 0, 4, 20, 10, 10, NULL, NULL, NULL, N'M001', NULL, N'0.00', 3, 120, 90, 14, N'front end dev', 2, 4);
INSERT INTO [dbo].[employees_employee] ([id], [department_old], [role_old], [phone], [hire_date], [salary], [is_company_admin], [user_id], [annual_leave_balance], [casual_leave_balance], [sick_leave_balance], [address], [date_of_birth], [designation_old], [employee_id_code], [gender], [ot_hourly_rate], [shift_id], [grace_period_minutes], [maternity_leave_balance], [paternity_leave_balance], [role], [department_id], [designation_id]) VALUES (3, NULL, NULL, N'9876543210', N'2026-09-11', N'5000.00', 0, 5, 20, 10, 10, NULL, NULL, NULL, N'M002', NULL, N'0.00', 3, 120, 90, 14, N'full stack', 2, 4);
INSERT INTO [dbo].[employees_employee] ([id], [department_old], [role_old], [phone], [hire_date], [salary], [is_company_admin], [user_id], [annual_leave_balance], [casual_leave_balance], [sick_leave_balance], [address], [date_of_birth], [designation_old], [employee_id_code], [gender], [ot_hourly_rate], [shift_id], [grace_period_minutes], [maternity_leave_balance], [paternity_leave_balance], [role], [department_id], [designation_id]) VALUES (4, NULL, NULL, N'9751791404', N'2026-09-11', N'5000.00', 0, 6, 20, 10, 10, NULL, NULL, NULL, N'M003', NULL, N'0.00', 3, 120, 90, 14, N'front end dev', 2, 4);
INSERT INTO [dbo].[employees_employee] ([id], [department_old], [role_old], [phone], [hire_date], [salary], [is_company_admin], [user_id], [annual_leave_balance], [casual_leave_balance], [sick_leave_balance], [address], [date_of_birth], [designation_old], [employee_id_code], [gender], [ot_hourly_rate], [shift_id], [grace_period_minutes], [maternity_leave_balance], [paternity_leave_balance], [role], [department_id], [designation_id]) VALUES (5, NULL, NULL, N'9876543210', N'2026-09-15', N'5000.00', 0, 7, 20, 10, 10, NULL, NULL, NULL, N'EMP001', NULL, N'100.00', 3, 120, 90, 14, N'full stack', 2, 2);
INSERT INTO [dbo].[employees_employee] ([id], [department_old], [role_old], [phone], [hire_date], [salary], [is_company_admin], [user_id], [annual_leave_balance], [casual_leave_balance], [sick_leave_balance], [address], [date_of_birth], [designation_old], [employee_id_code], [gender], [ot_hourly_rate], [shift_id], [grace_period_minutes], [maternity_leave_balance], [paternity_leave_balance], [role], [department_id], [designation_id]) VALUES (6, NULL, NULL, N'9876543210', N'2026-11-20', N'5000.00', 0, 8, 20, 10, 10, NULL, NULL, NULL, N'M004', NULL, N'0.00', NULL, 120, 90, 14, N'Employee', 2, 4);
INSERT INTO [dbo].[employees_employee] ([id], [department_old], [role_old], [phone], [hire_date], [salary], [is_company_admin], [user_id], [annual_leave_balance], [casual_leave_balance], [sick_leave_balance], [address], [date_of_birth], [designation_old], [employee_id_code], [gender], [ot_hourly_rate], [shift_id], [grace_period_minutes], [maternity_leave_balance], [paternity_leave_balance], [role], [department_id], [designation_id]) VALUES (7, NULL, NULL, N'8876544578', N'2026-11-20', N'5000.00', 0, 10, 20, 10, 10, NULL, NULL, NULL, N'M005', NULL, N'0.00', 4, 120, 90, 14, N'front end dev', 2, 4);
SET IDENTITY_INSERT [dbo].[employees_employee] OFF;
GO

-- Data for [employees_client] (1 rows)
SET IDENTITY_INSERT [dbo].[employees_client] ON;
INSERT INTO [dbo].[employees_client] ([id], [company_name], [client_id], [contact_person], [email], [phone], [status], [created_at], [user_id]) VALUES (1, N'Acme Global Corp', N'CL-001', N'John Doe', N'john@gmail.com', N'+1 (555) 019-2834', N'Active', N'2026-11-20 12:24:15.407503+00:00', 2);
SET IDENTITY_INSERT [dbo].[employees_client] OFF;
GO

-- Data for [employees_project] (1 rows)
SET IDENTITY_INSERT [dbo].[employees_project] ON;
INSERT INTO [dbo].[employees_project] ([id], [name], [description], [deadline], [progress], [status], [created_at], [client_id]) VALUES (1, N'Automated Portal Test Project', N'Project created to verify client project detail menu and view', N'2026-11-20', 60, N'Active', N'2026-11-20 12:29:21.865824+00:00', 1);
SET IDENTITY_INSERT [dbo].[employees_project] OFF;
GO

-- Data for [employees_attendance] (8 rows)
SET IDENTITY_INSERT [dbo].[employees_attendance] ON;
INSERT INTO [dbo].[employees_attendance] ([id], [date], [clock_in], [clock_out], [employee_id], [status], [late_minutes], [overtime_minutes]) VALUES (2, N'2026-09-11', N'10:24:59.306686', N'12:49:00', 2, N'Present', 0, 0);
INSERT INTO [dbo].[employees_attendance] ([id], [date], [clock_in], [clock_out], [employee_id], [status], [late_minutes], [overtime_minutes]) VALUES (3, N'2026-09-11', N'10:32:48.673051', N'12:30:00', 3, N'Present', 0, 0);
INSERT INTO [dbo].[employees_attendance] ([id], [date], [clock_in], [clock_out], [employee_id], [status], [late_minutes], [overtime_minutes]) VALUES (4, N'2026-09-11', N'09:45:00', N'16:30:00', 1, N'Present', 45, 0);
INSERT INTO [dbo].[employees_attendance] ([id], [date], [clock_in], [clock_out], [employee_id], [status], [late_minutes], [overtime_minutes]) VALUES (6, N'2026-09-11', N'16:26:47.942906', N'19:15:23.497391', 4, N'Present', 0, 0);
INSERT INTO [dbo].[employees_attendance] ([id], [date], [clock_in], [clock_out], [employee_id], [status], [late_minutes], [overtime_minutes]) VALUES (8, N'2026-09-15', N'09:43:46.556060', N'10:09:57.604624', 2, N'Present', 0, 0);
INSERT INTO [dbo].[employees_attendance] ([id], [date], [clock_in], [clock_out], [employee_id], [status], [late_minutes], [overtime_minutes]) VALUES (10, N'2026-09-15', N'10:55:03.863536', NULL, 5, N'Present', 115, 0);
INSERT INTO [dbo].[employees_attendance] ([id], [date], [clock_in], [clock_out], [employee_id], [status], [late_minutes], [overtime_minutes]) VALUES (11, N'2026-09-15', N'14:12:55.293468', N'16:26:51.154806', 4, N'Present', 312, 0);
INSERT INTO [dbo].[employees_attendance] ([id], [date], [clock_in], [clock_out], [employee_id], [status], [late_minutes], [overtime_minutes]) VALUES (12, N'2026-11-20', N'16:23:25.674962', N'16:23:25.750983', 6, N'Present', 0, 0);
SET IDENTITY_INSERT [dbo].[employees_attendance] OFF;
GO

-- Data for [employees_event] (1 rows)
SET IDENTITY_INSERT [dbo].[employees_event] ON;
INSERT INTO [dbo].[employees_event] ([id], [title], [description], [event_type], [start_time], [end_time], [created_at], [created_by_id]) VALUES (2, N'meeting', N'', N'Meeting', N'2026-11-17 03:30:00+00:00', N'2026-11-17 04:30:00+00:00', N'2026-11-20 11:31:07.182405+00:00', 1);
SET IDENTITY_INSERT [dbo].[employees_event] OFF;
GO

-- Data for [employees_performancereview] (1 rows)
SET IDENTITY_INSERT [dbo].[employees_performancereview] ON;
INSERT INTO [dbo].[employees_performancereview] ([id], [review_period], [rating], [goals], [feedback], [created_at], [employee_id], [reviewer_id]) VALUES (1, N'Q4 2026', N'5.0', N'Excellent performance', N'Great dedication', N'2026-11-20 10:55:12.608146+00:00', 6, 1);
SET IDENTITY_INSERT [dbo].[employees_performancereview] OFF;
GO

-- Data for [employees_notification] (25 rows)
SET IDENTITY_INSERT [dbo].[employees_notification] ON;
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (1, N'Late Arrival Request', N'abi b (M003) clocked in 50 mins late.', NULL, 0, N'2026-09-15 04:20:10.472721+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (2, N'Early Departure Approval Request', N'abi b (M003) clocked out early by 488 mins at 09:51 AM. Approval required.', NULL, 0, N'2026-09-15 04:21:05.922708+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (3, N'Early Departure Approval Request', N'abi b (M003) clocked out early by 488 mins at 09:51 AM. Approval required.', NULL, 0, N'2026-09-15 04:21:08.334040+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (4, N'Early Departure Approval Request', N'abi b (M003) clocked out early by 488 mins at 09:51 AM. Approval required.', NULL, 0, N'2026-09-15 04:21:10.100144+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (5, N'Early Departure Approval Request', N'sankari s (M001) requested early clock-out by 485 mins at 09:54 AM.', NULL, 0, N'2026-09-15 04:24:57.461749+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (6, N'Early Departure Approval Request', N'sankari s (M001) requested early clock-out by 485 mins at 09:54 AM.', NULL, 0, N'2026-09-15 04:24:57.462493+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (7, N'Early Departure Approval Request', N'sankari s (M001) requested early clock-out by 485 mins at 09:54 AM.', NULL, 0, N'2026-09-15 04:24:57.478237+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (8, N'Early Departure Approval Request', N'sankari s (M001) requested early clock-out by 485 mins at 09:54 AM.', NULL, 0, N'2026-09-15 04:24:57.481225+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (9, N'Early Departure Approval Request', N'sankari s (M001) requested early clock-out by 485 mins at 09:54 AM.', NULL, 0, N'2026-09-15 04:24:57.515446+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (10, N'Early Departure Approval Request', N'sankari s (M001) requested early clock-out by 470 mins at 10:09 AM.', NULL, 0, N'2026-09-15 04:39:58.044489+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (11, N'Late Arrival Request', N'merlin joice (EMP001) clocked in 115 mins late.', NULL, 0, N'2026-09-15 05:25:04.171928+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (12, N'Late Arrival Request', N'abi b (M003) clocked in 312 mins late.', NULL, 0, N'2026-09-15 08:42:56.934578+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (13, N'Early Departure Approval Request', N'abi b (M003) requested early clock-out by 93 mins at 04:26 PM.', NULL, 0, N'2026-09-15 10:56:51.516937+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (14, N'Leave Request Submitted', N'New leave request from arun k (Casual).', NULL, 0, N'2026-11-20 10:54:30.017444+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (15, N'Expense Submitted', N'Your expense claim for ''Client Travel Taxi'' is pending approval.', NULL, 0, N'2026-11-20 10:54:33.989773+00:00', 8);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (16, N'New Payslip Available', N'Your payslip for November 2026 is now available.', NULL, 0, N'2026-11-20 10:55:00.484317+00:00', 8);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (17, N'Payslip Marked as Paid', N'Your payslip for November 2026 has been marked as Paid.', NULL, 0, N'2026-11-20 10:55:04.462987+00:00', 8);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (18, N'New Performance Review', N'A new performance review for Q4 2026 has been added to your profile.', NULL, 0, N'2026-11-20 10:55:12.713778+00:00', 8);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (19, N'New Training Enrollment', N'You have been enrolled in ''SQL Server Performance Tuning''.', NULL, 0, N'2026-11-20 10:55:18.056139+00:00', 8);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (20, N'Leave Request Submitted', N'New leave request from arun k (Casual).', NULL, 0, N'2026-11-20 12:29:16.860087+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (21, N'Leave Request Submitted', N'New leave request from arun k (Casual).', NULL, 0, N'2026-11-20 12:30:08.151252+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (22, N'Leave Request Submitted', N'New leave request from arun k (Casual).', NULL, 0, N'2026-11-20 12:30:48.463827+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (23, N'Expense Submitted', N'Your expense claim for ''Test Office Travel'' is pending approval.', NULL, 0, N'2026-11-20 12:30:52.157074+00:00', 8);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (24, N'Client Project Update', N'Client ''Acme Global Corp'' posted an update for project ''Automated Portal Test Project''.', NULL, 0, N'2026-11-20 12:30:56.920126+00:00', 1);
INSERT INTO [dbo].[employees_notification] ([id], [title], [message], [link], [is_read], [created_at], [user_id]) VALUES (25, N'Leave Request Submitted', N'New leave request from arun k (Annual).', NULL, 0, N'2026-11-20 12:32:29.198815+00:00', 1);
SET IDENTITY_INSERT [dbo].[employees_notification] OFF;
GO

-- Data for [employees_activitylog] (37 rows)
SET IDENTITY_INSERT [dbo].[employees_activitylog] ON;
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (1, N'Logged In', 1, N'Admin Login Portal', N'127.0.0.1', N'Authentication', N'2026-09-11 10:46:34.954377+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (2, N'Logged Out', 1, N'', N'127.0.0.1', N'Authentication', N'2026-09-15 04:01:45.328744+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (3, N'Logged In', 1, N'Admin Login Portal', N'127.0.0.1', N'Authentication', N'2026-09-15 04:02:03.016143+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (4, N'Rejected Early Departure for abi b', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 04:20:47.137793+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (5, N'Approved Late Arrival for abi b', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 04:20:53.886210+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (6, N'Early Departure Request', 6, N'Early clock-out by abi b (488 mins before shift end). Submitted for admin approval.', NULL, N'General', N'2026-09-15 04:21:10.031523+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (7, N'Early Departure Request', 6, N'Early clock-out by abi b (488 mins before shift end). Submitted for admin approval.', NULL, N'General', N'2026-09-15 04:21:12.367975+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (8, N'Early Departure Request', 6, N'Early clock-out by abi b (488 mins before shift end). Submitted for admin approval.', NULL, N'General', N'2026-09-15 04:21:14.158832+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (9, N'Approved Early Departure for abi b', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 04:22:59.013120+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (10, N'Early Departure Request', 4, N'Early clock-out by sankari s (485 mins before shift end). Submitted for admin approval.', NULL, N'General', N'2026-09-15 04:25:01.593805+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (11, N'Early Departure Request', 4, N'Early clock-out by sankari s (485 mins before shift end). Submitted for admin approval.', NULL, N'General', N'2026-09-15 04:25:01.612046+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (12, N'Early Departure Request', 4, N'Early clock-out by sankari s (485 mins before shift end). Submitted for admin approval.', NULL, N'General', N'2026-09-15 04:25:01.594619+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (13, N'Early Departure Request', 4, N'Early clock-out by sankari s (485 mins before shift end). Submitted for admin approval.', NULL, N'General', N'2026-09-15 04:25:01.611763+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (14, N'Early Departure Request', 4, N'Early clock-out by sankari s (485 mins before shift end). Submitted for admin approval.', NULL, N'General', N'2026-09-15 04:25:01.612205+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (15, N'Rejected Early Departure for sankari s', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 04:25:19.483436+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (16, N'Rejected Early Departure for sankari s', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 04:25:23.191908+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (17, N'Rejected Early Departure for sankari s', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 04:25:26.464636+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (18, N'Rejected Early Departure for sankari s', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 04:25:30.494402+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (19, N'Approved Early Departure for sankari s', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 04:25:34.499235+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (20, N'Early Departure Request', 4, N'Early clock-out by sankari s (470 mins before shift end). Submitted for admin approval.', NULL, N'General', N'2026-09-15 04:40:02.158570+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (21, N'Approved Early Departure for sankari s', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 04:40:10.330831+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (22, N'Created Employee merlin joice', 1, N'', N'127.0.0.1', N'Employee Management', N'2026-09-15 05:24:38.320273+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (23, N'Approved Late Arrival for merlin joice', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 05:25:32.681515+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (24, N'Approved Late Arrival for abi b', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 10:52:55.838464+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (25, N'Early Departure Request', 6, N'Early clock-out by abi b (93 mins before shift end). Submitted for admin approval.', NULL, N'General', N'2026-09-15 10:56:55.675013+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (26, N'Approved Early Departure for abi b', 1, N'', N'127.0.0.1', N'Attendance Approval', N'2026-09-15 10:56:59.463931+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (27, N'Logged In', 1, N'Admin Login Portal', N'127.0.0.1', N'Authentication', N'2026-11-20 10:28:01.909708+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (28, N'Logged In', 1, N'Admin Login Portal', N'127.0.0.1', N'Authentication', N'2026-11-20 10:28:01.910618+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (29, N'Created Employee arun k', 1, N'', N'127.0.0.1', N'Employee Management', N'2026-11-20 10:31:41.787184+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (30, N'Created Meeting: Sprint Review Meeting', 1, N'', N'127.0.0.1', N'Unified Calendar', N'2026-11-20 10:53:11.047916+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (31, N'Generated Experience Certificate for arun', 1, N'', N'127.0.0.1', N'HR Certificates', N'2026-11-20 10:55:22.007902+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (32, N'Created Employee yuvan a', 1, N'', N'127.0.0.1', N'Employee Management', N'2026-11-20 11:10:19.984511+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (33, N'Created Meeting: meeting', 1, N'', N'127.0.0.1', N'Unified Calendar', N'2026-11-20 11:31:10.634047+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (34, N'Logged In', 8, N'Unified Login Portal', N'127.0.0.1', N'Authentication', N'2026-11-20 11:38:27.477640+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (35, N'Logged In', 1, N'Admin Login Portal', N'127.0.0.1', N'Authentication', N'2026-11-20 12:16:17.096435+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (36, N'Logged Out', 2, N'', N'127.0.0.1', N'Authentication', N'2026-11-20 12:31:00.680900+00:00');
INSERT INTO [dbo].[employees_activitylog] ([id], [action], [user_id], [details], [ip_address], [module], [timestamp]) VALUES (37, N'Logged In', 8, N'Unified Login Portal', N'127.0.0.1', N'Authentication', N'2026-11-20 12:32:15.375100+00:00');
SET IDENTITY_INSERT [dbo].[employees_activitylog] OFF;
GO

-- Data for [employees_leaverequest] (1 rows)
SET IDENTITY_INSERT [dbo].[employees_leaverequest] ON;
INSERT INTO [dbo].[employees_leaverequest] ([id], [leave_type], [start_date], [end_date], [reason], [status], [employee_id], [lop_days]) VALUES (6, N'Annual', N'2026-11-27', N'2026-11-30', N'sick', N'Pending', 6, 0);
SET IDENTITY_INSERT [dbo].[employees_leaverequest] OFF;
GO

-- =====================================================================
-- FOREIGN KEY CONSTRAINTS
-- =====================================================================

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'auth_group_permissions_group_id_b120cbf9_fk_auth_group_id')
BEGIN
    ALTER TABLE [dbo].[auth_group_permissions] WITH CHECK ADD CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY ([group_id]) REFERENCES [dbo].[auth_group] ([id]);
    ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id')
BEGIN
    ALTER TABLE [dbo].[auth_group_permissions] WITH CHECK ADD CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY ([permission_id]) REFERENCES [dbo].[auth_permission] ([id]);
    ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'auth_permission_content_type_id_2f476e4b_fk_django_content_type_id')
BEGIN
    ALTER TABLE [dbo].[auth_permission] WITH CHECK ADD CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY ([content_type_id]) REFERENCES [dbo].[django_content_type] ([id]);
    ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'auth_user_groups_group_id_97559544_fk_auth_group_id')
BEGIN
    ALTER TABLE [dbo].[auth_user_groups] WITH CHECK ADD CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY ([group_id]) REFERENCES [dbo].[auth_group] ([id]);
    ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'auth_user_groups_user_id_6a12ed8b_fk_auth_user_id')
BEGIN
    ALTER TABLE [dbo].[auth_user_groups] WITH CHECK ADD CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[auth_user] ([id]);
    ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id')
BEGIN
    ALTER TABLE [dbo].[auth_user_user_permissions] WITH CHECK ADD CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY ([permission_id]) REFERENCES [dbo].[auth_permission] ([id]);
    ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id')
BEGIN
    ALTER TABLE [dbo].[auth_user_user_permissions] WITH CHECK ADD CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[auth_user] ([id]);
    ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id')
BEGIN
    ALTER TABLE [dbo].[django_admin_log] WITH CHECK ADD CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY ([content_type_id]) REFERENCES [dbo].[django_content_type] ([id]);
    ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'django_admin_log_user_id_c564eba6_fk_auth_user_id')
BEGIN
    ALTER TABLE [dbo].[django_admin_log] WITH CHECK ADD CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[auth_user] ([id]);
    ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_activitylog_user_id_5cf873be_fk_auth_user_id')
BEGIN
    ALTER TABLE [dbo].[employees_activitylog] WITH CHECK ADD CONSTRAINT [employees_activitylog_user_id_5cf873be_fk_auth_user_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[auth_user] ([id]);
    ALTER TABLE [dbo].[employees_activitylog] CHECK CONSTRAINT [employees_activitylog_user_id_5cf873be_fk_auth_user_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_asset_assigned_to_id_9c06fa2c_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_asset] WITH CHECK ADD CONSTRAINT [employees_asset_assigned_to_id_9c06fa2c_fk_employees_employee_id] FOREIGN KEY ([assigned_to_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_asset] CHECK CONSTRAINT [employees_asset_assigned_to_id_9c06fa2c_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_attendance_employee_id_450daa06_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_attendance] WITH CHECK ADD CONSTRAINT [employees_attendance_employee_id_450daa06_fk_employees_employee_id] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_attendance] CHECK CONSTRAINT [employees_attendance_employee_id_450daa06_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_client_user_id_1922852a_fk_auth_user_id')
BEGIN
    ALTER TABLE [dbo].[employees_client] WITH CHECK ADD CONSTRAINT [employees_client_user_id_1922852a_fk_auth_user_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[auth_user] ([id]);
    ALTER TABLE [dbo].[employees_client] CHECK CONSTRAINT [employees_client_user_id_1922852a_fk_auth_user_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_department_head_id_760e2cc0_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_department] WITH CHECK ADD CONSTRAINT [employees_department_head_id_760e2cc0_fk_employees_employee_id] FOREIGN KEY ([head_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_department] CHECK CONSTRAINT [employees_department_head_id_760e2cc0_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_designation_department_id_2f0318e6_fk_employees_department_id')
BEGIN
    ALTER TABLE [dbo].[employees_designation] WITH CHECK ADD CONSTRAINT [employees_designation_department_id_2f0318e6_fk_employees_department_id] FOREIGN KEY ([department_id]) REFERENCES [dbo].[employees_department] ([id]);
    ALTER TABLE [dbo].[employees_designation] CHECK CONSTRAINT [employees_designation_department_id_2f0318e6_fk_employees_department_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_employee_department_id_410c23c8_fk_employees_department_id')
BEGIN
    ALTER TABLE [dbo].[employees_employee] WITH CHECK ADD CONSTRAINT [employees_employee_department_id_410c23c8_fk_employees_department_id] FOREIGN KEY ([department_id]) REFERENCES [dbo].[employees_department] ([id]);
    ALTER TABLE [dbo].[employees_employee] CHECK CONSTRAINT [employees_employee_department_id_410c23c8_fk_employees_department_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_employee_designation_id_00c584d7_fk_employees_designation_id')
BEGIN
    ALTER TABLE [dbo].[employees_employee] WITH CHECK ADD CONSTRAINT [employees_employee_designation_id_00c584d7_fk_employees_designation_id] FOREIGN KEY ([designation_id]) REFERENCES [dbo].[employees_designation] ([id]);
    ALTER TABLE [dbo].[employees_employee] CHECK CONSTRAINT [employees_employee_designation_id_00c584d7_fk_employees_designation_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_employee_shift_id_0efa57ac_fk_employees_shift_id')
BEGIN
    ALTER TABLE [dbo].[employees_employee] WITH CHECK ADD CONSTRAINT [employees_employee_shift_id_0efa57ac_fk_employees_shift_id] FOREIGN KEY ([shift_id]) REFERENCES [dbo].[employees_shift] ([id]);
    ALTER TABLE [dbo].[employees_employee] CHECK CONSTRAINT [employees_employee_shift_id_0efa57ac_fk_employees_shift_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_employee_user_id_27bed289_fk_auth_user_id')
BEGIN
    ALTER TABLE [dbo].[employees_employee] WITH CHECK ADD CONSTRAINT [employees_employee_user_id_27bed289_fk_auth_user_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[auth_user] ([id]);
    ALTER TABLE [dbo].[employees_employee] CHECK CONSTRAINT [employees_employee_user_id_27bed289_fk_auth_user_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_employeedocument_employee_id_01ba40e9_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_employeedocument] WITH CHECK ADD CONSTRAINT [employees_employeedocument_employee_id_01ba40e9_fk_employees_employee_id] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_employeedocument] CHECK CONSTRAINT [employees_employeedocument_employee_id_01ba40e9_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_event_created_by_id_e295c630_fk_auth_user_id')
BEGIN
    ALTER TABLE [dbo].[employees_event] WITH CHECK ADD CONSTRAINT [employees_event_created_by_id_e295c630_fk_auth_user_id] FOREIGN KEY ([created_by_id]) REFERENCES [dbo].[auth_user] ([id]);
    ALTER TABLE [dbo].[employees_event] CHECK CONSTRAINT [employees_event_created_by_id_e295c630_fk_auth_user_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_expense_employee_id_75c18493_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_expense] WITH CHECK ADD CONSTRAINT [employees_expense_employee_id_75c18493_fk_employees_employee_id] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_expense] CHECK CONSTRAINT [employees_expense_employee_id_75c18493_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_goaltracking_project_id_6832888e_fk_employees_project_id')
BEGIN
    ALTER TABLE [dbo].[employees_goaltracking] WITH CHECK ADD CONSTRAINT [employees_goaltracking_project_id_6832888e_fk_employees_project_id] FOREIGN KEY ([project_id]) REFERENCES [dbo].[employees_project] ([id]);
    ALTER TABLE [dbo].[employees_goaltracking] CHECK CONSTRAINT [employees_goaltracking_project_id_6832888e_fk_employees_project_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_hrletter_created_by_id_5c1234cb_fk_auth_user_id')
BEGIN
    ALTER TABLE [dbo].[employees_hrletter] WITH CHECK ADD CONSTRAINT [employees_hrletter_created_by_id_5c1234cb_fk_auth_user_id] FOREIGN KEY ([created_by_id]) REFERENCES [dbo].[auth_user] ([id]);
    ALTER TABLE [dbo].[employees_hrletter] CHECK CONSTRAINT [employees_hrletter_created_by_id_5c1234cb_fk_auth_user_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_hrletter_employee_id_dd6a4acb_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_hrletter] WITH CHECK ADD CONSTRAINT [employees_hrletter_employee_id_dd6a4acb_fk_employees_employee_id] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_hrletter] CHECK CONSTRAINT [employees_hrletter_employee_id_dd6a4acb_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_jobapplication_job_id_2b5dabb7_fk_employees_jobposting_id')
BEGIN
    ALTER TABLE [dbo].[employees_jobapplication] WITH CHECK ADD CONSTRAINT [employees_jobapplication_job_id_2b5dabb7_fk_employees_jobposting_id] FOREIGN KEY ([job_id]) REFERENCES [dbo].[employees_jobposting] ([id]);
    ALTER TABLE [dbo].[employees_jobapplication] CHECK CONSTRAINT [employees_jobapplication_job_id_2b5dabb7_fk_employees_jobposting_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_leaverequest_employee_id_bdc81dd8_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_leaverequest] WITH CHECK ADD CONSTRAINT [employees_leaverequest_employee_id_bdc81dd8_fk_employees_employee_id] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_leaverequest] CHECK CONSTRAINT [employees_leaverequest_employee_id_bdc81dd8_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_notification_user_id_64ae6c2a_fk_auth_user_id')
BEGIN
    ALTER TABLE [dbo].[employees_notification] WITH CHECK ADD CONSTRAINT [employees_notification_user_id_64ae6c2a_fk_auth_user_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[auth_user] ([id]);
    ALTER TABLE [dbo].[employees_notification] CHECK CONSTRAINT [employees_notification_user_id_64ae6c2a_fk_auth_user_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_payslip_employee_id_6cc69715_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_payslip] WITH CHECK ADD CONSTRAINT [employees_payslip_employee_id_6cc69715_fk_employees_employee_id] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_payslip] CHECK CONSTRAINT [employees_payslip_employee_id_6cc69715_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_performancereview_employee_id_792eca2d_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_performancereview] WITH CHECK ADD CONSTRAINT [employees_performancereview_employee_id_792eca2d_fk_employees_employee_id] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_performancereview] CHECK CONSTRAINT [employees_performancereview_employee_id_792eca2d_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_performancereview_reviewer_id_57a2efb4_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_performancereview] WITH CHECK ADD CONSTRAINT [employees_performancereview_reviewer_id_57a2efb4_fk_employees_employee_id] FOREIGN KEY ([reviewer_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_performancereview] CHECK CONSTRAINT [employees_performancereview_reviewer_id_57a2efb4_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_personalnote_user_id_1ace2676_fk_auth_user_id')
BEGIN
    ALTER TABLE [dbo].[employees_personalnote] WITH CHECK ADD CONSTRAINT [employees_personalnote_user_id_1ace2676_fk_auth_user_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[auth_user] ([id]);
    ALTER TABLE [dbo].[employees_personalnote] CHECK CONSTRAINT [employees_personalnote_user_id_1ace2676_fk_auth_user_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_project_assigned_employees_employee_id_4d137495_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_project_assigned_employees] WITH CHECK ADD CONSTRAINT [employees_project_assigned_employees_employee_id_4d137495_fk_employees_employee_id] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_project_assigned_employees] CHECK CONSTRAINT [employees_project_assigned_employees_employee_id_4d137495_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_project_assigned_employees_project_id_ed626a34_fk_employees_project_id')
BEGIN
    ALTER TABLE [dbo].[employees_project_assigned_employees] WITH CHECK ADD CONSTRAINT [employees_project_assigned_employees_project_id_ed626a34_fk_employees_project_id] FOREIGN KEY ([project_id]) REFERENCES [dbo].[employees_project] ([id]);
    ALTER TABLE [dbo].[employees_project_assigned_employees] CHECK CONSTRAINT [employees_project_assigned_employees_project_id_ed626a34_fk_employees_project_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_project_client_id_4d14a636_fk_employees_client_id')
BEGIN
    ALTER TABLE [dbo].[employees_project] WITH CHECK ADD CONSTRAINT [employees_project_client_id_4d14a636_fk_employees_client_id] FOREIGN KEY ([client_id]) REFERENCES [dbo].[employees_client] ([id]);
    ALTER TABLE [dbo].[employees_project] CHECK CONSTRAINT [employees_project_client_id_4d14a636_fk_employees_client_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_projectupdate_author_id_46d9651b_fk_auth_user_id')
BEGIN
    ALTER TABLE [dbo].[employees_projectupdate] WITH CHECK ADD CONSTRAINT [employees_projectupdate_author_id_46d9651b_fk_auth_user_id] FOREIGN KEY ([author_id]) REFERENCES [dbo].[auth_user] ([id]);
    ALTER TABLE [dbo].[employees_projectupdate] CHECK CONSTRAINT [employees_projectupdate_author_id_46d9651b_fk_auth_user_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_projectupdate_project_id_12ccdc57_fk_employees_project_id')
BEGIN
    ALTER TABLE [dbo].[employees_projectupdate] WITH CHECK ADD CONSTRAINT [employees_projectupdate_project_id_12ccdc57_fk_employees_project_id] FOREIGN KEY ([project_id]) REFERENCES [dbo].[employees_project] ([id]);
    ALTER TABLE [dbo].[employees_projectupdate] CHECK CONSTRAINT [employees_projectupdate_project_id_12ccdc57_fk_employees_project_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_shiftrequest_employee_id_aeeff4b8_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_shiftrequest] WITH CHECK ADD CONSTRAINT [employees_shiftrequest_employee_id_aeeff4b8_fk_employees_employee_id] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_shiftrequest] CHECK CONSTRAINT [employees_shiftrequest_employee_id_aeeff4b8_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_shiftrequest_requested_shift_id_35dcb7fd_fk_employees_shift_id')
BEGIN
    ALTER TABLE [dbo].[employees_shiftrequest] WITH CHECK ADD CONSTRAINT [employees_shiftrequest_requested_shift_id_35dcb7fd_fk_employees_shift_id] FOREIGN KEY ([requested_shift_id]) REFERENCES [dbo].[employees_shift] ([id]);
    ALTER TABLE [dbo].[employees_shiftrequest] CHECK CONSTRAINT [employees_shiftrequest_requested_shift_id_35dcb7fd_fk_employees_shift_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_trainingenrollment_employee_id_d5a92135_fk_employees_employee_id')
BEGIN
    ALTER TABLE [dbo].[employees_trainingenrollment] WITH CHECK ADD CONSTRAINT [employees_trainingenrollment_employee_id_d5a92135_fk_employees_employee_id] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees_employee] ([id]);
    ALTER TABLE [dbo].[employees_trainingenrollment] CHECK CONSTRAINT [employees_trainingenrollment_employee_id_d5a92135_fk_employees_employee_id];
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = N'employees_trainingenrollment_training_id_424d2b97_fk_employees_training_id')
BEGIN
    ALTER TABLE [dbo].[employees_trainingenrollment] WITH CHECK ADD CONSTRAINT [employees_trainingenrollment_training_id_424d2b97_fk_employees_training_id] FOREIGN KEY ([training_id]) REFERENCES [dbo].[employees_training] ([id]);
    ALTER TABLE [dbo].[employees_trainingenrollment] CHECK CONSTRAINT [employees_trainingenrollment_training_id_424d2b97_fk_employees_training_id];
END
GO

-- Re-enable and verify all constraints
EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';
GO
PRINT '=======================================================';
PRINT 'Database [myhrm] successfully created and initialized!';
PRINT '=======================================================';
GO