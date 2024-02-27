CREATE TABLE IF NOT EXISTS users (
  user_email VARCHAR(255) PRIMARY KEY,
  user_password TEXT NOT NULL,
  user_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_updated_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS roles (
  role_name VARCHAR(255) PRIMARY KEY,
  role_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  role_updated_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS user_role (
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

CREATE TABLE IF NOT EXISTS types_exercise (
  type_exercise_name VARCHAR(255) PRIMARY KEY,
  type_exercise_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  type_exercise_updated_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS exercises (
  exercise_name VARCHAR(255),
  type_exercise_name VARCHAR(255),
  exercise_name_english VARCHAR(255) NOT NULL,
  exercise_description TEXT NOT NULL,
  exercise_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  exercise_updated_at TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (exercise_name, type_exercise_name),
  CONSTRAINT fk_types_exercise
      FOREIGN KEY(type_exercise_name) 
	      REFERENCES types_exercise(type_exercise_name)
);

/* crear extension */

CREATE extension IF NOT EXISTS pgcrypto;

/* agregar datos iniciales */

INSERT INTO users (
  user_email,
  user_password
) 
VALUES (
  'manuelflorezw@gmail.com',
  pgp_sym_encrypt('password123', 'secret')::VARCHAR
);

INSERT INTO roles (role_name) VALUES
('ADMIN'),
('USER'),
('SELLER');

INSERT INTO user_role (
  user_email,
  role_name)
VALUES (
  'manuelflorezw@gmail.com',
  'ADMIN'
),
(
  'manuelflorezw@gmail.com',
  'USER'
);

INSERT INTO types_exercise (type_exercise_name) VALUES
('CARDIO');

INSERT INTO exercises (
  exercise_name,
  type_exercise_name,
  exercise_name_english,
  exercise_description
) VALUES (
  'Correr',
  'CARDIO',
  'run',
  'Ejercicio para bajar grasa.'
);