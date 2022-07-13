CREATE TABLE afiliados (
    id_afiliados               NUMBER NOT NULL,
    fecha_solicitud            TIMESTAMP NOT NULL,
    fecha_aceptacion_solicitud DATE,
    primer_nombre              VARCHAR2(250) NOT NULL,
    segundo_nombre             VARCHAR2(250),
    primer_apellido            VARCHAR2(250) NOT NULL,
    segundo_apellido           VARCHAR2(250),
    fecha_nacimiento           DATE NOT NULL,
    rut_afiliado               NUMBER(8),
    cv                         CHAR(1),
    pasaporte_afiliado         VARCHAR2(30),
    direccion_afiliado         VARCHAR2(250) NOT NULL,
    email_afiliado             VARCHAR2(250) NOT NULL,
    curriculum_afiliado        CHAR(1) NOT NULL,
    pretension_de_sueldo       NUMBER NOT NULL,
    numero_socio               NUMBER,
    estados_civiles_id         NUMBER NOT NULL,
    nacionalidad_id            NUMBER NOT NULL,
    generos_id                 NUMBER NOT NULL,
    comunas_id                 NUMBER NOT NULL,
    sindicatos_id              NUMBER NOT NULL,
    estados_solicitudes_id     NUMBER NOT NULL
);

ALTER TABLE afiliados ADD CONSTRAINT afiliados_pk PRIMARY KEY ( id_afiliados );

CREATE TABLE afiliados_beneficios (
    afiliados_id  NUMBER NOT NULL,
    beneficios_id NUMBER NOT NULL
);

ALTER TABLE afiliados_beneficios ADD CONSTRAINT relation_13_pk PRIMARY KEY ( afiliados_id,
                                                                             beneficios_id );

CREATE TABLE afiliados_discapacidades (
    afiliados_id      NUMBER NOT NULL,
    discapacidades_id NUMBER NOT NULL
);

ALTER TABLE afiliados_discapacidades ADD CONSTRAINT afiliados_discapacidades_pk PRIMARY KEY ( afiliados_id,
                                                                                              discapacidades_id );

CREATE TABLE beneficios (
    id_beneficios          NUMBER NOT NULL,
    nombre_beneficio       VARCHAR2(250) NOT NULL,
    porcentaje_dscto       NUMBER NOT NULL,
    tienda                 VARCHAR2(250) NOT NULL,
    usos_maximos           NUMBER NOT NULL,
    tipos_de_beneficios_id NUMBER NOT NULL
);

ALTER TABLE beneficios ADD CONSTRAINT beneficios_pk PRIMARY KEY ( id_beneficios );

CREATE TABLE beneficios_vehiculos (
    beneficios_id NUMBER NOT NULL,
    vehiculos_id  NUMBER NOT NULL
);

ALTER TABLE beneficios_vehiculos ADD CONSTRAINT relation_15_pk PRIMARY KEY ( beneficios_id,
                                                                             vehiculos_id );

CREATE TABLE cargas (
    id_cargas           NUMBER NOT NULL,
    rut                 NUMBER(11),
    cv                  CHAR(1),
    primer_nombre       VARCHAR2(250) NOT NULL,
    segundo_nombre      VARCHAR2(250),
    primer_apellido     VARCHAR2(250) NOT NULL,
    segundo_apellido    VARCHAR2(250),
    fecha_de_nacimiento DATE NOT NULL,
    afiliados_id        NUMBER NOT NULL,
    parentescos_id      NUMBER NOT NULL
);

ALTER TABLE cargas ADD CONSTRAINT cargas_pk PRIMARY KEY ( id_cargas );

CREATE TABLE cheques (
    id_cheque        NUMBER NOT NULL,
    numero_de_cheque NUMBER(20) NOT NULL,
    nombre_banco     VARCHAR2(250) NOT NULL,
    tipo_de_pago_id  NUMBER NOT NULL
);

ALTER TABLE cheques ADD CONSTRAINT cheques_pk PRIMARY KEY ( id_cheque );

CREATE TABLE comunas (
    id_comunas    NUMBER NOT NULL,
    nombre_comuna VARCHAR2(250) NOT NULL,
    provincias_id NUMBER NOT NULL
);

ALTER TABLE comunas ADD CONSTRAINT comunas_pk PRIMARY KEY ( id_comunas );

CREATE TABLE discapacidades (
    id_discapacidad           NUMBER NOT NULL,
    nombre_discapacidad       VARCHAR2(250) NOT NULL,
    tipo_de_discapasidades_id NUMBER NOT NULL
);

ALTER TABLE discapacidades ADD CONSTRAINT discapacidades_pk PRIMARY KEY ( id_discapacidad );

CREATE TABLE empresas (
    id_empresas      NUMBER NOT NULL,
    nombnre_empresas VARCHAR2(250) NOT NULL
);

ALTER TABLE empresas ADD CONSTRAINT empresas_pk PRIMARY KEY ( id_empresas );

CREATE TABLE estados_civiles (
    id_estados_civiles  NUMBER NOT NULL,
    nombre_estado_civil VARCHAR2(250) NOT NULL
);

ALTER TABLE estados_civiles ADD CONSTRAINT estados_civiles_pk PRIMARY KEY ( id_estados_civiles );

CREATE TABLE estados_solicitudes (
    id_estados_solicitudes NUMBER NOT NULL,
    estado_solicitud       VARCHAR2(250) NOT NULL
);

ALTER TABLE estados_solicitudes ADD CONSTRAINT estados_solicitudes_pk PRIMARY KEY ( id_estados_solicitudes );

CREATE TABLE generos (
    id_generos     NUMBER NOT NULL,
    tipo_de_genero VARCHAR2(250) NOT NULL
);

ALTER TABLE generos ADD CONSTRAINT generos_pk PRIMARY KEY ( id_generos );

CREATE TABLE nacionalidad (
    id_nacionalidad NUMBER NOT NULL,
    nombre          VARCHAR2(250) NOT NULL
);

ALTER TABLE nacionalidad ADD CONSTRAINT nacionalidad_pk PRIMARY KEY ( id_nacionalidad );

CREATE TABLE pagos (
    id_pagos                 NUMBER NOT NULL,
    pago_inicial             CHAR(1) NOT NULL,
    facha_de_pago            DATE NOT NULL,
    afiliados_id_solicitudes NUMBER NOT NULL,
    pagos_id                 NUMBER NOT NULL
);

ALTER TABLE pagos ADD CONSTRAINT pagos_pk PRIMARY KEY ( pagos_id,
                                                        id_pagos );

CREATE TABLE parentescos (
    id_parentesco   NUMBER NOT NULL,
    tipo_parentesco VARCHAR2(250) NOT NULL
);

ALTER TABLE parentescos ADD CONSTRAINT parentescos_pk PRIMARY KEY ( id_parentesco );

CREATE TABLE provincias (
    id_provincias    NUMBER NOT NULL,
    nombre_provincia VARCHAR2(250) NOT NULL,
    regiones_id      NUMBER NOT NULL
);

ALTER TABLE provincias ADD CONSTRAINT provincias_pk PRIMARY KEY ( id_provincias );

CREATE TABLE regiones (
    id_regiones   NUMBER NOT NULL,
    nombre_region VARCHAR2(250) NOT NULL
);

ALTER TABLE regiones ADD CONSTRAINT regiones_pk PRIMARY KEY ( id_regiones );

CREATE TABLE sindicatos (
    id_sindicatos       NUMBER NOT NULL,
    nombre_de_sindicato VARCHAR2(250) NOT NULL,
    cuota_inicial       NUMBER NOT NULL,
    cuota_mensual       NUMBER NOT NULL,
    empresas_id         NUMBER NOT NULL
);

ALTER TABLE sindicatos ADD CONSTRAINT sindicatos_pk PRIMARY KEY ( id_sindicatos );

CREATE TABLE telefonos (
    id_telefonos        NUMBER NOT NULL,
    telefono_1          NUMBER NOT NULL,
    telefono_2          NUMBER,
    telefono_3          NUMBER,
    afiliados_id        NUMBER NOT NULL,
    tipo_de_telefono_id NUMBER NOT NULL
);

ALTER TABLE telefonos ADD CONSTRAINT telefonos_pk PRIMARY KEY ( id_telefonos );

CREATE TABLE tipo_de_discapasidades (
    id_tipo_de_discapasidades NUMBER NOT NULL,
    tipo_discapasidad         VARCHAR2(250) NOT NULL
);

ALTER TABLE tipo_de_discapasidades ADD CONSTRAINT tipo_de_discapasidades_pk PRIMARY KEY ( id_tipo_de_discapasidades );

CREATE TABLE tipo_de_pago (
    id_tipo_de_pago NUMBER NOT NULL,
    tipo_pago       VARCHAR2(250) NOT NULL,
    pagos_pagos_id  NUMBER NOT NULL,
    pagos_id        NUMBER NOT NULL
);

ALTER TABLE tipo_de_pago ADD CONSTRAINT tipo_de_pago_pk PRIMARY KEY ( id_tipo_de_pago );

CREATE TABLE tipo_de_telefono (
    id_telefono NUMBER NOT NULL,
    tipo        VARCHAR2(250) NOT NULL
);

ALTER TABLE tipo_de_telefono ADD CONSTRAINT tipo_de_telefono_pk PRIMARY KEY ( id_telefono );

CREATE TABLE tipos_de_beneficios (
    id_tipo_beneficios NUMBER NOT NULL,
    tipo_de_beneficio  VARCHAR2(250) NOT NULL
);

ALTER TABLE tipos_de_beneficios ADD CONSTRAINT tipos_de_beneficios_pk PRIMARY KEY ( id_tipo_beneficios );

CREATE TABLE tipos_de_vehiculos (
    id_tipo_de_vehiculos NUMBER NOT NULL,
    tipo_de_vehiculo     VARCHAR2(250) NOT NULL
);

ALTER TABLE tipos_de_vehiculos ADD CONSTRAINT tipos_de_vehiculos_pk PRIMARY KEY ( id_tipo_de_vehiculos );

CREATE TABLE vehiculos (
    id_vehiculos          NUMBER NOT NULL,
    patente               VARCHAR2(6) NOT NULL,
    cv_patente            NUMBER(1) NOT NULL,
    numero_chasis         NUMBER NOT NULL,
    numero_motor          NUMBER NOT NULL,
    color_vehiculo        VARCHAR2(250) NOT NULL,
    valor_prima           NUMBER NOT NULL,
    marca_vehiculo        VARCHAR2(250) NOT NULL,
    modelo_vehiculo       VARCHAR2(250) NOT NULL,
    tipos_de_vehiculos_id NUMBER NOT NULL
);

ALTER TABLE vehiculos ADD CONSTRAINT vehiculos_pk PRIMARY KEY ( id_vehiculos );

ALTER TABLE afiliados
    ADD CONSTRAINT afiliados_comunas_fk FOREIGN KEY ( comunas_id )
        REFERENCES comunas ( id_comunas );

 
ALTER TABLE afiliados_discapacidades
    ADD CONSTRAINT afiliados_discapacidades_afiliados_fk FOREIGN KEY ( afiliados_id )
        REFERENCES afiliados ( id_afiliados );

 
ALTER TABLE afiliados_discapacidades
    ADD CONSTRAINT afiliados_discapacidades_discapacidades_fk FOREIGN KEY ( discapacidades_id )
        REFERENCES discapacidades ( id_discapacidad );

ALTER TABLE afiliados
    ADD CONSTRAINT afiliados_estados_civiles_fk FOREIGN KEY ( estados_civiles_id )
        REFERENCES estados_civiles ( id_estados_civiles );

 
ALTER TABLE afiliados
    ADD CONSTRAINT afiliados_estados_solicitudes_fkv2 FOREIGN KEY ( estados_solicitudes_id )
        REFERENCES estados_solicitudes ( id_estados_solicitudes );

ALTER TABLE afiliados
    ADD CONSTRAINT afiliados_generos_fk FOREIGN KEY ( generos_id )
        REFERENCES generos ( id_generos );

ALTER TABLE afiliados
    ADD CONSTRAINT afiliados_nacionalidad_fk FOREIGN KEY ( nacionalidad_id )
        REFERENCES nacionalidad ( id_nacionalidad );

ALTER TABLE afiliados
    ADD CONSTRAINT afiliados_sindicatos_fk FOREIGN KEY ( sindicatos_id )
        REFERENCES sindicatos ( id_sindicatos );

 
ALTER TABLE beneficios
    ADD CONSTRAINT beneficios_tipos_de_beneficios_fk FOREIGN KEY ( tipos_de_beneficios_id )
        REFERENCES tipos_de_beneficios ( id_tipo_beneficios );

ALTER TABLE cargas
    ADD CONSTRAINT cargas_afiliados_fk FOREIGN KEY ( afiliados_id )
        REFERENCES afiliados ( id_afiliados );

ALTER TABLE cargas
    ADD CONSTRAINT cargas_parentescos_fk FOREIGN KEY ( parentescos_id )
        REFERENCES parentescos ( id_parentesco );

ALTER TABLE cheques
    ADD CONSTRAINT cheques_tipo_de_pago_fk FOREIGN KEY ( tipo_de_pago_id )
        REFERENCES tipo_de_pago ( id_tipo_de_pago );

ALTER TABLE comunas
    ADD CONSTRAINT comunas_provincias_fk FOREIGN KEY ( provincias_id )
        REFERENCES provincias ( id_provincias );

 
ALTER TABLE discapacidades
    ADD CONSTRAINT discapacidades_tipo_de_discapasidades_fk FOREIGN KEY ( tipo_de_discapasidades_id )
        REFERENCES tipo_de_discapasidades ( id_tipo_de_discapasidades );

ALTER TABLE pagos
    ADD CONSTRAINT pagos_afiliados_fk FOREIGN KEY ( afiliados_id_solicitudes )
        REFERENCES afiliados ( id_afiliados );

ALTER TABLE provincias
    ADD CONSTRAINT provincias_regiones_fk FOREIGN KEY ( regiones_id )
        REFERENCES regiones ( id_regiones );

ALTER TABLE afiliados_beneficios
    ADD CONSTRAINT relation_13_afiliados_fk FOREIGN KEY ( afiliados_id )
        REFERENCES afiliados ( id_afiliados );

ALTER TABLE afiliados_beneficios
    ADD CONSTRAINT relation_13_beneficios_fk FOREIGN KEY ( beneficios_id )
        REFERENCES beneficios ( id_beneficios );

ALTER TABLE beneficios_vehiculos
    ADD CONSTRAINT relation_15_beneficios_fk FOREIGN KEY ( beneficios_id )
        REFERENCES beneficios ( id_beneficios );

ALTER TABLE beneficios_vehiculos
    ADD CONSTRAINT relation_15_vehiculos_fk FOREIGN KEY ( vehiculos_id )
        REFERENCES vehiculos ( id_vehiculos );

ALTER TABLE sindicatos
    ADD CONSTRAINT sindicatos_empresas_fk FOREIGN KEY ( empresas_id )
        REFERENCES empresas ( id_empresas );

ALTER TABLE telefonos
    ADD CONSTRAINT telefonos_afiliados_fk FOREIGN KEY ( afiliados_id )
        REFERENCES afiliados ( id_afiliados );

ALTER TABLE telefonos
    ADD CONSTRAINT telefonos_tipo_de_telefono_fk FOREIGN KEY ( tipo_de_telefono_id )
        REFERENCES tipo_de_telefono ( id_telefono );

ALTER TABLE tipo_de_pago
    ADD CONSTRAINT tipo_de_pago_pagos_fk FOREIGN KEY ( pagos_pagos_id,
                                                       pagos_id )
        REFERENCES pagos ( pagos_id,
                           id_pagos );

 
ALTER TABLE vehiculos
    ADD CONSTRAINT vehiculos_tipos_de_vehiculos_fk FOREIGN KEY ( tipos_de_vehiculos_id )
        REFERENCES tipos_de_vehiculos ( id_tipo_de_vehiculos );

