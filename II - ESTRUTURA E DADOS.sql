CREATE DATABASE hospital;
use hospital;


CREATE TABLE paciente (
id int not null auto_increment,
nome varchar(200) not null, 
cpf varchar(12) not null, 
rg varchar(12) not null, 
data_nasc DATE not null,
numero_contato INT not null,
email varchar(30),
primary key(id)
);

CREATE TABLE receita (
id int not null auto_increment,
medicamento varchar(200) not null,
quantidade int not null,
instrucoes longtext not null,
primary key(id)
);

CREATE TABLE especialidade (
id int not null auto_increment, 
nome varchar(200) not null,
grau varchar(200) not null,
primary key(id)
);

CREATE TABLE cidade (
id int not null auto_increment,
nome varchar(200) not null,
uf varchar(2) not null,
primary key(id)
);

CREATE TABLE enfermeiro (
id int not null auto_increment,
nome varchar(200) not null,
cpf varchar(12) not null unique,
cre varchar(12) not null unique,
primary key(id)
);

CREATE TABLE tipo_quarto (
id int not null auto_increment,
descricao longtext not null,
valor_diaria decimal(9,2),
primary key(id)
);

CREATE TABLE medico (
id int not null auto_increment,
nome varchar(200) not null, 
crm varchar(12) not null,
data_nasc date not null,
endereco varchar(200) not null,
num_endereco int not null,
num_contato int not null,
email varchar(30),
cidade_id int,
primary key(id),
foreign key(cidade_id) references cidade(id)
);

CREATE TABLE medico_especialidade (
id int not null auto_increment,
medico_id int,
especialidade_id int,
primary key(id),
foreign key(medico_id) references medico(id),
foreign key(especialidade_id) references especialidade(id)
);

CREATE TABLE consulta (
id int not null auto_increment,
data_cons date not null,
horario time not null,
valor decimal(9,2) not null,
paciente_id int,
medico_id int,
receita_id int,
medico_especialidade_id int,
primary key(id),
foreign key(paciente_id) references paciente(id),
foreign key(medico_id) references medico(id),
foreign key(receita_id) references receita(id),
foreign key(medico_especialidade_id) references medico_especialidade(id)
);

CREATE TABLE convenio (
id int not null auto_increment,
nome_empresa varchar(200) not null,
cnpj varchar(30) not null unique,
tempo_carencia date not null,
primary key(id)
);

CREATE TABLE convenio_consulta (
id int not null auto_increment, 
convenio_id int,
consulta_id int,
primary key(id),
foreign key(convenio_id) references convenio(id) ON DELETE CASCADE,
foreign key(consulta_id) references consulta(id) ON DELETE CASCADE
);

CREATE TABLE quarto (
id int not null auto_increment,
numero_quarto int not null,
tipo varchar(200) not null,
tipo_quarto_id int,
primary key(id),
foreign key(tipo_quarto_id) references tipo_quarto(id)
);

CREATE TABLE internacao (
id int not null auto_increment,
data_entrada date not null,
data_prev_alta date not null,
data_alta date not null,
procedimento longtext not null,
quarto_id int,
paciente_id int,
medico_id int,
primary key(id),
foreign key(quarto_id) references quarto(id),
foreign key(paciente_id) references paciente(id),
foreign key(medico_id) references medico(id)
);

CREATE TABLE enf_inter (
id int not null auto_increment,
enfermeiro_id int,
internacao_id int,
primary key(id),
foreign key(enfermeiro_id) references enfermeiro(id),
foreign key(internacao_id) references internacao(id)
);


INSERT INTO medico (nome, crm, data_nasc, endereco, num_endereco, num_contato, email) 
values ('Anny Quintanilha', '120935', '1970-11-10', 'Rua Flores', '10', '37525488', 'anny@gmail.com'),
('Alisson Sacramento', '178105', '1981-01-15', 'Rua Albieri', '480', '27180264', 'alisson@gmail.com'),
('Livia Veloso', '17897', '1972-03-22', 'Travessa A', '89', '30191483', 'livia@gmail.com'),
('Gael Milheiro Lemes', '9826', '1964-02-13', 'Rua das Rosas', '80', '24337762', 'gael@gmail.com'),
('Gisela Espinosa', '34548', '1980-09-12', 'Avenida Santos', '90', '33684812', 'gisela@gmail.com'),
('Nelson Anjos Palmeira', '344789', '1980-10-14', 'Rua Álamo', '180', '39414795', 'nelson@gmail.com'),
('Ezequiel Pestana Henriques', '9756', '1979-06-30', 'Avenida Chateaubriand', '150', '25376076', 'ezequiel@gmail.com'),
('Tito Carqueijeiro', '14777', '1973-05-19', 'Rua Flores', '670', '32728326', 'tito@gmail.com'),
('Cristovão Xavier', '67432', '1979-12-12', 'Rua da Luz', '80', '24489465', 'cristovao@gmail.com'),
('Júlia Camarinho', '24654', '1980-07-05', 'Rua Albieri', '590', '26154776', 'julia@gmail.com'),
('Suéli Simão Pegado', '15891', '1990-08-27', 'Avenida Japão', '50', '28102734', 'sueli@gmail.com'),
('Fabiano Gomide', '65765', '1989-8-31', 'Avenida das Águas', '600', '32305071', 'fabiano@gmail.com');


INSERT INTO especialidade (nome, grau)
values ('Pediatria', 'Especialista'),
('Pediatria', 'Generalista'),
('Clinica Geral', 'Especialista'),
('Clinica Geral', 'Generalista'),
('Gastroenterologia', 'Especialista'),
('Gastroenterologia', 'Generalista'),
('Dermatologista', 'Especialista'),
('Dermatologista', 'Generalista');

INSERT INTO paciente (nome, cpf, rg, data_nasc, numero_contato, email)
values ('Zilda Gomide Osório', '75183017093', '503536386', '1989-11-22', '98102345', 'zilda@gmail.com'),
('Fabrício Norões Xavier', '35624851073', '160082250', '1968-12-01', '95847365', 'fabricio@gmail.com'),
('Karine Macena Porciúncula', '89870266045', '464976704', '1999-01-22', '93504673', 'karine@gmail.com'),
('Ivo Brandão Palos', '57677855032', '338927827', '1976-10-02', '81356374', 'ivo@gmail.com'),
('Mark Festas Santana', '79129258057', '430609875', '1997-11-14', '81000536', 'mark@gmail.com'),
('Armindo Moreira Azeredo', '55019188034', '430609875', '1950-05-25', '28530436', 'armindo@gmail.com'),
('Helton Espinosa', '61491823046', '226064736', '1997-10-02', '98146430', 'helton@gmail.com'),
('Cármen Mata Camargo', '86212397015', '154900837', '1970-12-07', '91111424', 'carmen@gmail.com'),
('Karine Macena Porciúncula', '95506018037', '493783660', '1992-05-23', '99853725', 'karine@gmail.com'),
('Silvana Fartaria Nazário', '02888672030', '331335852', '2000-06-07', '99999243', 'silvana@gmail.com'),
('Pablo Atilano Flores', '66266513072', '379777113', '1940-11-10', '98374824', 'pablo@gmail.com'),
('Zilda Gomide Osório', '27049754005', '359826842', '1961-08-13', '81374382', 'zilda@gmail.com'),
('Ivo Brandão Palos', '56880006000', '341906980', '1980-11-14', '99013924', 'ivo@gmail.com'),
('Francisca Parracho Caneira', '57280108067', '110878735', '1999-07-15', '31284204', 'francisca@gmail.com'),
('Giovanni Arouca Mata', '06426901032', '304501682', '1984-09-30', '99913824', 'giovanni@gmail.com'),
('Evandro Trindade Bouça', '20803152000', '395928667', '2002-09-9', '31294242', 'evandro@gmail.com');

INSERT INTO receita (medicamento, quantidade, instrucoes)
values ('LuftaGastroPro', '2', 'Tomar 5 a 10 mL após as três principais refeições do dia e antes de dormir.'),
('Ritalina', '2', 'Não interromper o tratamento, mesmo havendo desaparecimento dos sintomas.'),
('Gastrol', '5', 'Ingerido de 30 minutos a 1 hora antes ou após as refeições.'),
('Advantan', '3', 'Aplicar a solução, uma vez ao dia, gotejando nas regiões afetadas e massagear levemente.'),
('Dorflex', '2', '1 a 2 comprimidos, 3 a 4 vezes ao dia, via oral.'),
('Loratadina', '2', 'Ingerir 1 comprimido (10 mg) uma vez por dia'),
('Decongex', '3', '1 comprimido pela manhã e 1 comprimido à noite. Dosagem máxima diária limitada a 2 comprimidos.'),
('Imipramina', '4', 'Iniciar o tratamento com 25 mg, 3 vezes ao dia.'),
('Ibuprofeno', '5', '3 vezes ao dia (a cada 8 horas). Ao esquecer de tomar o remédio, espere até a hora da dose seguinte e reinicie uso do medicamento.'),
('Buscopan', '6', '1 a 2 comprimidos revestidos de 10mg/250mg, 3 a 4 vezes ao dia.')
;


INSERT INTO consulta (data_cons, horario, valor, paciente_id, medico_id)
values ('2019-4-4', '09:20', '180.00', '2', '10'),
('2019-05-24', '11:10', '150.00', '2', '2'),
('2019-07-02', '16:10', '110.00', '9', '11'),
('2019-07-20', '12:10', '180.00', '10', '4'),
('2019-08-05', '16:10', '110.00', '11', '2'),
('2019-10-14', '09:20', '75.00', '4', '7'),
('2019-11-01', '08:10', '150.00', '6', '1'),
('2019-11-27', '13:10', '100.00', '5', '3'),
('2020-03-07', '08:20', '150.00', '6', '8'),
('2020-05-16', '11:20', '150.00', '7', '11'),
('2020-05-18', '09:10', '100.00', '3', '12'),
('2020-07-16', '08:10', '110.00', '8', '9'),
('2020-08-06', '08:20', '180.00', '3', '10'),
('2020-09-07', '15:10', '180.00', '10', '1'),
('2020-09-20', '11:10', '110.00', '11', '6'),
('2020-09-22', '13:20', '110.00', '8', '1'),
('2020-10-18', '10:10', '180.00', '12', '8'),
('2020-10-23', '15:20', '110.00', '14', '12'),
('2020-11-05', '08:10', '100.00', '4', '3'),
('2020-11-15', '12:10', '150.00', '16', '4');


INSERT INTO convenio (nome_empresa, cnpj, tempo_carencia)
values ('Pro Health', '10312519000169', '2027-4-1'),
('MedMais', '42254971000108', '2029-5-10'),
('UniSaude', '60253979000131', '2030-2-23'),
('Cassi', '73847093000168', '2031-10-02');

INSERT INTO convenio_consulta (convenio_id, consulta_id)
values ('1', '6'), ('1', '12'), ('1', '14'), ('1', '19'), ('1', '2'), 
('2', '1'), ('2', '9'), ('2', '16'), ('2', '17'), ('2', '3'), 
('3', '18'), ('3', '15'), ('3', '13'), ('3', '11'), ('3', '10'),
('4', '4'), ('4', '5'), ('4', '7'), ('4', '8'), ('4', '20');

INSERT INTO enfermeiro (nome, cpf, cre)
values ('Marcos Antônio Leal', '70514803088', '276828914'),
('Maria Luiza Andrade', '66124077000', '471661193'),
('Pablo Resende', '73196193004', '251947191'),
('Lúcia Fernandes', '85602227075', '407067966'),
('Cláudia Morello', '34608308084', '445117631'),
('Felipe Soares', '22785473051', '496170910'),
('Carlos Moraes', '67471202050', '326320738'),
('Giovanna Stresser', '41701543044', '192526418'),
('Liandra Maciel', '48981011001', '103579072'),
('Giovane Souza', '28255554017', '287528613')
;

INSERT INTO tipo_quarto (descricao, valor_diaria)
values ('Quarto simples e compartilhado', '50.00'),
('Quarto adaptado para grandes necessidades, com direito a visita', '100.00'),
('Quarto individual com outras mordomias...', '180.00');

INSERT INTO quarto (numero_quarto, tipo, tipo_quarto_id)
values ('101', 'Apartamento', '3'),
('102', 'Quartos Duplos', '2'),
('103', 'Enfermaria', '1')
;

INSERT INTO internacao (data_entrada, data_prev_alta, data_alta, procedimento, quarto_id, paciente_id, medico_id)
values ('2016-08-15', '2016-09-30', '2016-09-28', 'Insira o procedimento médico aqui', '2', '3', '3'),
('2016-05-15', '2016-06-28', '2016-06-29', 'Insira o procedimento médico aqui', '1', '14', '5'),
('2017-02-15', '2017-03-15', '2017-03-17', 'Insira o procedimento médico aqui', '1', '3', '11'),
('2017-06-15', '2017-06-24', '2017-06-24', 'Insira o procedimento médico aqui', '2', '10', '1'),
('2018-04-15', '2018-06-12', '2018-07-20', 'Insira o procedimento médico aqui', '3', '5', '8'),
('2019-03-15', '2019-06-30', '2019-09-01', 'Insira o procedimento médico aqui', '2', '2', '1'),
('2019-11-15', '2019-12-30', '2020-01-01', 'Insira o procedimento médico aqui', '3', '10', '12');


INSERT INTO enf_inter (internacao_id, enfermeiro_id)
values(1,1), (1,2), (2,3), (2,4), (3,5), (3,6), (4,7), (4,8), (5,9), (5,10), (6,1), (6,9), (7,5), (7,3)

