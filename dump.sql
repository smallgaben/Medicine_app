DROP TABLE medicine_component;
DROP TABLE medicine_illness;
DROP TABLE medicine;
DROP TABLE company;
DROP TABLE component;
DROP TABLE illness;

CREATE TABLE `company` (
  `id` varchar(100) NOT NULL,
  `name` varchar(300) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `component` (
  `id` varchar(100) NOT NULL,
  `name` varchar(300) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `illness` (
  `id` varchar(100) NOT NULL,
  `name` varchar(300) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `medicine` (
  `id` varchar(100) NOT NULL,
  `name` varchar(300) NOT NULL UNIQUE,
  `company_id` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `medicine_component` (
  `id_medicine` varchar(100) NOT NULL,
  `id_component` varchar(100) NOT NULL,
  CONSTRAINT `fk_component_id` FOREIGN KEY (`id_component`) REFERENCES `component` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicine_id` FOREIGN KEY (`id_medicine`) REFERENCES `medicine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `medicine_illness` (
  `id_medicine` varchar(100) NOT NULL,
  `id_illness` varchar(100) NOT NULL,
  CONSTRAINT `fk_ill_id` FOREIGN KEY (`id_illness`) REFERENCES `illness` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_med_id` FOREIGN KEY (`id_medicine`) REFERENCES `medicine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

insert into company (id, name) values ('8bb94da4-f6cc-4ec8-9150-1a5d86b3a18c', 'Vi-Jon');
insert into company (id, name) values ('ddbc11a4-3508-4356-814e-c801b4d72ee4', 'McKesson');
insert into company (id, name) values ('12915559-d125-467b-8747-f55d7e138680', 'KANEBO COSMETICS INC.');
insert into company (id, name) values ('e749fd4f-ff2a-4291-937d-df2680f5be97', 'Nelco Laboratories, Inc.');
insert into company (id, name) values ('c203e585-9638-4a88-ac9c-756dcee79716', 'Continental Manufacturing Chemist, Inc.');
insert into company (id, name) values ('d6212f1f-4e41-424b-b6a1-cb14688ec3bd', 'Aphena Pharma Solutions - Tennessee, LLC');
insert into company (id, name) values ('d9da99b4-9a8d-49e7-b049-f3ac41237145', 'Church & Dwight Co., Inc.');
insert into company (id, name) values ('27ca634d-3015-463b-aede-aa0d9526f404', 'Lake Erie Medical & Surgical Supply DBA Quality Care Products LLC');
insert into company (id, name) values ('cfda8177-d07c-41ef-87d3-c9eb7b29538f', 'Taizhou Xinzhixuan Daily-Use Co., Ltd.');
insert into company (id, name) values ('2003f4f9-7309-4190-ad38-ebd6f03de962', 'The Mentholatum Company');

insert into component (id, name) values ('9909c902-ab14-400e-aa47-a79da3e91197', 'Salicylic acid');
insert into component (id, name) values ('2e6eced0-3d3d-4f1a-9371-1bd232f27097', 'Hand Sanitizer Gel Antiseptic');
insert into component (id, name) values ('1a97fb03-bb37-4f21-a71d-86b587c0d85b', 'fagus grandifolia pollen');
insert into component (id, name) values ('169629c5-1fdb-417a-ac5c-e82e2911236d', 'Octocrylene and Oxybenzone and Avobenzone');
insert into component (id, name) values ('f9a79b71-66ff-4a09-b88c-f38356b5ccce', 'SAXAGLIPTIN AND METFORMIN HYDROCHLORIDE');
insert into component (id, name) values ('1200d433-42d9-4daa-bf8b-b9ab1f9d5c3a', 'Drosera 30C, Spongia 30C, Kali Carbonicum 30C, Phospherous 30C, Ipeacacuhuana 30C, Pulsatilla 30C, Belladonna 30C');
insert into component (id, name) values ('2b4d4e1c-e539-4d01-b609-11ef9f616250', 'Ergocalciferol');
insert into component (id, name) values ('89f8ee6c-fdec-454b-afb5-62c14895e0b5', 'Ziprasidone HCl');
insert into component (id, name) values ('f7d86d40-92c0-4dbe-bfee-3533c7f866e2', 'Labetalol Hydrochloride');
insert into component (id, name) values ('33c05d3a-2312-4fea-b810-8652c53dd10d', 'Acyclovir');
insert into component (id, name) values ('33fc4eed-d4c2-4e94-8205-b2a7848b3f5f', 'acetaminophen, dextromethorphan HBr, doxylamine succinate, phenylephrine HCl');
insert into component (id, name) values ('b484c1f9-8e3e-4ec1-90dc-22da3fc35ee2', 'METFORMIN HYDROCHLORIDE');
insert into component (id, name) values ('b3f6209a-b543-43c4-b1e7-396169646d1b', 'Camphor, Menthol, Methyl Salicylate');
insert into component (id, name) values ('03fd172b-73c3-4ffd-9cc6-31cc3ef2a3ee', 'Pyrethrum Extract and Piperonyl Butoxide');
insert into component (id, name) values ('03f0fb63-1229-4e02-beb0-b5cfed4c5cda', 'Simvastatin');

insert into illness (id, name) values ('5de0c7b9-7513-4a96-a954-20106066d061', 'static');
insert into illness (id, name) values ('4b9dfd3c-2d2e-46d4-91c2-f71d7d1b21e8', 'middleware');
insert into illness (id, name) values ('3687fcde-b40c-4448-9500-2ca4bedf7090', 'De-engineered');
insert into illness (id, name) values ('89fe5aad-1f81-4d7d-bca8-1c13b2e539d4', 'orchestration');
insert into illness (id, name) values ('72024385-ea7a-4f5f-aff7-075292810b1e', 'projection');
insert into illness (id, name) values ('920a76eb-b6d3-4f01-8623-191d6716f602', 'bottom-line');
insert into illness (id, name) values ('d2ce5378-080e-4f73-885f-587b0defef8b', 'foreground');
insert into illness (id, name) values ('254d25cf-c8b8-45c1-bbd3-945bed991011', 'value-added');
insert into illness (id, name) values ('e528ae4a-fa70-4cfd-bf60-7dcc80f81735', 'Upgradable');
insert into illness (id, name) values ('1832f433-f0ed-45a2-9c49-b4031aeb5ee0', 'local');
insert into illness (id, name) values ('d9013728-f8c7-4fa7-9749-97cc8cc98160', 'human-resource');
insert into illness (id, name) values ('cdf476f7-ec0a-4f9b-8cd2-6ed8c12f7a63', 'Graphic Interface');
insert into illness (id, name) values ('296daa56-83de-4051-9ae7-85424e8473f7', 'Team-oriented');
insert into illness (id, name) values ('c76a6e79-b175-4de6-af93-15e578bc2d53', 'radical');
insert into illness (id, name) values ('3a0b3a80-62a9-4e9c-a5db-2c8bafda17da', 'architecture');
insert into illness (id, name) values ('5fad132c-f481-47ab-964a-da93f2c79dfb', 'Focused');
insert into illness (id, name) values ('4cdbf092-c4bd-4564-9154-a71ebf2ba6da', 'forecast');

insert into "medicine" VALUES ('a440dab8-ba13-4c0b-b6d9-93b39cb487a0', 'fervex', '8bb94da4-f6cc-4ec8-9150-1a5d86b3a18c', 'fervex medicine');
insert into "medicine" VALUES ('1e6f8df4-039b-4197-bb46-69fe430d269d', 'coldrex', '8bb94da4-f6cc-4ec8-9150-1a5d86b3a18c', 'coldrex medicine');
insert into "medicine" VALUES ('4110c460-3beb-4b75-b5b5-9d1927b5d164', 'fermestan', '8bb94da4-f6cc-4ec8-9150-1a5d86b3a18c', 'fermestan medicine');