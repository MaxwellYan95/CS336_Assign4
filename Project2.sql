SET statement_timeout = 0;  -- disables timeout


-- Drop main data table first
DROP TABLE IF EXISTS applicant_race CASCADE;
DROP TABLE IF EXISTS denial CASCADE;
DROP TABLE IF EXISTS loan CASCADE;
    
DROP TABLE IF EXISTS agency;
DROP TABLE IF EXISTS loan_type;
DROP TABLE IF EXISTS property_type;
DROP TABLE IF EXISTS loan_purpose;
DROP TABLE IF EXISTS occupancy;
DROP TABLE IF EXISTS approval;
DROP TABLE IF EXISTS action;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS municipal;
DROP TABLE IF EXISTS county;
DROP TABLE IF EXISTS state;
DROP TABLE IF EXISTS ethnicity;
DROP TABLE IF EXISTS race;
DROP TABLE IF EXISTS sex;
DROP TABLE IF EXISTS purchaser;
DROP TABLE IF EXISTS denial_lookup;
DROP TABLE IF EXISTS hoepa;
DROP TABLE IF EXISTS lien;
DROP TABLE IF EXISTS edit;

CREATE TABLE municipal (
    msamd INTEGER PRIMARY KEY,
    msamd_name TEXT
);

CREATE TABLE state (
    state_code INTEGER PRIMARY KEY,
    state_name TEXT,
    state_abbr TEXT
);

CREATE TABLE county (
    state_code INTEGER NOT NULL,
    county_code INTEGER NOT NULL,
    county_name TEXT,
    PRIMARY KEY (state_code, county_code),
    FOREIGN KEY (state_code) REFERENCES state(state_code)
);

CREATE TABLE agency (
    agency_code SMALLINT PRIMARY KEY,
    agency_name TEXT,
    agency_abbr TEXT
);

CREATE TABLE loan_type (
    loan_type SMALLINT PRIMARY KEY,
    loan_type_name TEXT
);

CREATE TABLE property_type (
    property_type SMALLINT PRIMARY KEY,
    property_type_name TEXT
);

CREATE TABLE loan_purpose (
    loan_purpose SMALLINT PRIMARY KEY,
    loan_purpose_name TEXT
);

CREATE TABLE occupancy (
    owner_occupancy SMALLINT PRIMARY KEY,
    owner_occupancy_name TEXT
);

CREATE TABLE approval (
    preapproval SMALLINT PRIMARY KEY,
    preapproval_name TEXT
);

CREATE TABLE action (
    action_taken SMALLINT PRIMARY KEY,
    action_taken_name TEXT
);

CREATE TABLE ethnicity (
    ethnicity_code SMALLINT PRIMARY KEY,
    ethnicity_name TEXT
);

CREATE TABLE sex (
    sex_code SMALLINT PRIMARY KEY,
    sex_name TEXT
);

CREATE TABLE purchaser (
    purchaser_type SMALLINT PRIMARY KEY,
    purchaser_type_name TEXT
);

CREATE TABLE hoepa (
    hoepa_status SMALLINT PRIMARY KEY,
    hoepa_status_name TEXT
);

CREATE TABLE lien (
    lien_status SMALLINT PRIMARY KEY,
    lien_status_name TEXT
);

CREATE TABLE edit (
    edit_status SMALLINT PRIMARY KEY,
    edit_status_name TEXT
);

CREATE TABLE race (
    race_code SMALLINT PRIMARY KEY,
    race_name TEXT
);

CREATE TABLE denial_lookup (
    denial_reason_code SMALLINT PRIMARY KEY,
    denial_reason_name TEXT
);

CREATE TABLE location (
    location_id SERIAL PRIMARY KEY,
    msamd INTEGER,
    state_code INTEGER,
    county_code INTEGER,
    census_tract_number NUMERIC,
    population INTEGER,
    minority_population NUMERIC,
    hud_median_family_income INTEGER,
    tract_to_msamd_income NUMERIC,
    number_of_owner_occupied_units INTEGER,
    number_of_1_to_4_family_units INTEGER,
    FOREIGN KEY (msamd) REFERENCES municipal(msamd),
    FOREIGN KEY (state_code) REFERENCES state(state_code),
    FOREIGN KEY (state_code, county_code) REFERENCES county(state_code, county_code),
    UNIQUE (
        county_code, msamd, state_code, census_tract_number,
        population, minority_population, hud_median_family_income,
        tract_to_msamd_income, number_of_owner_occupied_units,
        number_of_1_to_4_family_units
    )
);

CREATE TABLE loan (
    PRIMARY_ID INTEGER PRIMARY KEY,
    as_of_year SMALLINT,
    respondent_id VARCHAR(10),
    agency_code SMALLINT,
    loan_type SMALLINT,
    property_type SMALLINT,
    loan_purpose SMALLINT,
    owner_occupancy SMALLINT,
    loan_amount_000s INTEGER,
    preapproval SMALLINT,
    action_taken SMALLINT,
    location_id INTEGER,
    applicant_ethnicity SMALLINT,
    co_applicant_ethnicity SMALLINT,
    applicant_sex SMALLINT,
    co_applicant_sex SMALLINT,
    applicant_income_000s INTEGER,
    purchaser_type SMALLINT,
    rate_spread NUMERIC(5,2),
    hoepa_status SMALLINT,
    lien_status SMALLINT,
    edit_status SMALLINT,
    sequence_number INTEGER,
    application_date_indicator SMALLINT,
    FOREIGN KEY (agency_code) REFERENCES agency(agency_code),
    FOREIGN KEY (loan_type) REFERENCES loan_type(loan_type),
    FOREIGN KEY (property_type) REFERENCES property_type(property_type),
    FOREIGN KEY (loan_purpose) REFERENCES loan_purpose(loan_purpose),
    FOREIGN KEY (owner_occupancy) REFERENCES occupancy(owner_occupancy),
    FOREIGN KEY (preapproval) REFERENCES approval(preapproval),
    FOREIGN KEY (action_taken) REFERENCES action(action_taken),
    FOREIGN KEY (location_id) REFERENCES location(location_id),
    FOREIGN KEY (applicant_ethnicity) REFERENCES ethnicity(ethnicity_code),
    FOREIGN KEY (co_applicant_ethnicity) REFERENCES ethnicity(ethnicity_code),
    FOREIGN KEY (applicant_sex) REFERENCES sex(sex_code),
    FOREIGN KEY (co_applicant_sex) REFERENCES sex(sex_code),
    FOREIGN KEY (purchaser_type) REFERENCES purchaser(purchaser_type),
    FOREIGN KEY (hoepa_status) REFERENCES hoepa(hoepa_status),
    FOREIGN KEY (lien_status) REFERENCES lien(lien_status),
    FOREIGN KEY (edit_status) REFERENCES edit(edit_status)
);

CREATE TABLE applicant_race (
    PRIMARY_ID INTEGER NOT NULL,
    race_code SMALLINT NOT NULL,
    num SMALLINT NOT NULL,
    co_applicant BOOLEAN NOT NULL,
    PRIMARY KEY (PRIMARY_ID, co_applicant, num),
    FOREIGN KEY (PRIMARY_ID) REFERENCES loan(PRIMARY_ID),
    FOREIGN KEY (race_code) REFERENCES race(race_code)
);

CREATE TABLE denial (
    PRIMARY_ID INTEGER NOT NULL,
    num SMALLINT NOT NULL,
    denial_reason_code SMALLINT NOT NULL,
    PRIMARY KEY (PRIMARY_ID, num),
    FOREIGN KEY (PRIMARY_ID) REFERENCES loan(PRIMARY_ID),
    FOREIGN KEY (denial_reason_code) REFERENCES denial_lookup(denial_reason_code)
);


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

-- Handling missing MSAMD names by assigning a placeholder name
INSERT INTO municipal (msamd, msamd_name)
SELECT 
    msamd::INTEGER,
    msamd_name
FROM Preliminary
WHERE msamd <> ''
GROUP BY msamd, msamd_name;

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

INSERT INTO county (state_code, county_code, county_name)
SELECT 
    state_code::INTEGER,
    county_code::INTEGER,
    county_name
FROM Preliminary
WHERE state_code <> '' AND county_code <> ''
GROUP BY state_code, county_code, county_name;

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



-- Inserting into location table
insert into location(msamd, state_code, county_code, census_tract_number, population, minority_population, hud_median_family_income, tract_to_msamd_income, number_of_owner_occupied_units, number_of_1_to_4_family_units)
select DISTINCT
    CASE WHEN msamd = '' THEN NULL ELSE CAST(msamd AS INTEGER) END,
    CASE WHEN state_code = '' THEN NULL ELSE CAST(state_code AS INTEGER) END,
    CASE WHEN county_code = '' THEN NULL ELSE CAST(county_code AS INTEGER) END,
    CASE WHEN census_tract_number = '' THEN NULL ELSE CAST(census_tract_number AS NUMERIC) END,
    CASE WHEN population = '' THEN NULL ELSE CAST(population AS INTEGER) END,
    CASE WHEN minority_population = '' THEN NULL ELSE CAST(minority_population AS NUMERIC) END,
    CASE WHEN hud_median_family_income = '' THEN NULL ELSE CAST(hud_median_family_income AS INTEGER) END,
    CASE WHEN tract_to_msamd_income = '' THEN NULL ELSE CAST(tract_to_msamd_income AS NUMERIC) END,
    CASE WHEN number_of_owner_occupied_units = '' THEN NULL ELSE CAST(number_of_owner_occupied_units AS INTEGER) END,
    CASE WHEN number_of_1_to_4_family_units = '' THEN NULL ELSE CAST(number_of_1_to_4_family_units AS INTEGER) END
from preliminary;



-- Insert into loans
insert into loan(PRIMARY_ID,
as_of_year, respondent_id, agency_code, loan_type, property_type, loan_purpose, owner_occupancy, loan_amount_000s, preapproval, action_taken, location_id, applicant_ethnicity, co_applicant_ethnicity, applicant_sex, co_applicant_sex, applicant_income_000s, purchaser_type, rate_spread, hoepa_status, lien_status, edit_status, sequence_number, application_date_indicator)
select
    p.id,
    CASE WHEN p.as_of_year = '' THEN NULL ELSE CAST(p.as_of_year AS SMALLINT) END,
    CAST(p.respondent_id as VARCHAR(10)),
    CASE WHEN p.agency_code = '' THEN NULL ELSE CAST(p.agency_code AS SMALLINT) END,
    CASE WHEN p.loan_type = '' THEN NULL ELSE CAST(p.loan_type AS SMALLINT) END,
    CASE WHEN p.property_type = '' THEN NULL ELSE CAST(p.property_type AS SMALLINT) END,
    CASE WHEN p.loan_purpose = '' THEN NULL ELSE CAST(p.loan_purpose AS SMALLINT) END,
    CASE WHEN p.owner_occupancy = '' THEN NULL ELSE CAST(p.owner_occupancy AS SMALLINT) END,
    CASE WHEN p.loan_amount_000s = '' THEN NULL ELSE CAST(p.loan_amount_000s AS INTEGER) END,
    CASE WHEN p.preapproval = '' THEN NULL ELSE CAST(p.preapproval AS SMALLINT) END,
    CASE WHEN p.action_taken = '' THEN NULL ELSE CAST(p.action_taken AS SMALLINT) END,
    l.location_id,
    CASE WHEN p.applicant_ethnicity = '' THEN NULL ELSE CAST(p.applicant_ethnicity AS SMALLINT) END,
    CASE WHEN p.co_applicant_ethnicity = '' THEN NULL ELSE CAST(p.co_applicant_ethnicity AS SMALLINT) END,
    CASE WHEN p.applicant_sex = '' THEN NULL ELSE CAST(p.applicant_sex AS SMALLINT) END,
    CASE WHEN p.co_applicant_sex = '' THEN NULL ELSE CAST(p.co_applicant_sex AS SMALLINT) END,
    CASE WHEN p.applicant_income_000s = '' THEN NULL ELSE CAST(p.applicant_income_000s AS INTEGER) END,
    CASE WHEN p.purchaser_type = '' THEN NULL ELSE CAST(p.purchaser_type AS SMALLINT) END,
    CASE WHEN p.rate_spread = '' THEN NULL ELSE CAST(p.rate_spread AS NUMERIC(5,2)) END,
    CASE WHEN p.hoepa_status = '' THEN NULL ELSE CAST(p.hoepa_status AS SMALLINT) END,
    CASE WHEN p.lien_status = '' THEN NULL ELSE CAST(p.lien_status AS SMALLINT) END,
    CASE WHEN p.edit_status = '' THEN NULL ELSE CAST(p.edit_status AS SMALLINT) END,
    CASE WHEN p.sequence_number = '' THEN NULL ELSE CAST(p.sequence_number AS INTEGER) END,
    CASE WHEN p.application_date_indicator = '' THEN NULL ELSE CAST(p.application_date_indicator AS SMALLINT) END
from preliminary as p
left join location as l
    on ((p.msamd = '' and l.msamd IS NULL) or NULLIF(p.msamd, '')::Integer = l.msamd)
    and ((p.state_code = '' and l.state_code IS NULL) or NULLIF(p.state_code, '')::Integer = l.state_code)
    and ((p.county_code = '' and l.county_code IS NULL) or NULLIF(p.county_code, '')::Integer = l.county_code)
    and ((p.census_tract_number = '' and l.census_tract_number IS NULL) or NULLIF(p.census_tract_number, '')::NUMERIC = l.census_tract_number)
    and ((p.population = '' and l.population IS NULL) or NULLIF(p.population, '')::Integer = l.population)
    and ((p.minority_population = '' and l.minority_population IS NULL) or NULLIF(p.minority_population, '')::NUMERIC = l.minority_population)
    and ((p.hud_median_family_income = '' and l.hud_median_family_income IS NULL) or NULLIF(p.hud_median_family_income, '')::Integer = l.hud_median_family_income)
    and ((p.tract_to_msamd_income = '' and l.tract_to_msamd_income IS NULL) or NULLIF(p.tract_to_msamd_income, '')::NUMERIC = l.tract_to_msamd_income)
    and ((p.number_of_owner_occupied_units = '' and l.number_of_owner_occupied_units IS NULL) or NULLIF(p.number_of_owner_occupied_units, '')::Integer = l.number_of_owner_occupied_units)
    and ((p.number_of_1_to_4_family_units = '' and l.number_of_1_to_4_family_units IS NULL) or NULLIF(p.number_of_1_to_4_family_units, '')::Integer = l.number_of_1_to_4_family_units);

-- Insert into applicant_race table
insert into applicant_race(PRIMARY_ID, race_code, num, co_applicant)
select id,
    CAST(applicant_race_1 AS SMALLINT), 1, 'FALSE'
from preliminary
where applicant_race_1 != '';

insert into applicant_race(PRIMARY_ID, race_code, num, co_applicant)
select id,
    CAST(applicant_race_2 AS SMALLINT), 2, 'FALSE'
from preliminary
where applicant_race_2 != '';

insert into applicant_race(PRIMARY_ID, race_code, num, co_applicant)
select id,
    CAST(applicant_race_3 AS SMALLINT), 3, 'FALSE'
from preliminary
where applicant_race_3 != '';

insert into applicant_race(PRIMARY_ID, race_code, num, co_applicant)
select id,
    CAST(applicant_race_4 AS SMALLINT), 4, 'FALSE'
from preliminary
where applicant_race_4 != '';

insert into applicant_race(PRIMARY_ID, race_code, num, co_applicant)
select id,
    CAST(applicant_race_5 AS SMALLINT), 5, 'FALSE'
from preliminary
where applicant_race_5 != '';

insert into applicant_race(PRIMARY_ID, race_code, num, co_applicant)
select id,
    CAST(co_applicant_race_1 AS SMALLINT), 1, 'TRUE'
from preliminary
where co_applicant_race_1 != '';

insert into applicant_race(PRIMARY_ID, race_code, num, co_applicant)
select id,
    CAST(co_applicant_race_2 AS SMALLINT), 2, 'TRUE'
from preliminary
where co_applicant_race_2 != '';

insert into applicant_race(PRIMARY_ID, race_code, num, co_applicant)
select id,
    CAST(co_applicant_race_3 AS SMALLINT), 3, 'TRUE'
from preliminary
where co_applicant_race_3 != '';

insert into applicant_race(PRIMARY_ID, race_code, num, co_applicant)
select id,
    CAST(co_applicant_race_4 AS SMALLINT), 4, 'TRUE'
from preliminary
where co_applicant_race_4 != '';

insert into applicant_race(PRIMARY_ID, race_code, num, co_applicant)
select id,
    CAST(co_applicant_race_5 AS SMALLINT), 5, 'TRUE'
from preliminary
where co_applicant_race_5 != '';



-- Denial Reasons of Applicants
insert into denial(PRIMARY_ID, denial_reason_code, num)
select id,
    CAST(denial_reason_1 AS SMALLINT), 1
from preliminary
where denial_reason_1 != '';

insert into denial(PRIMARY_ID, denial_reason_code, num)
select id,
    CAST(denial_reason_2 AS SMALLINT), 2
from preliminary
where denial_reason_2 != '';

insert into denial(PRIMARY_ID, denial_reason_code, num)
select id,
    CAST(denial_reason_3 AS SMALLINT), 3
from preliminary
where denial_reason_3 != '';

drop table preliminary cascade;