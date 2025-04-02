CREATE TABLE vine
(
  vine_id INT,
  v_date DATE,
  maturity_level VARCHAR,
  PRIMARY KEY (vine_id)
);

CREATE TABLE worker
(
  worker_id INT,
  w_name VARCHAR,
  Year_of_starting_work INT,
  role VARCHAR,
  PRIMARY KEY (worker_id)
);

CREATE TABLE maintenace
(
  task_id INT,
  task_type VARCHAR,
  m_date DATE,
  worker_id INT,
  PRIMARY KEY (task_id),
  FOREIGN KEY (worker_id) REFERENCES worker(worker_id)
);

CREATE TABLE inventory
(
  expiration_date DATE,
  inventory_id INT,
  inventory_quantity INT,
  date_of_receipt DATE,
  PRIMARY KEY (inventory_id)
);

CREATE TABLE grape_variety
(
  g_name VARCHAR,
  color VARCHAR,
  grape_variety_id INT,
  vine_id INT,
  PRIMARY KEY (grape_variety_id),
  FOREIGN KEY (vine_id) REFERENCES vine(vine_id)
);

CREATE TABLE harvest
(
  harvest_id INT,
  harvest_date DATE,
  quantity INT,
  inventory_id INT,
  PRIMARY KEY (harvest_id),
  FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

CREATE TABLE perform
(
  worker_id INT,
  harvest_id INT,
  PRIMARY KEY (worker_id, harvest_id),
  FOREIGN KEY (worker_id) REFERENCES worker(worker_id),
  FOREIGN KEY (harvest_id) REFERENCES harvest(harvest_id)
);

CREATE TABLE vineyard
(
  vineyard_id INT,
  location VARCHAR,
  area_size INT,
  soil_type VARCHAR,
  vine_id INT,
  harvest_id INT,
  PRIMARY KEY (vineyard_id),
  FOREIGN KEY (vine_id) REFERENCES vine(vine_id),
  FOREIGN KEY (harvest_id) REFERENCES harvest(harvest_id)
);

CREATE TABLE Receive
(
  task_id INT,
  vineyard_id INT,
  PRIMARY KEY (task_id, vineyard_id),
  FOREIGN KEY (task_id) REFERENCES maintenace(task_id),
  FOREIGN KEY (vineyard_id) REFERENCES vineyard(vineyard_id)
);