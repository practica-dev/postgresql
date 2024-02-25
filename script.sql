CREATE TABLE users (
  user_email VARCHAR(255) PRIMARY KEY,
  user_password VARCHAR(255) NOT NULL,
  user_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_updated_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE roles (
  role_name VARCHAR(255) PRIMARY KEY,
  role_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  role_updated_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE user_role (
  user_email VARCHAR(255),
  role_name VARCHAR(255),
  user_role_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_role_updated_at TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (user_email, role_name),
  CONSTRAINT fk_users
      FOREIGN KEY(user_email) 
	      REFERENCES users(user_email),
  CONSTRAINT fk_roles
      FOREIGN KEY(role_name) 
	      REFERENCES roles(role_name)
);

INSERT INTO users (user_email, user_password)
VALUES ('manuelflorezw@gmail.com', '123456');

INSERT INTO roles (role_name) VALUES ('ADMIN');

INSERT INTO user_role (user_email, role_name)
VALUES ('manuelflorezw@gmail.com', 'ADMIN');
