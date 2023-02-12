-- Database creation.
CREATE DATABASE roommate_db;
GRANT ALL PRIVILEGES ON roommate_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE roommate_db;

-- Table creation.
CREATE TABLE login (
    loginID INT AUTO_INCREMENT NOT NULL,
    username VARCHAR(15) NOT NULL,
    password VARCHAR(60) NOT NULL,
    PRIMARY KEY (loginID)
);

CREATE TABLE user (
    userID INT AUTO_INCREMENT NOT NULL,
    loginID INT NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    gender ENUM('female', 'male', 'other') NOT NULL,
    age TINYINT NOT NULL,
    yearInSchool ENUM('first', 'second', 'third', 'fourth', 'fifth', 'grad') NOT NULL,
    email VARCHAR(320) NOT NULL,
    phoneNumber CHAR(10) NOT NULL,
    creationDate DATE NOT NULL,
    PRIMARY KEY (userID, loginID),
    CONSTRAINT fk_1 FOREIGN KEY (loginID) REFERENCES login (loginID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE preferences (
    prefID INT AUTO_INCREMENT NOT NULL,
    userID INT NOT NULL,
    description VARCHAR NOT NULL,
    maxMonthlyRent CHAR(10) NOT NULL,
    numOfRoommates CHAR(10) NOT NULL,
    prefRoommateGender ENUM('female', 'male', 'no preference'),
    PRIMARY KEY (prefID, userID),
    CONSTRAINT fk_2 FOREIGN KEY (userID) REFERENCES user (userID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE locations (
    location ENUM('Fenway', 'Kenmore', 'Back Bay', 'Mission Hill', 'South End', 'Roxbury', 'Jamaica Plain',
    'Jackson Square', 'Chinatown', 'Seaport', 'Brookline', 'Beacon Hill', 'Cambridge', 'Longwood') NOT NULL,
    prefID INT NOT NULL,
    PRIMARY KEY (location, prefID),
    CONSTRAINT fk_3 FOREIGN KEY (prefID) REFERENCES preferences (prefID) ON UPDATE cascade ON DELETE restrict
);
