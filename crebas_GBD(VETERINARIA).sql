/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     9/12/2020 8:33:51                            */
/*==============================================================*/


drop index CLIENTE_PK;

drop table CLIENTE;

drop index CLIENTE_PRODUCTO_FK;

drop index CLIENTE_PRODUCTO2_FK;

drop index CLIENTE_PRODUCTO_PK;

drop table CLIENTE_PRODUCTO;

drop index CLIENTE_MASCOTA_FK;

drop index MASCOTAS_PK;

drop table MASCOTAS;

drop index PRODUCTOS_PK;

drop table PRODUCTOS;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CI_CLIENTE           INT4                 not null,
   NOMBRES              VARCHAR(30)          not null,
   APELLIDOS            VARCHAR(40)          not null,
   GENERO_MASC          VARCHAR(15)          not null,
   DIRECCION            VARCHAR(70)          not null,
   TELEFONO             INT4                 not null,
   FECHA_REGISTRO       DATE                 not null,
   ANTIGUEDAD           VARCHAR(10)          not null,
   FECHA_ULTI_VISI      DATE                 not null,
   NUM_MASCOTA          INT2                 not null,
   constraint PK_CLIENTE primary key (CI_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CI_CLIENTE
);

/*==============================================================*/
/* Table: CLIENTE_PRODUCTO                                      */
/*==============================================================*/
create table CLIENTE_PRODUCTO (
   ID_PRODUCTOS         INT4                 not null,
   CI_CLIENTE           INT4                 not null,
   constraint PK_CLIENTE_PRODUCTO primary key (ID_PRODUCTOS, CI_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PRODUCTO_PK                                   */
/*==============================================================*/
create unique index CLIENTE_PRODUCTO_PK on CLIENTE_PRODUCTO (
ID_PRODUCTOS,
CI_CLIENTE
);

/*==============================================================*/
/* Index: CLIENTE_PRODUCTO2_FK                                  */
/*==============================================================*/
create  index CLIENTE_PRODUCTO2_FK on CLIENTE_PRODUCTO (
CI_CLIENTE
);

/*==============================================================*/
/* Index: CLIENTE_PRODUCTO_FK                                   */
/*==============================================================*/
create  index CLIENTE_PRODUCTO_FK on CLIENTE_PRODUCTO (
ID_PRODUCTOS
);

/*==============================================================*/
/* Table: MASCOTAS                                              */
/*==============================================================*/
create table MASCOTAS (
   ID_MASCOTAS          INT4                 not null,
   CI_CLIENTE           INT4                 not null,
   NOMBRE               VARCHAR(20)          not null,
   FECHA_NAC            DATE                 not null,
   GENERO_MASC          VARCHAR(15)          not null,
   COLOR                VARCHAR(15)          not null,
   ESTERILIZADO         VARCHAR(10)          not null,
   FECHA_VAC            DATE                 not null,
   DOSIS_VAC            VARCHAR(10)          not null,
   VETERINARIO_VAC      VARCHAR(60)          not null,
   constraint PK_MASCOTAS primary key (ID_MASCOTAS)
);

/*==============================================================*/
/* Index: MASCOTAS_PK                                           */
/*==============================================================*/
create unique index MASCOTAS_PK on MASCOTAS (
ID_MASCOTAS
);

/*==============================================================*/
/* Index: CLIENTE_MASCOTA_FK                                    */
/*==============================================================*/
create  index CLIENTE_MASCOTA_FK on MASCOTAS (
CI_CLIENTE
);

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   ID_PRODUCTOS         INT4                 not null,
   PROVEEDORES          VARCHAR(40)          not null,
   constraint PK_PRODUCTOS primary key (ID_PRODUCTOS)
);

/*==============================================================*/
/* Index: PRODUCTOS_PK                                          */
/*==============================================================*/
create unique index PRODUCTOS_PK on PRODUCTOS (
ID_PRODUCTOS
);

alter table CLIENTE_PRODUCTO
   add constraint FK_CLIENTE__CLIENTE_P_PRODUCTO foreign key (ID_PRODUCTOS)
      references PRODUCTOS (ID_PRODUCTOS)
      on delete restrict on update restrict;

alter table CLIENTE_PRODUCTO
   add constraint FK_CLIENTE__CLIENTE_P_CLIENTE foreign key (CI_CLIENTE)
      references CLIENTE (CI_CLIENTE)
      on delete restrict on update restrict;

alter table MASCOTAS
   add constraint FK_MASCOTAS_CLIENTE_M_CLIENTE foreign key (CI_CLIENTE)
      references CLIENTE (CI_CLIENTE)
      on delete restrict on update restrict;

