select FiscalYear,AgencyID,AgencyName, EmployeeID, TitleCode, TitleDescription, WorkLocationBorough,
    sum(RegularGrossPaid + TotalOTPaid + TotalOtherPay) as TotalPay
from {{ ref('inter_payroll20_21') }}
group by FiscalYear,AgencyID,AgencyName, EmployeeID, TitleCode, TitleDescription, WorkLocationBorough