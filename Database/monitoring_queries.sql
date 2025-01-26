-- 1. Check the total number of employees in each department
SELECT 
    d.DepartmentName, 
    COUNT(e.EmployeeID) AS TotalEmployees
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 2. Monitor database size
SELECT 
    DB_NAME() AS DatabaseName, 
    SUM(size * 8.0 / 1024) AS DatabaseSizeMB
FROM sys.master_files
WHERE DB_NAME(database_id) = 'EmployeeManagement'
GROUP BY DB_NAME();

-- 3. Identify employees with the highest salaries
SELECT 
    FirstName, 
    LastName, 
    JobTitle, 
    Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 5;

-- 4. Track recent employee hires (last 6 months)
SELECT 
    FirstName, 
    LastName, 
    HireDate, 
    JobTitle
FROM Employees
WHERE HireDate >= DATEADD(MONTH, -6, GETDATE());

-- 5. Monitor failed SQL login attempts (for security)
SELECT 
    event_time, 
    server_principal_name, 
    database_name, 
    statement, 
    additional_info
FROM sys.fn_get_audit_file('C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Log\*.sqlaudit', DEFAULT, DEFAULT)
WHERE action_id = 'LGIF'; -- Login failed events

-- 6. Check for long-running queries (running over 2 seconds)
SELECT 
    r.session_id, 
    r.status, 
    r.wait_type, 
    r.cpu_time, 
    r.total_elapsed_time, 
    q.text AS QueryText
FROM sys.dm_exec_requests r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) AS q
WHERE r.total_elapsed_time > 2000;

-- 7. Disk space usage of the database
EXEC sp_spaceused;

-- 8. Index fragmentation report (above 30% fragmentation)
SELECT 
    OBJECT_NAME(ips.object_id) AS TableName, 
    i.name AS IndexName, 
    ips.index_id, 
    ips.avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, NULL) ips
JOIN sys.indexes i ON ips.object_id = i.object_id AND ips.index_id = i.index_id
WHERE ips.avg_fragmentation_in_percent > 30;

-- 9. Identify blocking queries
SELECT 
    blocking_session_id AS BlockingSession, 
    session_id AS BlockedSession, 
    wait_time, 
    wait_type, 
    blocking_sql.text AS BlockingQuery, 
    blocked_sql.text AS BlockedQuery
FROM sys.dm_exec_requests 
JOIN sys.dm_exec_sessions ON sys.dm_exec_requests.session_id = sys.dm_exec_sessions.session_id
CROSS APPLY sys.dm_exec_sql_text(sys.dm_exec_requests.sql_handle) AS blocked_sql
LEFT JOIN sys.dm_exec_requests blocking_request ON sys.dm_exec_requests.blocking_session_id = blocking_request.session_id
CROSS APPLY sys.dm_exec_sql_text(blocking_request.sql_handle) AS blocking_sql
WHERE blocking_session_id <> 0;

-- 10. Check active connections to the database
SELECT 
    DB_NAME(dbid) AS DatabaseName, 
    COUNT(dbid) AS NumberOfConnections
FROM sys.sysprocesses
WHERE dbid > 0
GROUP BY DB_NAME(dbid);
