CREATE TABLE users (
  email VARCHAR(255) PRIMARY KEY,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE roles (
  name VARCHAR(255) PRIMARY KEY,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE user_role (
  email VARCHAR(255),
  name VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (email, name),
  CONSTRAINT fk_users
      FOREIGN KEY(email) 
	      REFERENCES users(email),
  CONSTRAINT fk_roles
      FOREIGN KEY(name) 
	      REFERENCES roles(name)
);

INSERT INTO users (email, password)
VALUES ('manuelflorezw@gmail.com', '123456');

INSERT INTO roles (name)
VALUES ('ADMIN');

INSERT INTO user_role (email, name)
VALUES ('manuelflorezw@gmail.com', 'ADMIN');
