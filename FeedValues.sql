INSERT INTO agency (agency_code, agency_name, agency_abbr) VALUES
(1, 'Office of the Comptroller of the Currency', 'OCC'),
(2, 'Federal Reserve System', 'FRS'),
(3, 'Federal Deposit Insurance Corporation', 'FDIC'),
(5, 'National Credit Union Administration', 'NCUA'),
(7, 'Department of Housing and Urban Development', 'HUD'),
(9, 'Consumer Financial Protection Bureau', 'CFPB');

INSERT INTO loan_type (loan_type, loan_type_name) VALUES
(1, 'Conventional'),
(2, 'FHA-insured'),
(3, 'VA-guaranteed'),
(4, 'FSA/RHS-guaranteed');

INSERT INTO property_type (property_type, property_type_name) VALUES
(1, 'One-to-four family (other than manufactured housing)'),
(2, 'Manufactured housing'),
(3, 'Multifamily dwelling');

INSERT INTO loan_purpose (loan_purpose, loan_purpose_name) VALUES
(1, 'Home purchase'),
(2, 'Home improvement'),
(3, 'Refinancing');

INSERT INTO occupancy (owner_occupancy, owner_occupancy_name) VALUES
(1, 'Owner-occupied as a principal dwelling'),
(2, 'Not owner-occupied as a principal dwelling'),
(3, 'Not applicable');

INSERT INTO approval (preapproval, preapproval_name) VALUES
(1, 'Preapproval was requested'),
(2, 'Preapproval was not requested'),
(3, 'Not applicable');

INSERT INTO action (action_taken, action_taken_name) VALUES
(1, 'Loan originated'),
(2, 'Application approved but not accepted'),
(3, 'Application denied by financial institution'),
(4, 'Application withdrawn by applicant'),
(5, 'File closed for incompleteness'),
(6, 'Loan purchased by the institution'),
(7, 'Preapproval request denied by financial institution'),
(8, 'Preapproval request approved but not accepted');

-- Got these codes from: https://transition.fcc.gov/oet/info/maps/census/fips/fips.txt
INSERT INTO state (state_code, state_name, state_abbr) VALUES
(1, 'Alabama', 'AL'), 
(2, 'Alaska', 'AK'), 
(4, 'Arizona', 'AZ'), 
(5, 'Arkansas', 'AR'),
(6, 'California', 'CA'), 
(8, 'Colorado', 'CO'), 
(9, 'Connecticut', 'CT'), 
(10, 'Delaware', 'DE'),
(11, 'District of Columbia', 'DC'), 
(12, 'Florida', 'FL'), 
(13, 'Georgia', 'GA'), 
(15, 'Hawaii', 'HI'),
(16, 'Idaho', 'ID'), 
(17, 'Illinois', 'IL'), 
(18, 'Indiana', 'IN'), 
(19, 'Iowa', 'IA'),
(20, 'Kansas', 'KS'), 
(21, 'Kentucky', 'KY'), 
(22, 'Louisiana', 'LA'), 
(23, 'Maine', 'ME'),
(24, 'Maryland', 'MD'), 
(25, 'Massachusetts', 'MA'), 
(26, 'Michigan', 'MI'), 
(27, 'Minnesota', 'MN'),
(28, 'Mississippi', 'MS'), 
(29, 'Missouri', 'MO'), 
(30, 'Montana', 'MT'), 
(31, 'Nebraska', 'NE'),
(32, 'Nevada', 'NV'), 
(33, 'New Hampshire', 'NH'), 
(34, 'New Jersey', 'NJ'),
(35, 'New Mexico', 'NM'),
(36, 'New York', 'NY'), 
(37, 'North Carolina', 'NC'), 
(38, 'North Dakota', 'ND'), 
(39, 'Ohio', 'OH'),
(40, 'Oklahoma', 'OK'), 
(41, 'Oregon', 'OR'), 
(42, 'Pennsylvania', 'PA'), 
(44, 'Rhode Island', 'RI'),
(45, 'South Carolina', 'SC'), 
(46, 'South Dakota', 'SD'), 
(47, 'Tennessee', 'TN'),
(48, 'Texas', 'TX'),
(49, 'Utah', 'UT'), 
(50, 'Vermont', 'VT'), 
(51, 'Virginia', 'VA'), 
(53, 'Washington', 'WA'),
(54, 'West Virginia', 'WV'), 
(55, 'Wisconsin', 'WI'), 
(56, 'Wyoming', 'WY'), 
(60, 'American Samoa', 'AS'),
(66, 'Guam', 'GU'), 
(69, 'Northern Mariana Islands', 'MP'), 
(72, 'Puerto Rico', 'PR'), 
(78, 'U.S. Virgin Islands', 'VI');

INSERT INTO ethnicity (ethnicity_code, ethnicity_name) VALUES
(1, 'Hispanic or Latino'), 
(2, 'Not Hispanic or Latino'), 
(3, 'Information not provided by applicant in mail, Internet, or telephone application'), 
(4, 'Not applicable'), 
(5, 'No co-applicant');

INSERT INTO race (race_code, race_name) VALUES
(1, 'American Indian or Alaska Native'), 
(2, 'Asian'), 
(3, 'Black or African American'), 
(4, 'Native Hawaiian or Other Pacific Islander'),
(5, 'White'), 
(6, 'Information not provided by applicant in mail, Internet, or telephone application'), 
(7, 'Not applicable'), 
(8, 'No co-applicant');

INSERT INTO sex (sex_code, sex_name) VALUES
(1, 'Male'), 
(2, 'Female'), 
(3, 'Information not provided by applicant in mail, Internet, or telephone application'), 
(4, 'Not applicable'),
(5, 'No co-applicant');

INSERT INTO purchaser (purchaser_type, purchaser_type_name) VALUES
(0, 'Loan was not originated or was not sold in calendar year covered by register'), 
(1, 'Fannie Mae (FNMA)'), 
(2, 'Ginnie Mae (GNMA)'), 
(3, 'Freddie Mac (FHLMC)'), 
(4, 'Farmer Mac (FAMC)'),
(5, 'Private securitization'),
(6, 'Commercial bank, savings bank or savings association'), 
(7, 'Life insurance company, credit union, mortgage bank, or finance company'),
(8, 'Affiliate institution'), 
(9, 'Other type of purchaser');

INSERT INTO denial_lookup (denial_reason_code, denial_reason_name) VALUES
(1, 'Debt-to-income ratio'), 
(2, 'Employment history'), 
(3, 'Credit history'), 
(4, 'Collateral'),
(5, 'Insufficient cash (down payment, closing costs)'), 
(6, 'Unverifiable information'), 
(7, 'Credit application incomplete'), 
(8, 'Mortgage insurance denied'),
(9, 'Other');

INSERT INTO hoepa (hoepa_status, hoepa_status_name) VALUES
(1, 'HOEPA loan'), (2, 'Not a HOEPA loan');

INSERT INTO lien (lien_status, lien_status_name) VALUES
(1, 'Secured by a first lien'), 
(2, 'Secured by a subordinate lien'), 
(3, 'Not secured by a lien'),
(4, 'Not applicable');

INSERT INTO edit (edit_status, edit_status_name) VALUES
(1, 'Passed edit'), (2, 'Failed edit');

INSERT INTO municipal (msamd, msamd_name) VALUES
(11244, 'Anaheim, Santa Ana, Irvine - CA'),
(19124, 'Dallas, Plano, Irving - TX'),
(35614, 'New York, Jersey City, White Plains - NY, NJ'),
(33124, 'Miami, Miami Beach, Kendall - FL'),
(48864, 'Wilmington - DE, MD, NJ');

INSERT INTO county (state_code, county_code, county_name) VALUES
(6, 59, 'Orange County'),           -- CA
(48, 113, 'Dallas County'),         -- TX
(36, 61, 'New York County'),        -- NY
(12, 86, 'Miami-Dade County'),      -- FL
(10, 3, 'New Castle County');       -- DE (for Wilmington)

INSERT INTO location (
    msamd, state_code, county_code, census_tract_number,
    population, minority_population, hud_median_family_income,
    tract_to_msamd_income, number_of_owner_occupied_units,
    number_of_1_to_4_family_units
) VALUES
-- Anaheim - CA
(11244, 6, 59, 1100.01, 5000, 45.5, 95000, 110.5, 1200, 1400),
-- Dallas - TX
(19124, 48, 113, 202.00, 3500, 60.0, 78000, 95.0, 800, 1000),
-- New York - NY
(35614, 36, 61, 7.00, 8000, 25.0, 120000, 150.0, 200, 300),
-- Miami - FL
(33124, 12, 86, 15.02, 4200, 75.2, 55000, 80.0, 950, 1100),
-- Wilmington - DE
(48864, 10, 3, 101.00, 2500, 15.0, 68000, 105.0, 1500, 1600);

INSERT INTO loan (
    PRIMARY_ID, as_of_year, respondent_id, agency_code, loan_type, property_type,
    loan_purpose, owner_occupancy, loan_amount_000s, preapproval, action_taken,
    location_id, applicant_ethnicity, co_applicant_ethnicity, applicant_sex,
    co_applicant_sex, applicant_income_000s, purchaser_type, rate_spread,
    hoepa_status, lien_status, edit_status, sequence_number, application_date_indicator
) VALUES
-- Loan 1: Originated, CA, 2022
(10001, 2022, 'BANK001', 1, 1, 1, 1, 1, 550, 1, 1, 1, 2, 2, 1, 2, 125, 1, NULL, 2, 1, 1, 101, 0),

-- Loan 2: Denied, TX, 2021
(10002, 2021, 'CREDIT02', 5, 1, 1, 3, 1, 250, 3, 3, 2, 1, 5, 2, 5, 45, 0, NULL, 2, 1, 1, 102, 0),

-- Loan 3: Withdrawn, NY, 2023
(10003, 2023, 'BANK001', 2, 1, 3, 2, 2, 1500, 3, 4, 3, 2, 2, 1, 1, 450, 0, NULL, 2, 1, 1, 103, 0),

-- Loan 4: Originated, FL, 2020
(10004, 2020, 'MORTG03', 7, 2, 1, 1, 1, 300, 3, 1, 4, 1, 1, 2, 1, 65, 2, 1.50, 2, 1, 1, 104, 0),

-- Loan 5: Originated, DE, 2022 (This is the complex race example)
(10005, 2022, 'BANK005', 1, 1, 1, 1, 1, 450, 2, 1, 5, 2, 2, 1, 2, 110, 3, NULL, 2, 1, 1, 105, 0);

INSERT INTO applicant_race (PRIMARY_ID, race_code, num, co_applicant) VALUES
-- Loan 10001: Simple Case
(10001, 5, 1, FALSE),
(10001, 5, 1, TRUE),

-- Loan 10002: Denied loan
(10002, 3, 1, FALSE),
(10002, 8, 1, TRUE),

-- Loan 10003: Withdrawn
(10003, 2, 1, FALSE),
(10003, 2, 1, TRUE),

-- Loan 10004: Mixed Race
(10004, 5, 1, FALSE),
(10004, 2, 2, FALSE),
(10004, 5, 1, TRUE),

-- Loan 10005: Complex 5-Race Applicant (Selected all 5 available race options)
(10005, 1, 1, FALSE), -- American Indian
(10005, 2, 2, FALSE), -- Asian
(10005, 3, 3, FALSE), -- Black
(10005, 4, 4, FALSE), -- Pacific Islander
(10005, 5, 5, FALSE), -- White

-- Loan 10005: Complex 5-Race Co-Applicant
(10005, 5, 1, TRUE), -- White
(10005, 4, 2, TRUE), -- Pacific Islander
(10005, 3, 3, TRUE), -- Black
(10005, 2, 4, TRUE), -- Asian
(10005, 1, 5, TRUE); -- American Indian

INSERT INTO denial (PRIMARY_ID, num, denial_reason_code) VALUES
(10002, 1, 1), -- Debt-to-income ratio
(10002, 2, 3); -- Credit history