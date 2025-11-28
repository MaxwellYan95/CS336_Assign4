CREATE OR REPLACE VIEW csv_output AS
SELECT 
    l.as_of_year,
    l.respondent_id,
    a.agency_name,
    a.agency_abbr,
    l.agency_code,
    lt.loan_type_name,
    l.loan_type,
    pt.property_type_name,
    l.property_type,
    lp.loan_purpose_name,
    l.loan_purpose,
    o.owner_occupancy_name,
    l.owner_occupancy,
    l.loan_amount_000s,
    ap.preapproval_name,
    l.preapproval,
    ac.action_taken_name,
    l.action_taken,
    m.msamd_name,
    loc.msamd,
    st.state_name,
    st.state_abbr,
    loc.state_code,
    co.county_name,
    loc.county_code,
    loc.census_tract_number,
    ae.ethnicity_name AS applicant_ethnicity_name, 
    l.applicant_ethnicity,
    cae.ethnicity_name AS co_applicant_ethnicity_name,
    l.co_applicant_ethnicity,
    ar1n.race_name AS applicant_race_name_1,
    ar1.race_code AS applicant_race_1,
    ar2n.race_name AS applicant_race_name_2,
    ar2.race_code AS applicant_race_2,
    ar3n.race_name AS applicant_race_name_3,
    ar3.race_code AS applicant_race_3,
    ar4n.race_name AS applicant_race_name_4,
    ar4.race_code AS applicant_race_4,
    ar5n.race_name AS applicant_race_name_5,
    ar5.race_code AS applicant_race_5,
    car1n.race_name AS co_applicant_race_name_1,
    car1.race_code AS co_applicant_race_1,
    car2n.race_name AS co_applicant_race_name_2,
    car2.race_code AS co_applicant_race_2,
    car3n.race_name AS co_applicant_race_name_3,
    car3.race_code AS co_applicant_race_3,
    car4n.race_name AS co_applicant_race_name_4,
    car4.race_code AS co_applicant_race_4,
    car5n.race_name AS co_applicant_race_name_5,
    car5.race_code AS co_applicant_race_5,
    ase.sex_name AS applicant_sex_name,
    l.applicant_sex,
    cas.sex_name AS co_applicant_sex_name,
    l.co_applicant_sex,
    l.applicant_income_000s,
    pty.purchaser_type_name,
    l.purchaser_type,
    dr1n.denial_reason_name AS denial_reason_name_1,
    dr1.denial_reason_code AS denial_reason_1,
    dr2n.denial_reason_name AS denial_reason_name_2,
    dr2.denial_reason_code AS denial_reason_2,
    dr3n.denial_reason_name AS denial_reason_name_3,
    dr3.denial_reason_code AS denial_reason_3,
    l.rate_spread,
    h.hoepa_status_name,
    l.hoepa_status,
    li.lien_status_name,
    l.lien_status,
    ed.edit_status_name,
    l.edit_status,
    l.sequence_number,
    loc.population,
    loc.minority_population,
    loc.hud_median_family_income,
    loc.tract_to_msamd_income,
    loc.number_of_owner_occupied_units,
    loc.number_of_1_to_4_family_units,
    l.application_date_indicator
FROM loan l
LEFT JOIN agency a ON l.agency_code = a.agency_code
LEFT JOIN loan_type lt ON l.loan_type = lt.loan_type
LEFT JOIN property_type pt ON l.property_type = pt.property_type
LEFT JOIN loan_purpose lp ON l.loan_purpose = lp.loan_purpose
LEFT JOIN occupancy o ON l.owner_occupancy = o.owner_occupancy
LEFT JOIN approval ap ON l.preapproval = ap.preapproval
LEFT JOIN action ac ON l.action_taken = ac.action_taken
LEFT JOIN location loc ON l.location_id = loc.location_id
LEFT JOIN municipal m ON loc.msamd = m.msamd
LEFT JOIN state st ON loc.state_code = st.state_code
LEFT JOIN county co ON loc.state_code = co.state_code AND loc.county_code = co.county_code
LEFT JOIN ethnicity ae ON l.applicant_ethnicity = ae.ethnicity_code
LEFT JOIN ethnicity cae ON l.co_applicant_ethnicity = cae.ethnicity_code
LEFT JOIN applicant_race ar1 ON l.PRIMARY_ID = ar1.PRIMARY_ID AND ar1.num = 1 AND ar1.co_applicant = FALSE
LEFT JOIN race ar1n ON ar1.race_code = ar1n.race_code
LEFT JOIN applicant_race ar2 ON l.PRIMARY_ID = ar2.PRIMARY_ID AND ar2.num = 2 AND ar2.co_applicant = FALSE
LEFT JOIN race ar2n ON ar2.race_code = ar2n.race_code
LEFT JOIN applicant_race ar3 ON l.PRIMARY_ID = ar3.PRIMARY_ID AND ar3.num = 3 AND ar3.co_applicant = FALSE
LEFT JOIN race ar3n ON ar3.race_code = ar3n.race_code
LEFT JOIN applicant_race ar4 ON l.PRIMARY_ID = ar4.PRIMARY_ID AND ar4.num = 4 AND ar4.co_applicant = FALSE
LEFT JOIN race ar4n ON ar4.race_code = ar4n.race_code
LEFT JOIN applicant_race ar5 ON l.PRIMARY_ID = ar5.PRIMARY_ID AND ar5.num = 5 AND ar5.co_applicant = FALSE
LEFT JOIN race ar5n ON ar5.race_code = ar5n.race_code
LEFT JOIN applicant_race car1 ON l.PRIMARY_ID = car1.PRIMARY_ID AND car1.num = 1 AND car1.co_applicant = TRUE
LEFT JOIN race car1n ON car1.race_code = car1n.race_code
LEFT JOIN applicant_race car2 ON l.PRIMARY_ID = car2.PRIMARY_ID AND car2.num = 2 AND car2.co_applicant = TRUE
LEFT JOIN race car2n ON car2.race_code = car2n.race_code
LEFT JOIN applicant_race car3 ON l.PRIMARY_ID = car3.PRIMARY_ID AND car3.num = 3 AND car3.co_applicant = TRUE
LEFT JOIN race car3n ON car3.race_code = car3n.race_code
LEFT JOIN applicant_race car4 ON l.PRIMARY_ID = car4.PRIMARY_ID AND car4.num = 4 AND car4.co_applicant = TRUE
LEFT JOIN race car4n ON car4.race_code = car4n.race_code
LEFT JOIN applicant_race car5 ON l.PRIMARY_ID = car5.PRIMARY_ID AND car5.num = 5 AND car5.co_applicant = TRUE
LEFT JOIN race car5n ON car5.race_code = car5n.race_code
LEFT JOIN sex ase ON l.applicant_sex = ase.sex_code
LEFT JOIN sex cas ON l.co_applicant_sex = cas.sex_code
LEFT JOIN purchaser pty ON l.purchaser_type = pty.purchaser_type
LEFT JOIN denial dr1 ON l.PRIMARY_ID = dr1.PRIMARY_ID AND dr1.num = 1
LEFT JOIN denial_lookup dr1n ON dr1.denial_reason_code = dr1n.denial_reason_code
LEFT JOIN denial dr2 ON l.PRIMARY_ID = dr2.PRIMARY_ID AND dr2.num = 2
LEFT JOIN denial_lookup dr2n ON dr2.denial_reason_code = dr2n.denial_reason_code
LEFT JOIN denial dr3 ON l.PRIMARY_ID = dr3.PRIMARY_ID AND dr3.num = 3
LEFT JOIN denial_lookup dr3n ON dr3.denial_reason_code = dr3n.denial_reason_code
LEFT JOIN hoepa h ON l.hoepa_status = h.hoepa_status
LEFT JOIN lien li ON l.lien_status = li.lien_status
LEFT JOIN edit ed ON l.edit_status = ed.edit_status;

\COPY (SELECT * FROM csv_output) TO 'project2export.csv' WITH CSV HEADER