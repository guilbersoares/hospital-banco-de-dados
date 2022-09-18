ALTER TABLE medico add em_atividade character;

UPDATE medico set em_atividade = 'S';
UPDATE medico set em_atividade = 'N' where id = 2 or id = 5;


UPDATE internacao set data_alta = data_entrada + interval 3 day where quarto_id = 1;


delete from convenio where id <= 100 ORDER BY tempo_carencia DESC LIMIT 1; 