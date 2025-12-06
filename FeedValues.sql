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
