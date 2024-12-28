select EmployeeID, LastName, FirstName
from {{ source('nyc_payroll_source', 'emp_master') }}