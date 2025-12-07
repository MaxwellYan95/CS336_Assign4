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

-- ==========================================
-- 1. Municipal (MSAMD)
-- Format: Name - ST (or multiple states separated by commas)
-- IDs chosen to avoid collision with FeedValues.sql
-- ==========================================
INSERT INTO municipal (msamd, msamd_name) VALUES
(48864, 'Wilmington - DE, MD, NJ'),
(35614, 'Jersey City, White Plains - NY, NJ'),
(15804, 'Camden - NJ'),
(35004, 'Nassau County, Suffolk County - NY'),
(41860, 'San Francisco-Oakland-Hayward - CA'),
(26420, 'Houston-The Woodlands-Sugar Land - TX'),
(12580, 'Baltimore, Columbia, Towson - MD'),
(45940, 'Trenton - NJ'),
(33860, 'Montgomery - AL');

-- ==========================================
-- 2. County
-- Ensure State Codes match the names (NJ=34, NY=36, CA=6, TX=48, MD=24)
-- ==========================================
INSERT INTO county (state_code, county_code, county_name) VALUES
(10, 3, 'Castle County'),      -- DE (Wilmington)
(24, 15, 'Cecil County'),          -- MD (Wilmington)
(34, 33, 'Salem County'),          -- NJ (Wilmington)
(34, 7, 'Camden County'),        -- NJ
(36, 61, 'Manhattan County'),       -- NY (NYC)
(34, 17, 'Hudson County'),         -- NJ (Jersey City)
(34, 21, 'Mercer County'),        -- NJ
(36, 103, 'Suffolk County'),      -- NY
(36, 81, 'Queens County'),        -- NY
(6, 1, 'Alameda County'),         -- CA
(48, 201, 'Harris County'),       -- TX
(24, 5, 'Baltimore County'),      -- MD
(1, 101, 'Montgomery County');     -- AL

-- ==========================================
-- 3. Location
-- Explicitly setting IDs starting at 100 to avoid auto-increment collisions
-- ==========================================
INSERT INTO location (
    location_id, msamd, state_code, county_code, census_tract_number,
    population, minority_population, hud_median_family_income,
    tract_to_msamd_income, number_of_owner_occupied_units,
    number_of_1_to_4_family_units
) VALUES
-- NJ Locations
(100, 15804, 34, 7, 6001.00, 4500, 30.5, 85000, 105.0, 1100, 1200), -- Camden
(101, 45940, 34, 21, 100.00, 3200, 45.0, 92000, 115.0, 800, 900),   -- Trenton

-- NY Locations
(102, 35004, 36, 103, 1500.01, 5500, 15.2, 105000, 120.0, 1500, 1550), -- Suffolk
(103, 35614, 36, 81, 200.02, 8000, 65.5, 72000, 90.0, 2000, 3000),     -- Queens (Using existing MSA 35614 from feed)

-- Other States
(104, 41860, 6, 1, 4005.00, 6000, 55.0, 115000, 130.0, 1400, 1600),    -- CA
(105, 26420, 48, 201, 3300.00, 7000, 40.0, 68000, 95.0, 1800, 2000),   -- TX
(106, 12580, 24, 5, 4900.00, 4000, 25.0, 88000, 100.0, 1000, 1100),    -- MD
(301, 48864, 10, 3, 101.0, 5000, 20.5, 75000, 100.0, 1200, 1300), -- Wilmington (DE side)
(302, 48864, 24, 15, 202.0, 4000, 15.0, 70000, 95.0, 1000, 1100), -- Wilmington (MD side)
(303, 48864, 34, 33, 303.0, 3000, 10.0, 65000, 90.0, 800, 900),   -- Wilmington (NJ side)
(304, 35614, 36, 61, 10.01, 15000, 45.0, 120000, 150.0, 5000, 6000), -- NY/NJ (NY side)
(305, 35614, 34, 17, 50.05, 12000, 40.0, 110000, 140.0, 4000, 4500), -- NY/NJ (NJ side)
(306, 12580, 24, 5, 400.0, 6000, 55.0, 80000, 105.0, 1500, 1600),
(307, 41860, 6, 1, 500.0, 9000, 65.0, 130000, 160.0, 2000, 2200),
(308, 15804, 34, 7, 600.0, 7000, 35.0, 85000, 110.0, 1800, 1900),
(309, 33860, 1, 101, 700.0, 3500, 50.0, 60000, 85.0, 900, 1000);

-- ==========================================
-- 4. Loan
-- IDs 20001 - 20035
-- Includes varied years, action types, and respondent ID formats
-- ==========================================
INSERT INTO loan (
    PRIMARY_ID, as_of_year, respondent_id, agency_code, loan_type, property_type,
    loan_purpose, owner_occupancy, loan_amount_000s, preapproval, action_taken,
    location_id, applicant_ethnicity, co_applicant_ethnicity, applicant_sex,
    co_applicant_sex, applicant_income_000s, purchaser_type, rate_spread,
    hoepa_status, lien_status, edit_status, sequence_number, application_date_indicator
) VALUES
-- 20001: 5 Races Applicant, Originated, 2022
(20001, 2022, '1234567890', 1, 1, 1, 1, 1, 350, 3, 1, 100, 2, 5, 1, 5, 120, 1, NULL, 2, 1, 1, 1, 0),

-- 20002: 5 Races Co-Applicant, Originated, 2022
(20002, 2022, '9876543210', 2, 1, 1, 1, 1, 400, 3, 1, 101, 2, 2, 1, 2, 150, 3, NULL, 2, 1, 1, 2, 0),

-- 20003: 5 Races BOTH, Originated, 2021
(20003, 2021, '111222-333', 3, 1, 1, 3, 1, 600, 3, 1, 102, 2, 2, 1, 2, 200, 1, NULL, 2, 1, 1, 3, 0),

-- 20004: 4 Races App, Denied (3 reasons), 2021
(20004, 2021, 'BANK-99901', 7, 2, 1, 1, 1, 250, 3, 3, 103, 1, 5, 2, 5, 50, 0, NULL, 2, 1, 1, 4, 0),

-- 20005: 3 Races App, Denied (2 reasons), 2020
(20005, 2020, '12345-6789', 9, 1, 1, 2, 1, 100, 3, 3, 104, 2, 5, 1, 5, 80, 0, NULL, 2, 1, 1, 5, 0),

-- 20006: 2 Races App, Denied (1 reason), 2020
(20006, 2020, '5555555555', 1, 3, 1, 1, 1, 320, 3, 3, 105, 2, 5, 2, 5, 95, 0, NULL, 2, 1, 1, 6, 0),

-- Standard Loans (1 Race) - Varied Locations & Years
(20007, 2019, '999999-001', 2, 1, 1, 3, 1, 180, 3, 1, 106, 2, 2, 1, 2, 110, 6, NULL, 2, 1, 1, 7, 0), -- MD
(20008, 2022, '999999-002', 1, 1, 1, 1, 1, 550, 1, 1, 102, 2, 2, 2, 1, 160, 1, NULL, 2, 1, 1, 8, 0), -- NY
(20009, 2021, '999999-003', 3, 1, 1, 1, 2, 220, 3, 1, 100, 1, 5, 1, 5, 65, 3, NULL, 2, 2, 1, 9, 0),  -- NJ
(20010, 2020, '999999-004', 5, 2, 1, 1, 1, 290, 3, 1, 104, 2, 2, 1, 2, 90, 2, 1.25, 2, 1, 1, 10, 0), -- CA
(20011, 2022, '88888-7777', 7, 1, 2, 1, 1, 150, 3, 1, 105, 2, 5, 2, 5, 45, 0, NULL, 2, 1, 1, 11, 0), -- TX (Manuf. Home)
(20012, 2021, '77777-6666', 9, 1, 3, 3, 2, 850, 3, 1, 103, 2, 2, 1, 1, 300, 0, NULL, 2, 1, 1, 12, 0), -- NY (Multifamily)
(20013, 2019, '66666-5555', 1, 1, 1, 2, 1, 60, 3, 6, 101, 2, 2, 2, 2, 130, 0, NULL, 2, 1, 1, 13, 0),  -- NJ (Purchased loan)
(20014, 2022, '1010101010', 2, 1, 1, 1, 1, 410, 3, 2, 104, 2, 2, 1, 2, 125, 0, NULL, 2, 1, 1, 14, 0), -- CA (Approved not accepted)
(20015, 2021, '2020202020', 3, 3, 1, 3, 1, 330, 3, 4, 106, 2, 5, 1, 5, 88, 0, NULL, 2, 1, 1, 15, 0),  -- MD (Withdrawn)

-- More Denials for stats
(20016, 2022, 'DENY-00001', 1, 1, 1, 1, 1, 600, 3, 3, 102, 2, 5, 1, 5, 55, 0, NULL, 2, 1, 1, 16, 0), -- NY, Denied
(20017, 2022, 'DENY-00002', 1, 1, 1, 1, 1, 400, 3, 3, 105, 1, 1, 2, 2, 60, 0, NULL, 2, 1, 1, 17, 0), -- TX, Denied
(20018, 2020, 'DENY-00003', 1, 1, 1, 3, 1, 250, 3, 3, 100, 3, 3, 1, 5, 40, 0, NULL, 2, 1, 1, 18, 0), -- NJ, Denied

-- Filling out to ~30 records with standard data
(20019, 2019, 'FILL-00001', 1, 1, 1, 1, 1, 300, 3, 1, 106, 2, 2, 1, 2, 100, 1, NULL, 2, 1, 1, 19, 0),
(20020, 2020, 'FILL-00002', 2, 1, 1, 1, 1, 310, 3, 1, 101, 2, 2, 1, 2, 105, 1, NULL, 2, 1, 1, 20, 0),
(20021, 2021, 'FILL-00003', 3, 1, 1, 3, 1, 320, 3, 1, 102, 2, 2, 1, 2, 110, 1, NULL, 2, 1, 1, 21, 0),
(20022, 2022, 'FILL-00004', 5, 1, 1, 3, 1, 330, 3, 1, 103, 2, 2, 1, 2, 115, 1, NULL, 2, 1, 1, 22, 0),
(20023, 2022, 'FILL-00005', 7, 1, 1, 1, 1, 340, 3, 1, 104, 2, 2, 1, 2, 120, 1, NULL, 2, 1, 1, 23, 0),
(20024, 2021, 'FILL-00006', 9, 1, 1, 1, 1, 350, 3, 1, 105, 2, 2, 1, 2, 125, 1, NULL, 2, 1, 1, 24, 0),
(20025, 2020, 'FILL-00007', 1, 1, 1, 1, 1, 360, 3, 1, 100, 2, 2, 1, 2, 130, 1, NULL, 2, 1, 1, 25, 0),
(20026, 2019, 'FILL-00008', 2, 1, 1, 3, 1, 370, 3, 1, 101, 2, 2, 1, 2, 135, 1, NULL, 2, 1, 1, 26, 0),
(20027, 2022, 'FILL-00009', 3, 1, 1, 2, 1, 380, 3, 1, 102, 2, 2, 1, 2, 140, 1, NULL, 2, 1, 1, 27, 0),
(20028, 2021, 'FILL-00010', 5, 1, 1, 1, 1, 390, 3, 1, 103, 2, 2, 1, 2, 145, 1, NULL, 2, 1, 1, 28, 0),
(20029, 2020, 'FILL-00011', 7, 1, 1, 1, 1, 400, 3, 1, 104, 2, 2, 1, 2, 150, 1, NULL, 2, 1, 1, 29, 0),
(20030, 2022, 'FILL-00012', 9, 1, 1, 1, 1, 410, 3, 1, 105, 2, 2, 1, 2, 155, 1, NULL, 2, 1, 1, 30, 0),
(20031, 2021, 'FILL-00013', 1, 1, 1, 3, 1, 420, 3, 1, 106, 2, 2, 1, 2, 160, 1, NULL, 2, 1, 1, 31, 0),
(20032, 2022, 'FILL-00014', 2, 1, 1, 1, 1, 430, 3, 1, 100, 2, 2, 1, 2, 165, 1, NULL, 2, 1, 1, 32, 0),

-- 40 records, varied years, formatted respondent IDs
(30001, 2019, '6438972332', 5, 1, 2, 1, 3, 350, 3, 1, 304, 2, 5, 2, 3, 131, 0, 2.36, 2, 1, 1, 1, 0),
(30002, 2022, '11689-1936', 7, 4, 3, 1, 2, 750, 3, 1, 308, 3, 1, 2, 3, 84, 0, 0.97, 2, 1, 1, 2, 0),
(30003, 2020, '8556699127', 9, 3, 3, 2, 1, 250, 1, 1, 309, 1, 2, 3, 3, 178, 3, 1.81, 2, 1, 1, 3, 0),
(30004, 2020, '63705-5256', 2, 4, 2, 1, 1, 750, 2, 1, 301, 3, 3, 2, 1, 153, 1, 0.69, 2, 1, 1, 4, 0),
(30005, 2020, '7181714223', 7, 1, 1, 1, 1, 500, 3, 3, 304, 1, 2, 3, 1, 187, 0, NULL, 2, 1, 1, 5, 0),
(30006, 2020, '1036171915', 2, 1, 3, 2, 3, 250, 2, 1, 307, 2, 2, 2, 3, 201, 2, 2.38, 2, 1, 1, 6, 0),
(30007, 2020, '58645-6530', 3, 3, 1, 1, 1, 750, 1, 2, 308, 2, 5, 1, 2, 145, 0, NULL, 2, 1, 1, 7, 0),
(30008, 2021, '7753250312', 7, 3, 2, 3, 2, 350, 3, 1, 303, 2, 1, 2, 5, 100, 0, 2.48, 2, 1, 1, 8, 0),
(30009, 2022, '9449393288', 5, 1, 3, 3, 1, 1000, 3, 1, 309, 2, 3, 2, 1, 277, 3, 1.77, 2, 1, 1, 9, 0),
(30010, 2022, '32708-4728', 1, 1, 1, 3, 3, 350, 3, 3, 307, 2, 1, 3, 1, 240, 0, NULL, 2, 1, 1, 10, 0),
(30011, 2021, '94772-2794', 5, 2, 2, 3, 2, 750, 2, 1, 302, 1, 5, 3, 1, 80, 3, 1.23, 2, 1, 1, 11, 0),
(30012, 2020, '76043-8165', 1, 3, 3, 1, 1, 500, 2, 1, 307, 2, 2, 3, 1, 235, 3, 1.81, 2, 1, 1, 12, 0),
(30013, 2019, '8732656003', 1, 4, 2, 1, 1, 350, 1, 1, 301, 2, 2, 2, 1, 114, 3, 1.56, 2, 1, 1, 13, 0),
(30014, 2019, '22822-8361', 5, 4, 3, 1, 2, 1000, 3, 2, 306, 2, 3, 3, 5, 212, 0, NULL, 2, 1, 1, 14, 0),
(30015, 2019, '71367-2888', 7, 1, 3, 3, 3, 350, 3, 3, 306, 3, 5, 3, 1, 258, 2, NULL, 2, 1, 1, 15, 0),
(30016, 2022, '80589-2580', 5, 4, 3, 3, 1, 500, 2, 1, 308, 3, 1, 2, 2, 103, 2, 0.43, 2, 1, 1, 16, 0),
(30017, 2022, '21337-7986', 5, 2, 1, 3, 1, 750, 2, 1, 305, 1, 1, 3, 5, 48, 3, 1.00, 2, 1, 1, 17, 0),
(30018, 2022, '4782554504', 5, 4, 1, 1, 3, 500, 2, 1, 307, 1, 1, 3, 5, 135, 1, 1.15, 2, 1, 1, 18, 0),
(30019, 2020, '50849-1105', 5, 3, 2, 2, 1, 250, 2, 1, 306, 1, 1, 2, 3, 122, 0, 0.27, 2, 1, 1, 19, 0),
(30020, 2019, '43376-8541', 7, 3, 2, 1, 1, 150, 2, 3, 303, 2, 3, 3, 1, 288, 3, NULL, 2, 1, 1, 20, 0),
(30021, 2022, '3569424910', 5, 4, 2, 2, 3, 1000, 1, 2, 305, 1, 1, 3, 5, 41, 1, NULL, 2, 1, 1, 21, 0),
(30022, 2020, '4248473749', 2, 1, 2, 1, 1, 750, 3, 1, 309, 1, 5, 3, 5, 240, 2, 1.88, 2, 1, 1, 22, 0),
(30023, 2021, '9510886256', 1, 4, 2, 3, 2, 750, 1, 1, 303, 2, 1, 3, 5, 263, 0, 2.12, 2, 1, 1, 23, 0),
(30024, 2019, '4399052134', 1, 1, 2, 2, 3, 350, 3, 1, 304, 1, 5, 2, 1, 270, 2, 1.45, 2, 1, 1, 24, 0),
(30025, 2019, '9501245719', 2, 1, 2, 2, 2, 500, 1, 3, 309, 1, 1, 3, 3, 246, 2, NULL, 2, 1, 1, 25, 0),
(30026, 2020, '8703342096', 5, 1, 1, 1, 2, 1000, 1, 1, 302, 1, 1, 3, 1, 284, 2, 1.69, 2, 1, 1, 26, 0),
(30027, 2019, '7549249685', 7, 2, 1, 3, 2, 1000, 1, 1, 305, 1, 5, 3, 1, 50, 2, 0.31, 2, 1, 1, 27, 0),
(30028, 2022, '8439358526', 2, 3, 2, 2, 2, 500, 3, 2, 304, 1, 3, 2, 1, 157, 0, NULL, 2, 1, 1, 28, 0),
(30029, 2022, '45161-2936', 2, 1, 3, 2, 2, 250, 3, 1, 305, 3, 2, 1, 5, 159, 1, 2.28, 2, 1, 1, 29, 0),
(30030, 2020, '2171289564', 7, 2, 2, 3, 2, 1000, 1, 3, 303, 2, 1, 2, 1, 281, 2, NULL, 2, 1, 1, 30, 0),
(30031, 2019, '25440-3680', 1, 2, 3, 2, 1, 1000, 2, 1, 308, 2, 2, 1, 5, 170, 2, 0.86, 2, 1, 1, 31, 0),
(30032, 2022, '3392633317', 7, 4, 2, 3, 1, 1000, 1, 1, 302, 3, 3, 3, 5, 89, 3, 0.67, 2, 1, 1, 32, 0),
(30033, 2019, '39704-3282', 3, 4, 2, 1, 3, 500, 2, 1, 308, 3, 5, 3, 3, 233, 3, 2.43, 2, 1, 1, 33, 0),
(30034, 2020, '58137-8629', 1, 4, 3, 2, 3, 500, 1, 1, 308, 3, 2, 3, 1, 249, 0, 0.57, 2, 1, 1, 34, 0),
(30035, 2022, '66477-9751', 7, 4, 2, 2, 1, 350, 2, 3, 307, 1, 3, 3, 3, 229, 1, NULL, 2, 1, 1, 35, 0),
(30036, 2019, '1795395246', 3, 3, 1, 3, 3, 1000, 1, 1, 306, 2, 5, 1, 5, 166, 3, 1.01, 2, 1, 1, 36, 0),
(30037, 2019, '95589-5487', 5, 3, 3, 1, 3, 1000, 3, 1, 304, 3, 1, 1, 2, 274, 3, 1.95, 2, 1, 1, 37, 0),
(30038, 2022, '5540873623', 5, 3, 1, 1, 3, 250, 1, 1, 303, 1, 1, 2, 1, 145, 0, 2.45, 2, 1, 1, 38, 0),
(30039, 2022, '78893-2489', 1, 4, 2, 3, 3, 150, 1, 1, 306, 1, 2, 3, 3, 162, 1, 2.04, 2, 1, 1, 39, 0),
(30040, 2022, '71094-8877', 1, 4, 3, 3, 2, 1000, 3, 3, 303, 3, 2, 2, 2, 137, 2, NULL, 2, 1, 1, 40, 0);

-- ==========================================
-- 5. Applicant Race
-- Handling the complex race requirements
-- ==========================================

-- LOAN 20001: 5 Races for Applicant (All options 1-5), No Co-Applicant
INSERT INTO applicant_race (PRIMARY_ID, race_code, num, co_applicant) VALUES
(20001, 1, 1, FALSE),
(20001, 2, 2, FALSE),
(20001, 3, 3, FALSE),
(20001, 4, 4, FALSE),
(20001, 5, 5, FALSE);

-- LOAN 20002: 1 Race for Applicant, 5 Races for Co-Applicant
INSERT INTO applicant_race (PRIMARY_ID, race_code, num, co_applicant) VALUES
(20002, 5, 1, FALSE), -- Applicant White
(20002, 1, 1, TRUE),  -- Co-App 5 Races
(20002, 2, 2, TRUE),
(20002, 3, 3, TRUE),
(20002, 4, 4, TRUE),
(20002, 5, 5, TRUE);

-- LOAN 20003: 5 Races Applicant AND 5 Races Co-Applicant
INSERT INTO applicant_race (PRIMARY_ID, race_code, num, co_applicant) VALUES
(20003, 1, 1, FALSE), (20003, 2, 2, FALSE), (20003, 3, 3, FALSE), (20003, 4, 4, FALSE), (20003, 5, 5, FALSE),
(20003, 1, 1, TRUE),  (20003, 2, 2, TRUE),  (20003, 3, 3, TRUE),  (20003, 4, 4, TRUE),  (20003, 5, 5, TRUE);

-- LOAN 20004: 4 Races Applicant
INSERT INTO applicant_race (PRIMARY_ID, race_code, num, co_applicant) VALUES
(20004, 1, 1, FALSE),
(20004, 2, 2, FALSE),
(20004, 3, 3, FALSE),
(20004, 5, 4, FALSE);

-- LOAN 20005: 3 Races Applicant
INSERT INTO applicant_race (PRIMARY_ID, race_code, num, co_applicant) VALUES
(20005, 3, 1, FALSE), -- Black
(20005, 4, 2, FALSE), -- Pacific Islander
(20005, 5, 3, FALSE); -- White

-- LOAN 20006: 2 Races Applicant
INSERT INTO applicant_race (PRIMARY_ID, race_code, num, co_applicant) VALUES
(20006, 2, 1, FALSE), -- Asian
(20006, 5, 2, FALSE); -- White

-- Standard Races for remaining loans (Simple loop logic manually expanded)
INSERT INTO applicant_race (PRIMARY_ID, race_code, num, co_applicant) VALUES
(20007, 5, 1, FALSE), (20007, 5, 1, TRUE),
(20008, 5, 1, FALSE), (20008, 5, 1, TRUE),
(20009, 2, 1, FALSE), (20009, 8, 1, TRUE), -- Asian, No Co-App
(20010, 3, 1, FALSE), (20010, 3, 1, TRUE),
(20011, 5, 1, FALSE), (20011, 8, 1, TRUE),
(20012, 1, 1, FALSE), (20012, 1, 1, TRUE),
(20013, 5, 1, FALSE), (20013, 5, 1, TRUE),
(20014, 2, 1, FALSE), (20014, 2, 1, TRUE),
(20015, 3, 1, FALSE), (20015, 8, 1, TRUE),
(20016, 5, 1, FALSE), (20016, 8, 1, TRUE),
(20017, 4, 1, FALSE), (20017, 4, 1, TRUE),
(20018, 6, 1, FALSE), (20018, 8, 1, TRUE), -- Info not provided
(20019, 5, 1, FALSE), (20019, 5, 1, TRUE),
(20020, 5, 1, FALSE), (20020, 5, 1, TRUE),
(20021, 5, 1, FALSE), (20021, 5, 1, TRUE),
(20022, 5, 1, FALSE), (20022, 5, 1, TRUE),
(20023, 5, 1, FALSE), (20023, 5, 1, TRUE),
(20024, 5, 1, FALSE), (20024, 5, 1, TRUE),
(20025, 5, 1, FALSE), (20025, 5, 1, TRUE),
(20026, 5, 1, FALSE), (20026, 5, 1, TRUE),
(20027, 5, 1, FALSE), (20027, 5, 1, TRUE),
(20028, 5, 1, FALSE), (20028, 5, 1, TRUE),
(20029, 5, 1, FALSE), (20029, 5, 1, TRUE),
(20030, 5, 1, FALSE), (20030, 5, 1, TRUE),
(20031, 5, 1, FALSE), (20031, 5, 1, TRUE),
(20032, 5, 1, FALSE), (20032, 5, 1, TRUE);

-- Generated to include 1, 2, 3, 4, and 5 races for applicants and co-applicants
INSERT INTO applicant_race (PRIMARY_ID, race_code, num, co_applicant) VALUES
(30001, 1, 1, FALSE),
(30002, 1, 1, FALSE),
(30002, 1, 1, TRUE),
(30003, 1, 1, FALSE),
(30003, 1, 1, TRUE),
(30004, 1, 1, FALSE),
(30004, 1, 1, TRUE),
(30005, 1, 1, FALSE),
(30005, 2, 2, FALSE),
(30005, 3, 3, FALSE),
(30005, 4, 4, FALSE),
(30005, 5, 5, FALSE), -- 5 Races for Applicant
(30005, 1, 1, TRUE),
(30006, 1, 1, FALSE),
(30006, 1, 1, TRUE),
(30007, 1, 1, FALSE),
(30008, 1, 1, FALSE),
(30008, 1, 1, TRUE),
(30009, 1, 1, FALSE),
(30009, 1, 1, TRUE),
(30010, 1, 1, FALSE),
(30010, 1, 1, TRUE),
(30010, 2, 2, TRUE),
(30010, 3, 3, TRUE),
(30010, 4, 4, TRUE),
(30010, 5, 5, TRUE), -- 5 Races for Co-Applicant
(30011, 1, 1, FALSE),
(30012, 1, 1, FALSE),
(30012, 1, 1, TRUE),
(30013, 1, 1, FALSE),
(30013, 1, 1, TRUE),
(30014, 1, 1, FALSE),
(30014, 1, 1, TRUE),
(30015, 1, 1, FALSE),
(30015, 2, 2, FALSE),
(30015, 3, 3, FALSE),
(30015, 4, 4, FALSE), -- 4 Races for Applicant
(30016, 1, 1, FALSE),
(30016, 1, 1, TRUE),
(30017, 1, 1, FALSE),
(30017, 1, 1, TRUE),
(30018, 1, 1, FALSE),
(30018, 1, 1, TRUE),
(30019, 1, 1, FALSE),
(30019, 1, 1, TRUE),
(30020, 1, 1, FALSE),
(30020, 1, 1, TRUE),
(30021, 1, 1, FALSE),
(30021, 1, 1, TRUE),
(30022, 1, 1, FALSE),
(30023, 1, 1, FALSE),
(30023, 1, 1, TRUE),
(30024, 1, 1, FALSE),
(30025, 1, 1, FALSE),
(30025, 2, 2, FALSE),
(30025, 3, 3, FALSE), -- 3 Races for Applicant
(30025, 1, 1, TRUE),
(30026, 1, 1, FALSE),
(30026, 1, 1, TRUE),
(30027, 1, 1, FALSE),
(30028, 1, 1, FALSE),
(30028, 1, 1, TRUE),
(30029, 1, 1, FALSE),
(30029, 1, 1, TRUE),
(30030, 1, 1, FALSE),
(30030, 1, 1, TRUE),
(30031, 1, 1, FALSE),
(30031, 1, 1, TRUE),
(30032, 1, 1, FALSE),
(30032, 1, 1, TRUE),
(30033, 1, 1, FALSE),
(30034, 1, 1, FALSE),
(30034, 1, 1, TRUE),
(30035, 1, 1, FALSE),
(30035, 2, 2, FALSE), -- 2 Races for Applicant
(30035, 1, 1, TRUE),
(30036, 1, 1, FALSE),
(30037, 1, 1, FALSE),
(30037, 1, 1, TRUE),
(30038, 1, 1, FALSE),
(30038, 1, 1, TRUE),
(30039, 1, 1, FALSE),
(30039, 1, 1, TRUE),
(30040, 1, 1, FALSE),
(30040, 1, 1, TRUE);

-- ==========================================
-- 6. Denial
-- Handling variety of denial reasons for denied loans
-- ==========================================

-- Loan 20004: 3 Denial Reasons
INSERT INTO denial (PRIMARY_ID, num, denial_reason_code) VALUES
(20004, 1, 1), -- DTI
(20004, 2, 3), -- Credit History
(20004, 3, 4); -- Collateral

-- Loan 20005: 2 Denial Reasons
INSERT INTO denial (PRIMARY_ID, num, denial_reason_code) VALUES
(20005, 1, 2), -- Employment
(20005, 2, 5); -- Insufficient Cash

-- Loan 20006: 1 Denial Reason
INSERT INTO denial (PRIMARY_ID, num, denial_reason_code) VALUES
(20006, 1, 9); -- Other

-- Loan 20016: 1 Denial Reason
INSERT INTO denial (PRIMARY_ID, num, denial_reason_code) VALUES
(20016, 1, 3); -- Credit History

-- Loan 20017: 2 Denial Reasons
INSERT INTO denial (PRIMARY_ID, num, denial_reason_code) VALUES
(20017, 1, 1), -- DTI
(20017, 2, 6); -- Unverifiable info

-- Loan 20018: 1 Denial Reason
INSERT INTO denial (PRIMARY_ID, num, denial_reason_code) VALUES
(20018, 1, 4); -- Collateral

-- Generated for loans with action_taken=3 (Denied), with 1, 2, or 3 reasons
INSERT INTO denial (PRIMARY_ID, num, denial_reason_code) VALUES
(30005, 1, 1),
(30005, 2, 2), -- 2 Reasons
(30010, 1, 1),
(30010, 2, 2),
(30010, 3, 3), -- 3 Reasons
(30015, 1, 1),
(30015, 2, 2),
(30020, 1, 1),
(30020, 2, 2),
(30020, 3, 3),
(30025, 1, 1),
(30025, 2, 2),
(30030, 1, 1),
(30030, 2, 2),
(30030, 3, 3),
(30035, 1, 1),
(30035, 2, 2),
(30040, 1, 1),
(30040, 2, 2),
(30040, 3, 3);