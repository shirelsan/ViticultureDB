-- טבלת vine
INSERT INTO vine (vine_id, v_date, maturity_level) VALUES (1, '2020-03-01', 'unripe');
INSERT INTO vine (vine_id, v_date, maturity_level) VALUES (2, '2019-05-10', 'ripe');
INSERT INTO vine (vine_id, v_date, maturity_level) VALUES (3, '2018-07-15', 'rotten');

-- טבלת worker
INSERT INTO worker (worker_id, w_name, Year_of_starting_work, role) VALUES (1, 'John Doe', 2015, 'Vineyard Manager');
INSERT INTO worker (worker_id, w_name, Year_of_starting_work, role) VALUES (2, 'Jane Smith', 2018, 'Harvester');
INSERT INTO worker (worker_id, w_name, Year_of_starting_work, role) VALUES (3, 'Michael Johnson', 2020, 'Planter');

-- טבלת maintenace
INSERT INTO maintenace (task_id, task_type, m_date, worker_id) VALUES (1, 'Management', '2025-02-10', 1);
INSERT INTO maintenace (task_id, task_type, m_date, worker_id) VALUES (2, 'Harvesting', '2025-03-15', 2);
INSERT INTO maintenace (task_id, task_type, m_date, worker_id) VALUES (3, 'Planting', '2025-04-05', 3);

-- טבלת inventory
INSERT INTO inventory (expiration_date, inventory_id, inventory_quantity, date_of_receipt) VALUES ('2025-12-31', 1, 100, '2025-01-01');
INSERT INTO inventory (expiration_date, inventory_id, inventory_quantity, date_of_receipt) VALUES ('2025-11-30', 2, 200, '2025-01-10');
INSERT INTO inventory (expiration_date, inventory_id, inventory_quantity, date_of_receipt) VALUES ('2026-01-15', 3, 150, '2025-02-01');

-- טבלת grape_variety
INSERT INTO grape_variety (g_name, color, grape_variety_id, vine_id) VALUES ('Cabernet Sauvignon', 'Red', 1, 1);
INSERT INTO grape_variety (g_name, color, grape_variety_id, vine_id) VALUES ('Chardonnay', 'White', 2, 2);
INSERT INTO grape_variety (g_name, color, grape_variety_id, vine_id) VALUES ('Merlot', 'Red', 3, 3);

-- טבלת harvest
INSERT INTO harvest (harvest_id, harvest_date, quantity, inventory_id) VALUES (1, '2025-01-01', 50, 1);
INSERT INTO harvest (harvest_id, harvest_date, quantity, inventory_id) VALUES (2, '2025-01-10', 60, 2);
INSERT INTO harvest (harvest_id, harvest_date, quantity, inventory_id) VALUES (3, '2025-02-01', 70, 3);

--תאריך קטיף = תאריך קבלת מלאי

-- טבלת perform
INSERT INTO perform (worker_id, harvest_id) VALUES (1, 1);
INSERT INTO perform (worker_id, harvest_id) VALUES (2, 2);
INSERT INTO perform (worker_id, harvest_id) VALUES (3, 3);

-- טבלת vineyard
INSERT INTO vineyard (vineyard_id, location, area_size, soil_type, vine_id, harvest_id) VALUES (1, 'east plot', 100, 'sandy', 1, 1);
INSERT INTO vineyard (vineyard_id, location, area_size, soil_type, vine_id, harvest_id) VALUES (2, 'north  plot', 150, 'gravel', 2, 2);
INSERT INTO vineyard (vineyard_id, location, area_size, soil_type, vine_id, harvest_id) VALUES (3, 'south plot', 200, 'Sandy', 3, 3);

-- טבלת Receive
INSERT INTO Receive (task_id, vineyard_id) VALUES (1, 1);
INSERT INTO Receive (task_id, vineyard_id) VALUES (2, 2);
INSERT INTO Receive (task_id, vineyard_id) VALUES (3, 3);
