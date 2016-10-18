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
insert into company (id, name) values ('7f3010c1-3855-41e0-9e4f-15d7ffc5c119', 'Melaleuca, Inc.');
insert into company (id, name) values ('987b82a2-b542-490c-a757-e9b0fefcf4b9', 'Dynarex Corporation');
insert into company (id, name) values ('9c88dc6f-ca53-4ffc-b244-35c93ccdcccc', 'Nelco Laboratories, Inc.');
insert into company (id, name) values ('1743c57d-7de2-4abd-808e-dee168296abc', 'New Sun Inc.');
insert into company (id, name) values ('b8a76a8b-90d8-4dd8-b765-6994e42c6daa', 'Vi Jon');
insert into company (id, name) values ('3018d203-cac2-4e01-bc61-6f4922cac69b', 'Peace Medical Inc.');
insert into company (id, name) values ('1539c77e-f0aa-40ec-a020-edc8d134ac3e', 'Biogen Idec Inc.');
insert into company (id, name) values ('9d52dfa5-9f18-4340-b968-a8cdea4d9b64', 'Mylan Institutional Inc.');
insert into company (id, name) values ('dcc5dbc9-8cd7-4332-9cff-707f9fbd107e', 'Nelco Laboratories, Inc.');
insert into company (id, name) values ('c0bb7dfc-be6e-44c3-b661-c0d550c387d8', 'Ducere Pharma');
insert into company (id, name) values ('89f98249-3a0f-4646-be44-283b5641a2e5', 'IVAX Pharmaceuticals, Inc.');
insert into company (id, name) values ('f489b4de-08ec-420b-adc9-dcd1cb49e1dc', 'REMEDYREPACK INC.');
insert into company (id, name) values ('ac72dc6f-bee5-40fe-8cd5-e38d46356358', 'Procter & Gamble Manufacturing Company');
insert into company (id, name) values ('eabe87b9-d1a5-4df7-92cc-d3be937123ee', 'Elmore Oil Company Pty Ltd');
insert into company (id, name) values ('4c062c6b-9595-4cb7-bd7b-f3d14f676ab3', 'TOP CARE (Topco Associates LLC)');
insert into company (id, name) values ('6be3ec68-2724-48e0-9f8c-cd07b9e4d0d6', 'Water-Jel Technologies');
insert into company (id, name) values ('b7083978-b8c4-4eb9-bbca-0e924397f484', 'Affordable Pharmaceuticals, LLC');
insert into company (id, name) values ('51ccc8f4-a05f-4bb7-9ea3-5297f792c109', 'Cardinal Health');
insert into company (id, name) values ('584b55fd-541d-4c45-956c-7365dec6cb37', 'Mylan Pharmaceuticals Inc.');
insert into company (id, name) values ('7dff4274-c99b-4316-b80a-4d50919ddeee', 'Triz Laboratories Ltd.');
insert into company (id, name) values ('f1a978f0-a4b6-423c-b1d3-e543a7b28dd6', 'MSD Consumer Care, Inc.');
insert into company (id, name) values ('88bab9b0-58d1-4e26-97fd-8d477926cfa3', 'Clear Healthcare LLC');
insert into company (id, name) values ('d0016cb0-b282-4f1f-8d0d-7e161080a629', 'Dr Reddy''s Laboratories');
insert into company (id, name) values ('e29a416c-2ca5-45da-a79b-cab01d9b9296', 'ALK-Abello, Inc.');
insert into company (id, name) values ('68831943-7e41-435d-bc4b-a030b8c8f6f2', 'Frais Luxury Products');
insert into company (id, name) values ('1ed00cff-fa61-4b9d-b2a9-d56e606be382', 'Pfizer Consumer Healthcare');
insert into company (id, name) values ('f6c9c276-a56e-4519-88f7-d645d668d3ff', 'Premier Dental Products Company');
insert into company (id, name) values ('e3a25153-6277-4784-a044-841369c571df', 'Cherry Hill Sales Co');
insert into company (id, name) values ('24000af1-80a4-41f3-ad3e-b6ab44d2c032', 'Roxane Laboratories, Inc');
insert into company (id, name) values ('733b8c1a-0cff-4b1a-86f6-b3ef4bf36f27', 'Hospira, Inc.');
insert into company (id, name) values ('18a36f19-f8cc-4759-9e07-ddba37fb230e', 'Merck Sharp & Dohme Corp.');
insert into company (id, name) values ('6d820b30-7a0c-4889-b0a6-c66e23cba06f', 'Jubilant HollisterStier LLC');
insert into company (id, name) values ('0245bcad-bda6-4fca-8a6e-71f700b5adee', 'Upsher-Smith Laboratories, Inc.');
insert into company (id, name) values ('bb7c0f4d-a705-4185-a867-898407609b83', 'Beutlich Pharmaceuticals, LLC');
insert into company (id, name) values ('fc428385-eaf9-4903-8238-8031e588b2e3', 'GM Pharmaceuticals, Inc.');
insert into company (id, name) values ('7333074e-9fde-408a-aa58-2cecadfe3b89', 'Homeocare Laboratories');
insert into company (id, name) values ('d717a4a5-9043-4f06-9c2b-a56fddf8e892', 'Pfizer Laboratories Div Pfizer Inc.');
insert into company (id, name) values ('fbb0a9de-be2b-4b4e-aa82-0d3de02c3dd3', 'General Injectables & Vaccines, Inc');
insert into company (id, name) values ('8d75bf6e-3a90-4cdc-9181-0b6ff209fbcc', 'GlaxoSmithKline LLC');
insert into company (id, name) values ('8df0ef63-9218-43d2-9c21-aca1657a510b', 'Nelco Laboratories, Inc.');

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
insert into component (id, name) values ('38be73d8-9f71-49ac-8fec-029ae305bf11', 'Ranitidine');
insert into component (id, name) values ('cddc06dc-7bc4-4cd9-8381-c9bff7fd7beb', 'Verapamil Hydrochloride');
insert into component (id, name) values ('4c119d3e-c7cf-4205-9b41-85e1c1612847', 'Alcohol');
insert into component (id, name) values ('59ab052e-e778-4052-82a0-41dc1d07aa0d', 'Acetaminophen, Caffeine');
insert into component (id, name) values ('e16b6c9d-2dba-4bcd-b6bb-b9c3f510bda5', 'Camphor Menthol Methyl Salicylate');
insert into component (id, name) values ('660a2f34-46b0-4afc-9ff0-12cc4551efca', 'House Fly');
insert into component (id, name) values ('40f2ee5e-1a23-4ff2-991b-885ebfce6356', 'Dextrose, Sodium Chloride, Sodium Acetate Anhydrous, Sodium Gluconate, Potassium Chloride, and Magnesium Chloride');
insert into component (id, name) values ('023fb164-fcc6-4b51-95a4-8f8c34ab95e2', 'diltiazem hydrochloride');
insert into component (id, name) values ('fca5754f-1a6c-4683-99e6-206f1a62e95a', 'ETHYL ALCOHOL');
insert into component (id, name) values ('8bfbce3d-0da3-4f9c-aa3a-a050b1e352d7', 'chlorine');
insert into component (id, name) values ('c4c9121d-5526-4c20-8149-e577352d7bec', 'Antimonium crud , Quercus , Rhododendron, Benzoic ac , Silicea , Nux vom , Ledum , Citricidal Extract');
insert into component (id, name) values ('efc94214-b81b-4390-9fc3-02b02d9cceac', 'Brome Grass');
insert into component (id, name) values ('85b1b42a-3627-4757-adb9-62207a268aae', 'LIDOCAINE HYDROCHLORIDE, GLYCERIN');
insert into component (id, name) values ('76062655-a1f8-41a0-804e-32a5ab2c0870', 'amoxicillin and clavulanate potassium');
insert into component (id, name) values ('a003fae2-c2c9-4729-a45c-d6873a488beb', 'AVOBENZONE HOMOSALATE OCTISALATE OCTOCRYLENE OXYBENZONE');
insert into component (id, name) values ('c206a48a-a2d6-418f-9381-22c84339238d', 'Amitriptyline Hydrochloride');
insert into component (id, name) values ('dcbfeefa-5f68-49d4-8e25-d1602fda5d3e', 'Dimenhydrinate');
insert into component (id, name) values ('9209cbcf-8e4c-411a-abf0-113b05d07430', 'Titanium Dioxide');
insert into component (id, name) values ('99a0216d-ffba-499d-bd14-725992c16ed7', 'diflorasone diacetate');
insert into component (id, name) values ('74d8d98c-8f78-4c54-96ac-ac454746858c', 'Red Delicious Apple');
insert into component (id, name) values ('59378de8-33fd-4dd6-907e-10177b6083c1', 'Acetaminophen, Chlorpheniramine maleate, Dextromethorphan HBr, Phenylephrine HCl');
insert into component (id, name) values ('89d1f494-b610-4673-b64e-7f194578f7ac', 'Organoplex');
insert into component (id, name) values ('fde8a34d-112a-4b79-8082-d5bdb72c7274', 'Allspice');
insert into component (id, name) values ('f789d1a8-13e5-47fa-9259-f43fbcc1c7be', 'Titanium Dioxide');
insert into component (id, name) values ('933699f3-8733-4a53-b1f2-4db705fb867f', 'Loratadine');
insert into component (id, name) values ('c70e42a0-7b47-4e1c-9819-9bd224e1dae2', 'denosumab');
insert into component (id, name) values ('58d800a5-54a6-4789-90ef-a0bb585e8828', 'Arizona Ash');
insert into component (id, name) values ('5099ac23-6c52-4f89-b8b8-4f23d17cee7e', 'Salicylic Acid');
insert into component (id, name) values ('11a6da41-0ea1-49c4-8c57-8487ecf4d996', 'doxycycline');
insert into component (id, name) values ('39bd8be5-368f-4b5e-b9ff-3a20d7579ee8', 'AZITHROMYCIN');
insert into component (id, name) values ('b5152da7-bfd1-4a2c-b877-6324aaa98d9d', 'Isopropyl Alcohol');
insert into component (id, name) values ('b9b18308-289a-4e6c-8cd6-36707e15608a', 'atenolol');
insert into component (id, name) values ('7b9d2e10-7754-4c91-b4e6-c89727cbd73d', 'Apis mel., Arnica, Bellis, Bryonia, Calendula, Chamomilla, Cinchona, Gelsemium, Hamamelis, Hypericum, Lacticum acidum, Ledum, Phosphorus, Rhus toxicodendron, Ruta, Sarcolacticum ac., Staphysag., Symphytum, Echinacea, Hydrastis');
insert into component (id, name) values ('1fc304a5-6506-44f7-abf1-dd8573d8529f', 'Isopropyl Alcohol');
insert into component (id, name) values ('69dba98f-29f4-4fa7-82ce-095547e29ca0', 'CLOTRIMAZOLE');

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
insert into illness (id, name) values ('b691ca6c-b33f-49ea-b3d6-d67a54b898c3', 'Organized');
insert into illness (id, name) values ('2ada6ccf-db5b-4288-9ef1-94037f6148c6', 'coherent');
insert into illness (id, name) values ('fceebc73-5ef9-4512-9fc4-4302cf7e9284', 'Proactive');
insert into illness (id, name) values ('78654266-4ec2-402f-b403-fa1e7a0f59e6', 'application');
insert into illness (id, name) values ('19099d69-bc2d-4a37-a4d6-a1bcadf2a422', 'synergy');
insert into illness (id, name) values ('2b8832d6-6ffd-45fa-a171-4f0bb3084a1c', 'intranet');
insert into illness (id, name) values ('d85dbf7a-4f66-4927-9b5d-149e54e77c13', 'firmware');
insert into illness (id, name) values ('2da9d0fe-debd-4fd6-8323-fd11e521cdf0', 'paradigm');
insert into illness (id, name) values ('a8683df7-1a30-4235-a73d-d7042a970271', 'secondary');
insert into illness (id, name) values ('3de17bb9-888c-4d1d-bb8b-1ff095a40f71', 'even-keeled');
insert into illness (id, name) values ('21fffcaf-4adb-438f-b108-b4d678a864dd', 'asynchronous');
insert into illness (id, name) values ('cb65d1bb-bf1f-4498-b875-bceb78f9b540', 'conglomeration');
insert into illness (id, name) values ('dcd993f2-615c-43d3-9065-adc6e04c6284', 'Total');
insert into illness (id, name) values ('78e00691-2500-4dc1-ab54-91755a7973e7', 'zero administration');
insert into illness (id, name) values ('289456ff-a598-43d0-890e-f01a74c91c9d', 'Integrated');
insert into illness (id, name) values ('c6e726db-5aed-47ad-be66-219eadb3352b', 'Graphical User Interface');
insert into illness (id, name) values ('e3ba5c06-a0cb-49ae-9053-f669ac507592', 'ability');
insert into illness (id, name) values ('8f6f3335-3ed5-4890-8eaa-1affd972ea7d', 'foreground');
insert into illness (id, name) values ('ae2191ae-226c-434a-920b-2122e62e6dc3', 'software');
insert into illness (id, name) values ('31e34ed4-634c-419f-a83e-82b9a1ed416f', 'Managed');
insert into illness (id, name) values ('a22ec9c5-b666-49bc-a5f3-de2f560a5b03', 'Stand-alone');
insert into illness (id, name) values ('42b34f03-53af-4a1c-bf12-1ea99d5e9167', 'logistical');
insert into illness (id, name) values ('c54ca19f-b19f-4445-9d14-96ca68bd025f', 'tangible');
insert into illness (id, name) values ('c2a92097-1eb6-479e-9ae5-c299d1423eae', 'explicit');
insert into illness (id, name) values ('9cccf1e0-0721-42f5-945b-5a1263aa3cb1', 'bifurcated');
insert into illness (id, name) values ('9922db7f-0271-40af-9a6f-7866fc876191', 'hub');
insert into illness (id, name) values ('d390c52b-0f4b-4ab4-87d3-4102374ecf80', 'initiative');
insert into illness (id, name) values ('ae11f4d0-56fb-4ccd-84b9-fea50f489370', 'hardware');
insert into illness (id, name) values ('6c5834cf-1e00-4f97-b922-692cec9dde5a', 'secondary');
insert into illness (id, name) values ('e0d9891c-a77b-468b-80a7-5286fb0676dd', 'forecast');
insert into illness (id, name) values ('4572c7ff-1425-4421-88da-01293a4beb09', 'Persistent');
insert into illness (id, name) values ('bb670b96-6475-4738-b5df-43b8f51f1c21', 'Intuitive');
insert into illness (id, name) values ('6724b049-3dd6-4322-829b-ff621bc57005', 'intangible');

INSERT into MEDICINE (id,name,company_id, description) values ('63832943-7e41-435d-bc4b-a030b8c8f6f2', 'Milistan', 'bb7c0f4d-a705-4185-a867-898407609b83', 'Test description');