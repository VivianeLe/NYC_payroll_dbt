with all_payroll as (select FiscalYear, PayrollNumber, AgencyID, EmployeeID, 
    AgencyStartDate, WorkLocationBorough, TitleCode, 
    LeaveStatusasofJune30, BaseSalary, PayBasis, RegularHours, RegularGrossPaid, OTHours, TotalOTPaid, TotalOtherPay 
from
    {{ ref('stg_payroll2020') }}
union all
select
    FiscalYear, PayrollNumber, AgencyID, EmployeeID, 
    AgencyStartDate, WorkLocationBorough, TitleCode, 
    LeaveStatusasofJune30, BaseSalary, PayBasis, RegularHours, RegularGrossPaid, OTHours, TotalOTPaid, TotalOtherPay
from
    {{ ref('stg_payroll2021') }})
select p.*, a.AgencyName, em.LastName, em.FirstName, t.TitleDescription 
from all_payroll p
left join {{ ref('stg_agency_master') }} a on p.AgencyID = a.AgencyID
left join {{ ref('stg_emp_master') }} em on p.EmployeeID = em.EmployeeID
left join {{ ref('stg_title_master') }} t on p.TitleCode = t.TitleCode