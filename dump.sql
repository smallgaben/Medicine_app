DROP TABLE company
DROP TABLE component
DROP TABLE medicine
DROP TABLE illness
DROP TABLE medicine_component
DROP TABLE medicine_illness

CREATE TABLE `company` (
  `id` varchar(100) NOT NULL,
  `name` varchar(300) NOT NULL UNIQUE,
  PRIMARY KEY (`id`),
);

CREATE TABLE `component` (
  `id` varchar(100) NOT NULL,
  `name` varchar(300) NOT NULL UNIQUE,
  PRIMARY KEY (`id`),
);

CREATE TABLE `illness` (
  `id` varchar(100) NOT NULL,
  `name` varchar(300) NOT NULL UNIQUE,
  PRIMARY KEY (`id`),
);

CREATE TABLE `medicine` (
  `id` varchar(100) NOT NULL,
  `name` varchar(300) NOT NULL UNIQUE,
  `company_id` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKr6jomc2xl5y3ta24cew0hh592` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `medicine_component` (
  `id_medicine` varchar(100) NOT NULL,
  `id_component` varchar(100) NOT NULL,
  `medicine_id` varchar(255) NOT NULL,
  `component_id` varchar(255) NOT NULL,
  CONSTRAINT `FKgnsbx5g839t2whasw06u0thk2` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`),
  CONSTRAINT `FKoejy4666v37rewdl5eix3blx` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`),
  CONSTRAINT `fk_component_id` FOREIGN KEY (`id_component`) REFERENCES `component` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicine_id` FOREIGN KEY (`id_medicine`) REFERENCES `medicine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `medicine_illness` (
  `id_medicine` varchar(100) NOT NULL,
  `id_illness` varchar(100) NOT NULL,
  `medicine_id` varchar(255) NOT NULL,
  `illness_id` varchar(255) NOT NULL,
  CONSTRAINT `FK20u1tn7vg9vkugj4p2p58shsq` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`),
  CONSTRAINT `FKdt24yj7epjvkile62de2oybwo` FOREIGN KEY (`illness_id`) REFERENCES `illness` (`id`),
  CONSTRAINT `fk_ill_id` FOREIGN KEY (`id_illness`) REFERENCES `illness` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_med_id` FOREIGN KEY (`id_medicine`) REFERENCES `medicine` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);