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
