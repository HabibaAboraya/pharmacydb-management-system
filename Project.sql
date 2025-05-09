DROP TABLE IF EXISTS pharmacy;
DROP TABLE IF EXISTS patient;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS drug;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS pharmacy_drug;
DROP TABLE IF EXISTS patient_drug;


CREATE TABLE IF NOT EXISTS pharmacy (
                         address VARCHAR(255) NOT NULL,
                         name VARCHAR(255) NOT NULL,
                         phone VARCHAR(15) NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS patient (
                         address VARCHAR(255) NOT NULL,
                         ID INTEGER PRIMARY KEY,
                         name VARCHAR(255),
                         phone VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS supplier (
                          name VARCHAR(255) PRIMARY KEY,
                          address VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS drug (
                          price DECIMAL(10,2) NOT NULL,
                          name VARCHAR(255) NOT NULL PRIMARY KEY,
                          expiry_date DATE NOT NULL,
                          quantity INTEGER NOT NULL,
                          supplier_name VARCHAR(255) NOT NULL,
                          ingredients VARCHAR(255) NOT NULL,
                          purpose VARCHAR(255) NOT NULL,
                          FOREIGN KEY(supplier_name) REFERENCES supplier(name)
);

CREATE TABLE IF NOT EXISTS employee (
                          ID INTEGER PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          address VARCHAR(255) NOT NULL,
                          job_title VARCHAR(255) NOT NULL,
                          pharmacy_phone VARCHAR(15) NOT NULL,
                          FOREIGN KEY (pharmacy_phone) REFERENCES pharmacy (phone)
);

CREATE TABLE pharmacy_drug (
                       pharmacy_phone VARCHAR(15),
                       drug_name VARCHAR(255),
                       FOREIGN KEY(pharmacy_phone) REFERENCES pharmacy (phone),
                       FOREIGN KEY(drug_name) REFERENCES drug(name),
                       PRIMARY KEY (pharmacy_phone, drug_name)
);


CREATE TABLE patient_drug (
                      patient_ID INTEGER,
                      drug_name VARCHAR(255),
                      FOREIGN KEY(patient_ID) REFERENCES patient (ID),
                      FOREIGN KEY(drug_name) REFERENCES drug(name),
                      PRIMARY KEY (patient_ID, drug_name)
);

INSERT INTO pharmacy (address, name, phone) VALUES
('123 Main St, Townsville', 'Good Care Pharmacy', '1234567890'),
('456 Elm St, Villageton', 'Community Pharmacy', '1234567891'),
('789 Pine St, Cityville', 'Family Pharmacy', '1234567892'),
('101 Oak St, Smalltown', 'Fast Relief Pharmacy', '1234567893'),
('102 Maple St, Largetown', 'Trust Pharmacy', '1234567894'),
('103 Birch St, Mytown', 'Careplus Pharmacy', '1234567895'),
('104 Cedar St, Yourtown', 'Healthline Pharmacy', '1234567896'),
('105 Palm St, Ourtown', 'Pillbox Pharmacy', '1234567897'),
('106 Cherry St, Freetown', 'MediServe Pharmacy', '1234567898'),
('107 Olive St, Newtown', 'Elixir Pharmacy', '1234567899');

INSERT INTO patient (address, name, phone) VALUES
('201 Rose St, Westcity', 'John Doe', '9876543210'),
('202 Daisy St, Eastcity', 'Jane Smith', '9876543211'),
('203 Tulip St, Northcity', 'Alice Johnson', '9876543212'),
('204 Lily St, Southcity', 'Bob Brown', '9876543213'),
('205 Orchid St, Centrecity', 'Charlie Davis', '9876543214'),
('206 Iris St, Oldtown', 'Diana Adams', '9876543215'),
('207 Sunflower St, Newtown', 'Evan Green', '9876543216'),
('208 Poppy St, Brighttown', 'Fiona Hill', '9876543217'),
('209 Violet St, Darktown', 'George White', '9876543218'),
('210 Rosemary St, Cooltown', 'Hannah Black', '9876543219');

INSERT INTO supplier (name, address) VALUES
('Global Pharma', '1000 Industry Rd, Bigcity'),
('Health Supplies', '1001 Factory Rd, Largecity'),
('PharmaSource', '1002 Production Rd, Supercity'),
('Medico', '1003 Medicine Rd, Medcity'),
('LifeCare', '1004 Care Rd, Lifecity'),
('CureAll', '1005 Cure Rd, Curetown'),
('Farmacy', '1006 Farm Rd, Farmtown'),
('Wellness Goods', '1007 Good Rd, Wellcity'),
('HealRight', '1008 Right Rd, Righttown'),
('PharmaDirect', '1009 Direct Rd, Directcity');

INSERT INTO drug (name, price, expiry_date, quantity, supplier_name, ingredients, purpose) VALUES
('Aspirin', 4.99, '2023-10-01', 100, 'Global Pharma', 'Acetylsalicylic Acid', 'Pain relief, anti-inflammatory'),
('Paracetamol', 3.49, '2024-01-15', 200, 'Health Supplies', 'Paracetamol', 'Pain relief, fever reducer'),
('Ibuprofen', 5.99, '2023-12-12', 150, 'PharmaSource', 'Ibuprofen', 'Pain relief, anti-inflammatory'),
('Amoxicillin', 12.00, '2024-03-10', 90, 'Medico', 'Amoxicillin', 'Antibiotic'),
('Ciprofloxacin', 8.75, '2023-11-25', 120, 'LifeCare', 'Ciprofloxacin', 'Antibiotic'),
('Lisinopril', 7.45, '2023-09-30', 140, 'CureAll', 'Lisinopril', 'Blood pressure control'),
('Simvastatin', 15.00, '2024-06-15', 110, 'Farmacy', 'Simvastatin', 'Cholesterol control'),
('Amlodipine', 10.50, '2024-07-20', 130, 'Wellness Goods', 'Amlodipine', 'Blood pressure control'),
('Metformin', 9.25, '2024-05-30', 115, 'HealRight', 'Metformin', 'Diabetes management'),
('Atorvastatin', 14.75, '2024-02-28', 105, 'PharmaDirect', 'Atorvastatin', 'Cholesterol control');

INSERT INTO employee (name, address, job_title, pharmacy_phone) VALUES
('Lisa Ray', '110 Wind St, Cyclone', 'Pharmacist', '1234567890'),
('Mark Spike', '111 Storm St, Tornado', 'Technician', '1234567891'),
('Nora Fate', '112 Breeze St, Gale', 'Manager', '1234567892'),
('Oscar Night', '113 Calm St, Quiet', 'Clerk', '1234567893'),
('Paula Right', '114 Peace St, Harmony', 'Pharmacist', '1234567894'),
('Quincy Adams', '115 War St, Battle', 'Technician', '1234567895'),
('Rita Clay', '116 Earth St, World', 'Manager', '1234567896'),
('Sam Twist', '117 Water St, Ocean', 'Clerk', '1234567897'),
('Tina Sand', '118 Sand St, Desert', 'Pharmacist', '1234567898'),
('Uma Gale', '119 Sky St, Cloud', 'Technician', '1234567899');

INSERT INTO pharmacy_drug (pharmacy_phone, drug_name) VALUES
('1234567890', 'Aspirin'),
('1234567890', 'Paracetamol'),
('1234567891', 'Ibuprofen'),
('1234567891', 'Amoxicillin'),
('1234567892', 'Ciprofloxacin'),
('1234567892', 'Lisinopril'),
('1234567893', 'Simvastatin'),
('1234567893', 'Amlodipine'),
('1234567894', 'Metformin'),
('1234567894', 'Atorvastatin'),
('1234567895', 'Aspirin'),
('1234567896', 'Paracetamol'),
('1234567897', 'Ibuprofen'),
('1234567898', 'Amoxicillin'),
('1234567899', 'Ciprofloxacin');

INSERT INTO patient_drug (patient_ID, drug_name) VALUES
(1, 'Aspirin'),
(1, 'Ibuprofen'),
(2, 'Paracetamol'),
(3, 'Amoxicillin'),
(4, 'Ciprofloxacin'),
(5, 'Lisinopril'),
(6, 'Simvastatin'),
(7, 'Amlodipine'),
(8, 'Metformin'),
(9, 'Atorvastatin'),
(10, 'Aspirin'),
(1, 'Metformin'),
(2, 'Amlodipine'),
(3, 'Simvastatin'),
(4, 'Lisinopril');


-- Display data from any two table using the equijoin  based on a related column between them (Select tables that have a one to many relationship)
SELECT * FROM pharmacy JOIN employee ON pharmacy.phone = employee.pharmacy_phone;

-- Display the results of making groups in one table based on one column and apply any group function to these groups
SELECT pharmacy_phone, COUNT(drug_name) AS drug_count FROM pharmacy_drug GROUP BY pharmacy_phone;
SELECT supplier_name, AVG(price) AS avg_price FROM drug GROUP BY supplier_name;
SELECT job_title, COUNT(ID) AS employee_count FROM employee GROUP BY job_title;

