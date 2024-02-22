/*Desafio: Execução de Transações, Procedures e Backup/Recovery no MySQL

PARTE 1 – TRANSAÇÕES

Objetivo:
Executar transações no MySQL, desabilitar o autocommit e realizar modificações na base de dados.
*/

-- CODE 1:

sql
Copy code
-- Desabilitando o autocommit
SET autocommit = 0;

-- Início da transação
START TRANSACTION;

-- Suas consultas e modificações de dados aqui
-- Exemplo: UPDATE tabela SET coluna = valor WHERE condição;

-- Se tudo ocorrer conforme esperado, commitar a transação
COMMIT;

-- Caso ocorra algum erro, rollback para desfazer as alterações
ROLLBACK;
PARTE 2 - TRANSAÇÃO COM PROCEDURE

Objetivo:
Criar uma transação dentro de uma procedure com verificação de erro e rollback em caso de problemas.

Exemplo de Transação com Procedure:

DELIMITER //
CREATE PROCEDURE TransacaoComProcedure()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        -- Tratamento de erro (pode ser log, mensagem, etc.)
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro na transação';
    END;

    -- Desabilitando o autocommit
    SET autocommit = 0;

    -- Início da transação
    START TRANSACTION;

    -- Suas consultas e modificações de dados aqui
    -- Exemplo: UPDATE tabela SET coluna = valor WHERE condição;

    -- Se tudo ocorrer conforme esperado, commitar a transação
    COMMIT;
END;
//
DELIMITER ;

-- PARTE 3 – BACKUP E RECOVERY

Objetivo:
Realizar backup e recovery do banco de dados "ecommerce" utilizando o mysqldump.

Backup:

-- Abra o terminal e execute o seguinte comando:

mysqldump -u [seu_usuario] -p [sua_senha] ecommerce > ecommerce_backup.sql
Insira sua senha quando solicitado.
Recovery:

Para restaurar o banco de dados a partir do backup, utilize o seguinte comando:
bash

mysql -u [seu_usuario] -p [sua_senha] ecommerce < ecommerce_backup.sql
Insira sua senha quando solicitado.
Backup de Diferentes Bancos de Dados:

Para realizar o backup de diferentes bancos de dados, substitua "ecommerce" no comando pelo nome do banco desejado.
Inserindo Recursos como Procedures, Eventos, etc.:

Certifique-se de que seus procedures e outros recursos estejam presentes no banco de dados antes de fazer o backup.
Adicionando ao GitHub:

-- Crie um repositório no GitHub.
Adicione o arquivo de backup (ecommerce_backup.sql) e o script com os comandos utilizados.
Faça o commit e o push para o repositório no GitHub.
Passo a Passo:

-- Abra o terminal.
Execute os comandos para backup e recovery conforme descrito.
Verifique se o backup foi criado e o recovery foi bem-sucedido.
Crie um repositório no GitHub.
