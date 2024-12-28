# NYC Payroll dbt Project

This is a **dbt (Data Build Tool)** project designed to analyze and model payroll data for the City of New York. The project uses dbt to transform raw data into structured datasets that can be used for analysis, reporting, and insights.

---

## Project Structure

```plaintext
nyc_project/
├── models/
│   ├── marts/                      # Final datasets for reporting (e.g., aggregated metrics)
│   │   ├── mart_payroll_emp.sql     # Aggregates total payments by employee
│   │   └── marts_source.yml               # Documentation for marts
│   ├── intermediate/               # Intermediate transformations
│   │   ├── inter_payroll20_21.sql
│   │   └── inter_query_source.yml
│   ├── staging/                    # Raw data cleaning and preparation
│   │   ├── stg_payroll2020.sql
│   │   ├── stg_payroll2021.sql
│   │   ├── stg_agency_master.sql
|   |   ├── stg_emp_master.sql
|   |   ├── stg_title_master.sql
│   │   └── stg_query_source.yml
├── seeds/                          # Seed files for static datasets
├── macros/                         # Custom macros for reuse
├── analyses/                       # Analysis scripts
├── tests/                          # Test cases for models
├── dbt_project.yml                 # dbt project configuration
└── profiles.yml                    # Database connection settings
```

---

## Data Sources

The project pulls data from NYC Payroll datasets, including:
- **stg_payroll2020**: Raw data from the 2020 fiscal year, including fields like `AgencyID`, `EmployeeID`, `BaseSalary`, and more.
- **stg_payroll2021**: Raw data from the 2021 fiscal year, including fields like `AgencyID`, `EmployeeID`, `BaseSalary`, and more.
- **stg_agency_master**: Raw data of agencies, including `AgencyID`, `AgencyName`.
- **stg_employee_master**: Raw data of employees, including `EmployeeID`, `EmployeeName`.
- **stg_title_master**: Raw data of titles, including `TitleCode`, `TitleDescription`.

---

## Key Features

- **Data Transformation**: 
  - Cleans and standardizes raw payroll data.
  - Summarizes payroll information by fiscal year, agency, and employee.

- **Model Layers**:
  1. **Staging**: Raw data preparation and cleaning.
  2. **Intermediate**: Business logic and calculations.
  3. **Marts**: Final datasets for reporting and visualization.

- **Integration with Google BigQuery**:
  - dbt is configured to connect with BigQuery to process and store data.
  - Uses service account authentication.

---

## Example Models

### **1. Intermediate Layer**
- **Model**: `inter_payroll20_21.sql`
  - Calculates total payments for employees by summing `RegularGrossPaid`, `TotalOTPaid`, and `TotalOtherPay`.

### **2. Marts Layer**
- **Model**: `mart_payroll_emp.sql`
  - Aggregates payroll data by `FiscalYear`, `AgencyID`, `EmployeeID`, and `TitleCode`.

---

## Setup and Installation

### **1. Prerequisites**
- Python 3.8 or higher
- dbt Core installed (version 1.9.1)
- Access to a Google Cloud project with BigQuery enabled

### **2. Install dbt**
```bash
pip install dbt-bigquery
```

### **3. Clone the Repository**
```bash
git clone https://github.com/VivianeLe/NYC_payroll_dbt.git
cd NYC_payroll_dbt
```

### **4. Set Up Environment Variables**
Ensure the following environment variables are set:
```bash
export BIGQUERY_KEYFILE="/path/to/your/service-account-key.json"
export GOOGLE_CLOUD_PROJECT="your-gcp-project-id"
```

### **5. Configure Profiles**
Update `profiles.yml` with your BigQuery project and dataset settings.

---

## Usage

### **Run dbt Models**
To build all models:
```bash
dbt run
```

To run a specific model:
```bash
dbt run --select mart_payroll_emp
```

### **Test Models**
To test your dbt models:
```bash
dbt test
```

### **Generate Documentation**
To generate and serve project documentation:
```bash
dbt docs generate
dbt docs serve
```

---

## Key Models and Outputs

| **Model Name**        | **Description**                                     | **Materialization** |
|-----------------------|-----------------------------------------------------|---------------------|
| `stg_payroll2020`     | Cleans and prepares payroll data for 2020.           | View                |
| `intermediate_total_paid` | Computes total pay per employee.                 | Table               |
| `marts_total_pay`     | Aggregates payroll data by agency, fiscal year, etc. | View                |

---

## Contributing

1. Fork this repository.
2. Create a new branch for your feature/bug fix:
   ```bash
   git checkout -b feature/my-new-feature
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add new feature"
   ```
4. Push to the branch:
   ```bash
   git push origin feature/my-new-feature
   ```
5. Open a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
