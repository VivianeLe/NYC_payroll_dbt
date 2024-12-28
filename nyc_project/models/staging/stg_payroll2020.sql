select FiscalYear, PayrollNumber, AgencyID, AgencyName, EmployeeID, LastName, FirstName, 
AgencyStartDate, WorkLocationBorough, TitleCode, TitleDescription, LeaveStatusasofJune30, 
BaseSalary, PayBasis, RegularHours, RegularGrossPaid, OTHours, TotalOTPaid, TotalOtherPay
from {{ source('nyc_payroll_source', 'payroll2020') }}