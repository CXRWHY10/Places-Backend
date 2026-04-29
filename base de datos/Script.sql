
CREATE TABLE lugares (
                id_lugares INT AUTO_INCREMENT NOT NULL,
                nombre VARCHAR(200) NOT NULL,
                descripcion VARCHAR(500) NOT NULL,
                provincia VARCHAR(100) NOT NULL,
                municipio VARCHAR(100) NOT NULL,
                departamento VARCHAR(100) NOT NULL,
                ubicacion VARCHAR(300) NOT NULL,
                latitud DECIMAL(50) NOT NULL,
                longitud DECIMAL(50) NOT NULL,
                url VARCHAR(300) NOT NULL,
                PRIMARY KEY (id_lugares)
);


CREATE TABLE horarios (
                id_horarios INT AUTO_INCREMENT NOT NULL,
                id_lugares INT NOT NULL,
                dia VARCHAR(50) NOT NULL,
                apertura TIME NOT NULL,
                cierre TIME NOT NULL,
                PRIMARY KEY (id_horarios)
);


CREATE TABLE funcion (
                id_func INT NOT NULL,
                Nombre VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_func)
);


CREATE TABLE roles (
                id_rol INT NOT NULL,
                nombre VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_rol)
);


CREATE TABLE privilegios (
                id_rol INT NOT NULL,
                id_func INT NOT NULL,
                PRIMARY KEY (id_rol, id_func)
);


CREATE TABLE personas (
                id_personas INT AUTO_INCREMENT NOT NULL,
                nombres VARCHAR(100) NOT NULL,
                primer_apellido VARCHAR(50) NOT NULL,
                segundo_apellido VARCHAR(50) NOT NULL,
                ci VARCHAR(50) NOT NULL,
                complemento VARCHAR(2) NOT NULL,
                fecha_nacimiento DATE NOT NULL,
                genero VARCHAR(50) NOT NULL,
                direccion VARCHAR(200) NOT NULL,
                telefono INT NOT NULL,
                celular INT NOT NULL,
                email VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_personas)
);


CREATE TABLE usuarios (
                id_personas INT NOT NULL,
                usuario VARCHAR(50) NOT NULL,
                contrasena VARCHAR(100) NOT NULL,
                rol VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_personas)
);


CREATE UNIQUE INDEX usuarios_idx
 ON usuarios
 ( usuario );

CREATE TABLE favoritos (
                id_personas INT NOT NULL,
                id_lugares INT NOT NULL,
                PRIMARY KEY (id_personas, id_lugares)
);


CREATE TABLE comentarios (
                id_comentarios INT AUTO_INCREMENT NOT NULL,
                comentario VARCHAR(500) NOT NULL,
                calificacion INT NOT NULL,
                fecha_de_comentario DATE NOT NULL,
                id_personas INT NOT NULL,
                id_lugares INT NOT NULL,
                id_recomentarios INT NOT NULL,
                PRIMARY KEY (id_comentarios)
);


CREATE TABLE fotos (
                id_fotos INT AUTO_INCREMENT NOT NULL,
                url VARCHAR(300) NOT NULL,
                descripcion VARCHAR(100) NOT NULL,
                id_lugares INT NOT NULL,
                id_comentarios INT NOT NULL,
                PRIMARY KEY (id_fotos)
);


CREATE TABLE cuentas (
                id_personas INT NOT NULL,
                id_rol INT NOT NULL,
                PRIMARY KEY (id_personas, id_rol)
);


ALTER TABLE horarios ADD CONSTRAINT lugares_horarios_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE fotos ADD CONSTRAINT lugares_fotos_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT lugares_comentarios_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT lugares_favoritos_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT funcion_privilegios_fk
FOREIGN KEY (id_func)
REFERENCES funcion (id_func)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT roles_guantes_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT roles_privilegios_fk
FOREIGN KEY (id_rol)
REFERENCES roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE usuarios ADD CONSTRAINT personas_usuarios_fk
FOREIGN KEY (id_personas)
REFERENCES personas (id_personas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT usuarios_guantes_fk
FOREIGN KEY (id_personas)
REFERENCES usuarios (id_personas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT usuarios_comentarios_fk
FOREIGN KEY (id_personas)
REFERENCES usuarios (id_personas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT usuarios_favoritos_fk
FOREIGN KEY (id_personas)
REFERENCES usuarios (id_personas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE fotos ADD CONSTRAINT comentarios_fotos_fk
FOREIGN KEY (id_comentarios)
REFERENCES comentarios (id_comentarios)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT comentarios_comentarios_fk
FOREIGN KEY (id_recomentarios)
REFERENCES comentarios (id_comentarios)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
