select AgencyID, AgencyName
from {{ source('nyc_payroll_source', 'agency_master') }}