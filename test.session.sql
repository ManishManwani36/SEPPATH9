-- @block
-- ADD Device Table
CREATE TABLE Devices(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  isActive BOOLEAN NOT NULL DEFAULT TRUE
);

-- @block
-- INSERT Device
INSERT INTO Devices(name) 
VALUES('Device 1'), ('Device 2'), ('Device 3'), ('Device 4'), ('Device 5'), ('Device 6'), ('Device 7'), ('Device 8'), ('Device 9'), ('Device 10');

-- @block
-- SELECT all Devices
SELECT * FROM Devices;

-- @block
-- ADD Connection Table
CREATE TABLE Connections(
  id INT PRIMARY KEY AUTO_INCREMENT,
  inputDeviceID INT NOT NULL,
  FOREIGN KEY (inputDeviceID) REFERENCES Devices(id),
  outputDeviceID INT NOT NULL,
  FOREIGN KEY (outputDeviceID) REFERENCES Devices(id),
  cost INT NOT NULL,
  isActive BOOLEAN NOT NULL DEFAULT TRUE
);

-- @block
-- INSERT Connection
INSERT INTO Connections(inputDeviceID, outputDeviceID, cost)
VALUES (1, 2, 1), (1, 3, 1), (1, 4, 1), (1, 5, 1), (1, 6, 1), (1, 7, 1), (1, 8, 1), (1, 9, 1), (1, 10, 1);

-- @block
-- SELECT all Connections
SELECT * FROM Connections;

-- @block
-- FIND route from Device 1 to Device 10
SELECT * FROM Connections WHERE inputDeviceID = 1 AND outputDeviceID = 10;

-- @block
-- FIND route from Device 5 to Device 4
SELECT * FROM Connections WHERE inputDeviceID = 5 AND outputDeviceID = 4;

-- @block
-- ADD Connection from Device 5 to Device 1
INSERT INTO Connections(inputDeviceID, outputDeviceID, cost)
VALUES (5, 1, 1);

-- @block
-- FIND route from Device 5 to Device 1 and Device 1 to Device 4
SELECT * FROM Connections WHERE inputDeviceID = 5 AND outputDeviceID = 1 OR inputDeviceID = 1 AND outputDeviceID = 4;