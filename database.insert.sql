-- Insert Statements
INSERT INTO owners (Firstname, Lastname, Email, Phone_Number, is_current_owner) VALUES
('John', 'Doe', 'john.doe@example.com', '+44 7911 123456', TRUE),
('Jane', 'Smith', 'jane.smith@example.com', '+44 7911 234567', TRUE),
('Alice', 'Johnson', 'alice.johnson@example.com', '+44 7911 345678', FALSE),
('Bob', 'Brown', 'bob.brown@example.com', '+44 7911 456789', TRUE),
('Charlie', 'Davis', 'charlie.davis@example.com', '+44 7911 567890', FALSE);


INSERT INTO motorcycles (make, model, `year`, vin, engine_cc, is_owned) VALUES
('Honda', 'CBR600RR', 2022, 'H0NDA12345678901', 600, TRUE),
('Yamaha', 'YZF-R1', 2021, 'YMHY12345678901', 1000, FALSE),
('Kawasaki', 'Ninja ZX-10R', 2023, 'KWK12345678901', 1000, TRUE),
('Suzuki', 'GSX-R750', 2020, 'SZK12345678901', 750, TRUE),
('Ducati', 'Panigale V4', 2024, 'DCI12345678901', 1100, FALSE),
('Yamaha', 'YZF-R6', 2022, 'YMHY98765432101', 600, FALSE),
('Kawasaki', 'Ninja ZX-6R', 2023, 'KWK98765432101', 636, FALSE),
('Ducati', 'Monster 821', 2024, 'DCI98765432101', 821, FALSE),
('Honda', 'CBR500R', 2023, 'H0NDA98765432101', 500, FALSE),
('BMW', 'S1000XR', 2024, 'BMW98765432101', 999, FALSE),
('Triumph', 'Tiger 900', 2023, 'TRI98765432101', 888, FALSE),
('KTM', 'Duke 390', 2023, 'KTM98765432101', 373, FALSE),
('Suzuki', 'GSX-S1000', 2024, 'SZK98765432101', 1000, FALSE),
('Harley Davidson', 'Iron 883', 2022, 'HD98765432101', 883, FALSE),
('Aprilia', 'RSV4 1100', 2024, 'APR98765432101', 1077, FALSE),
('Yamaha', 'MT-07', 2023, 'YMHY12345678902', 689, FALSE),
('Kawasaki', 'Versys 650', 2023, 'KWK12345678902', 649, FALSE),
('Ducati', 'Hypermotard 950', 2024, 'DCI12345678902', 937, FALSE),
('Honda', 'CB500X', 2024, 'H0NDA12345678902', 471, FALSE),
('BMW', 'F900R', 2023, 'BMW12345678902', 895, FALSE),
('Triumph', 'Bonneville T120', 2024, 'TRI12345678902', 1200, FALSE),
('KTM', 'RC 390', 2023, 'KTM12345678903', 373, FALSE),
('Suzuki', 'V-Strom 1050', 2023, 'SZK12345678903', 1037, FALSE),
('Harley Davidson', 'Sportster S', 2022, 'HD12345678902', 1250, FALSE),
('Aprilia', 'Shiver 900', 2023, 'APR12345678903', 896, FALSE),
('Yamaha', 'Tracer 9', 2023, 'YMHY98765432102', 890, FALSE),
('Kawasaki', 'Z900', 2023, 'KWK98765432102', 948, FALSE),
('Ducati', 'Panigale V2', 2023, 'DCI98765432102', 955, FALSE),
('Honda', 'Rebel 1100', 2023, 'H0NDA98765432102', 1084, FALSE),
('BMW', 'R1250GS', 2024, 'BMW98765432102', 1254, FALSE),
('Triumph', 'Street Triple', 2023, 'TRI98765432103', 765, FALSE),
('KTM', '890 Duke', 2023, 'KTM98765432102', 889, FALSE),
('Suzuki', 'GSX-R600', 2024, 'SZK98765432104', 599, FALSE),
('Harley Davidson', 'Fat Bob', 2023, 'HD98765432102', 1140, FALSE),
('Aprilia', 'Tuono V4', 2023, 'APR98765432103', 1077, FALSE),
('Yamaha', 'R3', 2023, 'YMHY12345678903', 321, FALSE),
('Kawasaki', 'Ninja ZX-10R', 2023, 'KWK12345678904', 1000, FALSE),
('Ducati', 'Multistrada V4', 2024, 'DCI12345678903', 1158, FALSE),
('Honda', 'CRF1100L Africa Twin', 2023, 'H0NDA12345678903', 1084, FALSE),
('BMW', 'S1000RR', 2024, 'BMW12345678903', 999, FALSE),
('Triumph', 'Tiger 850', 2023, 'TRI98765432104', 888, FALSE),
('KTM', 'Adventure 890', 2023, 'KTM98765432103', 889, FALSE),
('Suzuki', 'SV650', 2023, 'SZK12345678905', 645, FALSE),
('Harley Davidson', 'Street Glide', 2024, 'HD12345678903', 1140, FALSE),
('Aprilia', 'RS 660', 2023, 'APR98765432104', 659, FALSE),
('Yamaha', 'XSR900', 2024, 'YMHY12345678904', 889, FALSE);

INSERT INTO owners_motorcycles (owner_id, motorcycle_id, ownership_stat) VALUES
(1, 1, 'owner'),
(2, 2, 'interested'),
(3, 3, 'owner'),
(4, 4, 'owner'),
(5, 5, 'interested');

INSERT INTO service_records (motorcycle_id, service_date, description, cost) VALUES
(1, '2024-06-01', 'Oil change and filter replacement', 120.00),
(2, '2024-06-15', 'Brake pad replacement', 150.00),
(3, '2024-07-01', 'Full service including tires', 200.00),
(4, '2024-07-15', 'Chain replacement and alignment', 100.00),
(5, '2024-08-01', 'Clutch adjustment and fluid change', 180.00);

INSERT INTO insurance_records (motorcycle_id, owner_id, insurance_company, policy_number, coverage_amount, start_date, end_date) VALUES
(1, 1, 'InsureIt', 'INS123456', 500.00, '2024-01-01', '2024-12-31'),
(2, 2, 'SecureMoto', 'SEC789012', 800.00, '2024-01-01', '2024-12-31'),
(3, 3, 'MotoCover', 'MOT345678', 800.00, '2024-01-01', '2024-12-31'),
(4, 4, 'RideSafe', 'RID901234', 650.00, '2024-01-01', '2024-12-31'),
(5, 5, 'BikeShield', 'BIK567890', 900.00, '2024-01-01', '2024-12-31');

select * from owners;