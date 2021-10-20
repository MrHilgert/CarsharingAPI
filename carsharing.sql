/*
 Navicat Premium Data Transfer

 Source Server         : LocalPostgreSQL
 Source Server Type    : PostgreSQL
 Source Server Version : 140000
 Source Host           : localhost:5432
 Source Catalog        : carsharing
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140000
 File Encoding         : 65001

 Date: 20/10/2021 03:33:38
*/

CREATE SEQUENCE IF NOT EXISTS car_id START 1 INCREMENT 1;
CREATE SEQUENCE IF NOT EXISTS order_id START 1 INCREMENT 1;

-- ----------------------------
-- Table structure for cars
-- ----------------------------
DROP TABLE IF EXISTS "public"."cars";
CREATE TABLE "public"."cars" (
  "id" int2 NOT NULL DEFAULT nextval('car_id'::regclass),
  "brand" varchar(32) COLLATE "pg_catalog"."default",
  "model" varchar(32) COLLATE "pg_catalog"."default",
  "vrp" varchar(32) COLLATE "pg_catalog"."default",
  "vin" varchar(17) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of cars
-- ----------------------------
INSERT INTO "public"."cars" VALUES (3, 'Nissan', 'Sentra', 'A821AA90', '3N1PB21S0PK000994');
INSERT INTO "public"."cars" VALUES (2, 'Volkswagen', 'Jetta', 'C281AK40', '3VWTJ71K47M116180');
INSERT INTO "public"."cars" VALUES (1, 'BMW', '4 Series', 'C065MK78', 'WBA3T7C5XFP942364');
INSERT INTO "public"."cars" VALUES (4, 'KIA', 'Sportage', 'B192HT90', 'KNDPBCA24C7182937');
INSERT INTO "public"."cars" VALUES (5, 'Audi', 'Q5', 'C248CC40', 'WA1WKAFP8CA101410');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."orders";
CREATE TABLE "public"."orders" (
  "id" int4 NOT NULL DEFAULT nextval('order_id'::regclass),
  "car" int2,
  "rate" int2,
  "date_start" date,
  "date_end" date,
  "cost" numeric(10,2)
)
;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO "public"."orders" VALUES (1, 1, 2, '2021-01-01', '2021-01-22', 5890.50);
INSERT INTO "public"."orders" VALUES (2, 1, 2, '2021-01-26', '2021-02-23', 7854.00);
INSERT INTO "public"."orders" VALUES (3, 1, 3, '2021-02-27', '2021-03-18', 6298.50);
INSERT INTO "public"."orders" VALUES (4, 1, 3, '2021-03-22', '2021-04-05', 4914.00);
INSERT INTO "public"."orders" VALUES (5, 1, 1, '2021-04-09', '2021-04-13', 1026.00);
INSERT INTO "public"."orders" VALUES (6, 1, 2, '2021-04-17', '2021-04-21', 1254.00);
INSERT INTO "public"."orders" VALUES (7, 1, 3, '2021-04-25', '2021-05-08', 4563.00);
INSERT INTO "public"."orders" VALUES (8, 1, 3, '2021-05-12', '2021-06-09', 9282.00);
INSERT INTO "public"."orders" VALUES (9, 1, 2, '2021-06-13', '2021-07-04', 5890.50);
INSERT INTO "public"."orders" VALUES (10, 1, 3, '2021-07-08', '2021-07-22', 4914.00);
INSERT INTO "public"."orders" VALUES (11, 1, 2, '2021-07-26', '2021-08-01', 1782.00);
INSERT INTO "public"."orders" VALUES (12, 1, 1, '2021-08-05', '2021-09-02', 6426.00);
INSERT INTO "public"."orders" VALUES (13, 1, 2, '2021-09-06', '2021-09-12', 1782.00);
INSERT INTO "public"."orders" VALUES (14, 1, 2, '2021-09-16', '2021-09-30', 4158.00);
INSERT INTO "public"."orders" VALUES (15, 1, 3, '2021-10-04', '2021-10-05', 390.00);
INSERT INTO "public"."orders" VALUES (16, 1, 1, '2021-10-09', '2021-11-03', 5737.50);
INSERT INTO "public"."orders" VALUES (17, 1, 1, '2021-11-07', '2021-11-08', 270.00);
INSERT INTO "public"."orders" VALUES (18, 1, 3, '2021-11-12', '2021-11-22', 3510.00);
INSERT INTO "public"."orders" VALUES (19, 1, 2, '2021-11-26', '2021-12-06', 2970.00);
INSERT INTO "public"."orders" VALUES (20, 1, 2, '2021-12-10', '2021-12-29', 5329.50);
INSERT INTO "public"."orders" VALUES (21, 2, 2, '2021-01-01', '2021-01-09', 2376.00);
INSERT INTO "public"."orders" VALUES (22, 2, 1, '2021-01-13', '2021-01-28', 3442.50);
INSERT INTO "public"."orders" VALUES (23, 2, 1, '2021-02-01', '2021-02-24', 5278.50);
INSERT INTO "public"."orders" VALUES (24, 2, 3, '2021-02-28', '2021-03-19', 6298.50);
INSERT INTO "public"."orders" VALUES (25, 2, 1, '2021-03-23', '2021-04-09', 3901.50);
INSERT INTO "public"."orders" VALUES (26, 2, 2, '2021-04-13', '2021-05-12', 8134.50);
INSERT INTO "public"."orders" VALUES (27, 2, 1, '2021-05-16', '2021-05-23', 1701.00);
INSERT INTO "public"."orders" VALUES (28, 2, 2, '2021-05-27', '2021-06-07', 3267.00);
INSERT INTO "public"."orders" VALUES (29, 2, 2, '2021-06-11', '2021-06-21', 2970.00);
INSERT INTO "public"."orders" VALUES (30, 2, 2, '2021-06-25', '2021-07-01', 1782.00);
INSERT INTO "public"."orders" VALUES (31, 2, 2, '2021-07-05', '2021-07-24', 5329.50);
INSERT INTO "public"."orders" VALUES (32, 2, 2, '2021-07-28', '2021-08-07', 2970.00);
INSERT INTO "public"."orders" VALUES (33, 2, 1, '2021-08-11', '2021-09-05', 5737.50);
INSERT INTO "public"."orders" VALUES (34, 2, 1, '2021-09-09', '2021-09-24', 3442.50);
INSERT INTO "public"."orders" VALUES (35, 2, 1, '2021-09-28', '2021-10-03', 1282.50);
INSERT INTO "public"."orders" VALUES (36, 2, 3, '2021-10-07', '2021-11-02', 8619.00);
INSERT INTO "public"."orders" VALUES (37, 2, 3, '2021-11-06', '2021-11-14', 2808.00);
INSERT INTO "public"."orders" VALUES (38, 2, 2, '2021-11-18', '2021-12-08', 5610.00);
INSERT INTO "public"."orders" VALUES (39, 2, 3, '2021-12-12', '2021-12-30', 5967.00);
INSERT INTO "public"."orders" VALUES (40, 2, 3, '2022-01-03', '2022-01-26', 7624.50);
INSERT INTO "public"."orders" VALUES (41, 3, 1, '2021-01-01', '2021-01-19', 4131.00);
INSERT INTO "public"."orders" VALUES (42, 3, 1, '2021-01-23', '2021-02-06', 3402.00);
INSERT INTO "public"."orders" VALUES (43, 3, 2, '2021-02-10', '2021-02-15', 1567.50);
INSERT INTO "public"."orders" VALUES (44, 3, 2, '2021-02-19', '2021-03-16', 7012.50);
INSERT INTO "public"."orders" VALUES (45, 3, 2, '2021-03-20', '2021-03-28', 2376.00);
INSERT INTO "public"."orders" VALUES (46, 3, 1, '2021-04-01', '2021-04-04', 769.50);
INSERT INTO "public"."orders" VALUES (47, 3, 2, '2021-04-08', '2021-04-15', 2079.00);
INSERT INTO "public"."orders" VALUES (48, 3, 1, '2021-04-19', '2021-04-21', 540.00);
INSERT INTO "public"."orders" VALUES (49, 3, 3, '2021-04-25', '2021-05-21', 8619.00);
INSERT INTO "public"."orders" VALUES (50, 3, 1, '2021-05-25', '2021-06-20', 5967.00);
INSERT INTO "public"."orders" VALUES (51, 3, 2, '2021-06-24', '2021-06-27', 940.50);
INSERT INTO "public"."orders" VALUES (52, 3, 2, '2021-07-01', '2021-07-02', 330.00);
INSERT INTO "public"."orders" VALUES (53, 3, 3, '2021-07-06', '2021-07-29', 7624.50);
INSERT INTO "public"."orders" VALUES (54, 3, 3, '2021-08-02', '2021-08-15', 4563.00);
INSERT INTO "public"."orders" VALUES (55, 3, 3, '2021-08-19', '2021-09-05', 5635.50);
INSERT INTO "public"."orders" VALUES (56, 3, 3, '2021-09-09', '2021-09-16', 2457.00);
INSERT INTO "public"."orders" VALUES (57, 3, 2, '2021-09-20', '2021-09-30', 2970.00);
INSERT INTO "public"."orders" VALUES (58, 3, 1, '2021-10-04', '2021-10-16', 2916.00);
INSERT INTO "public"."orders" VALUES (59, 3, 2, '2021-10-20', '2021-11-02', 3861.00);
INSERT INTO "public"."orders" VALUES (60, 3, 3, '2021-11-06', '2021-11-30', 7956.00);
INSERT INTO "public"."orders" VALUES (61, 4, 2, '2021-01-01', '2021-01-26', 7012.50);
INSERT INTO "public"."orders" VALUES (62, 4, 3, '2021-01-30', '2021-02-05', 2106.00);
INSERT INTO "public"."orders" VALUES (63, 4, 1, '2021-02-09', '2021-02-19', 2430.00);
INSERT INTO "public"."orders" VALUES (64, 4, 1, '2021-02-23', '2021-03-22', 6196.50);
INSERT INTO "public"."orders" VALUES (65, 4, 3, '2021-03-26', '2021-04-14', 6298.50);
INSERT INTO "public"."orders" VALUES (66, 4, 3, '2021-04-18', '2021-05-02', 4914.00);
INSERT INTO "public"."orders" VALUES (67, 4, 3, '2021-05-06', '2021-05-27', 6961.50);
INSERT INTO "public"."orders" VALUES (68, 4, 2, '2021-05-31', '2021-06-26', 7293.00);
INSERT INTO "public"."orders" VALUES (69, 4, 3, '2021-06-30', '2021-07-19', 6298.50);
INSERT INTO "public"."orders" VALUES (70, 4, 3, '2021-07-23', '2021-08-05', 4563.00);
INSERT INTO "public"."orders" VALUES (71, 4, 2, '2021-08-09', '2021-09-06', 7854.00);
INSERT INTO "public"."orders" VALUES (72, 4, 2, '2021-09-10', '2021-09-15', 1567.50);
INSERT INTO "public"."orders" VALUES (73, 4, 3, '2021-09-19', '2021-10-07', 5967.00);
INSERT INTO "public"."orders" VALUES (74, 4, 3, '2021-10-11', '2021-10-25', 4914.00);
INSERT INTO "public"."orders" VALUES (75, 4, 2, '2021-10-29', '2021-11-09', 3267.00);
INSERT INTO "public"."orders" VALUES (76, 4, 1, '2021-11-13', '2021-12-06', 5278.50);
INSERT INTO "public"."orders" VALUES (77, 4, 3, '2021-12-10', '2022-01-03', 7956.00);
INSERT INTO "public"."orders" VALUES (78, 4, 2, '2022-01-07', '2022-01-09', 660.00);
INSERT INTO "public"."orders" VALUES (79, 4, 3, '2022-01-13', '2022-01-21', 2808.00);
INSERT INTO "public"."orders" VALUES (80, 4, 1, '2022-01-25', '2022-02-03', 2187.00);
INSERT INTO "public"."orders" VALUES (81, 5, 3, '2021-01-01', '2021-01-02', 390.00);
INSERT INTO "public"."orders" VALUES (82, 5, 1, '2021-01-06', '2021-01-23', 3901.50);
INSERT INTO "public"."orders" VALUES (83, 5, 1, '2021-01-27', '2021-01-29', 540.00);
INSERT INTO "public"."orders" VALUES (84, 5, 1, '2021-02-02', '2021-03-03', 6655.50);
INSERT INTO "public"."orders" VALUES (85, 5, 1, '2021-03-07', '2021-03-12', 1282.50);
INSERT INTO "public"."orders" VALUES (86, 5, 2, '2021-03-16', '2021-03-24', 2376.00);
INSERT INTO "public"."orders" VALUES (87, 5, 3, '2021-03-28', '2021-03-31', 1111.50);
INSERT INTO "public"."orders" VALUES (88, 5, 1, '2021-04-04', '2021-04-21', 3901.50);
INSERT INTO "public"."orders" VALUES (89, 5, 1, '2021-04-25', '2021-05-10', 3442.50);
INSERT INTO "public"."orders" VALUES (90, 5, 2, '2021-05-14', '2021-05-25', 3267.00);
INSERT INTO "public"."orders" VALUES (91, 5, 3, '2021-05-29', '2021-06-18', 6630.00);
INSERT INTO "public"."orders" VALUES (92, 5, 2, '2021-06-22', '2021-07-06', 4158.00);
INSERT INTO "public"."orders" VALUES (93, 5, 1, '2021-07-10', '2021-08-05', 5967.00);
INSERT INTO "public"."orders" VALUES (94, 5, 2, '2021-08-09', '2021-09-03', 7012.50);
INSERT INTO "public"."orders" VALUES (95, 5, 2, '2021-09-07', '2021-09-17', 2970.00);
INSERT INTO "public"."orders" VALUES (96, 5, 2, '2021-09-21', '2021-10-15', 6732.00);
INSERT INTO "public"."orders" VALUES (97, 5, 3, '2021-10-19', '2021-10-21', 780.00);
INSERT INTO "public"."orders" VALUES (98, 5, 2, '2021-10-25', '2021-10-29', 1254.00);
INSERT INTO "public"."orders" VALUES (99, 5, 1, '2021-11-02', '2021-12-01', 6655.50);
INSERT INTO "public"."orders" VALUES (100, 5, 1, '2021-12-05', '2021-12-10', 1282.50);

-- ----------------------------
-- Table structure for rates
-- ----------------------------
DROP TABLE IF EXISTS "public"."rates";
CREATE TABLE "public"."rates" (
  "id" int2 NOT NULL,
  "mileage" int4,
  "price" numeric
)
;

-- ----------------------------
-- Records of rates
-- ----------------------------
INSERT INTO "public"."rates" VALUES (1, 200, 270.00);
INSERT INTO "public"."rates" VALUES (2, 350, 330.00);
INSERT INTO "public"."rates" VALUES (3, 500, 390.00);

-- ----------------------------
-- Primary Key structure for table cars
-- ----------------------------
ALTER TABLE "public"."cars" ADD CONSTRAINT "cars_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rates
-- ----------------------------
ALTER TABLE "public"."rates" ADD CONSTRAINT "rates_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "car_id" FOREIGN KEY ("car") REFERENCES "public"."cars" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."orders" ADD CONSTRAINT "rate" FOREIGN KEY ("rate") REFERENCES "public"."rates" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
