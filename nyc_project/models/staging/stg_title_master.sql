select TitleCode, TitleDescription
from {{ source('nyc_payroll_source', 'title_master') }}