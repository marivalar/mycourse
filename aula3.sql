/* INSERINDO DADOS NA TABELA COMERCIO/CLIENTE  */


    /* INSERINDO NA TABELA CLIENTE */ 
    
        INSERT INTO CLIENTE VALUES (NULL, 'BARBARA', 'F', 'BARBARA@IG.COM', '2367532135');
        INSERT INTO CLIENTE VALUES (NULL, 'JULIA', 'F', 'JULIA@IG.COM', '2343231359');
        INSERT INTO CLIENTE VALUES (NULL, 'MARIANE', 'F', 'MARIANE@IG.COM', '4321421358');
        INSERT INTO CLIENTE VALUES (NULL, 'WESLEY', 'M', NULL, '98654567535');
        INSERT INTO CLIENTE VALUES (NULL, 'KELVIN', 'M', 'KELVIN@IG.COM', '4247532135');
        INSERT INTO CLIENTE VALUES (NULL, 'LUCAS', 'M', 'LUCAS@IG.COM', '3456532135');
        INSERT INTO CLIENTE VALUES (NULL, 'JOAO', 'M', 'LUCAS@IG.COM', '3456532135');

    /* INSERINDO NA TABELA ENDERECO 1-1 */

        INSERT INTO ENDERECO VALUES (NULL,'RUA BANGU', 'BANGU', 'RIO DE JANEIRO', 'RJ', 1);
        INSERT INTO ENDERECO VALUES (NULL,'RUA MERCK', 'MERK', 'RIO DE JANEIRO', 'RJ', 2);
        INSERT INTO ENDERECO VALUES (NULL,'RUA CARAPICUIBA', 'VILA LOURDES', 'CARAPICUIBA', 'SP', 3);
        INSERT INTO ENDERECO VALUES (NULL,'RUA BARUERI', 'BELVAL', 'BARUERI', 'SP', 4);
        INSERT INTO ENDERECO VALUES (NULL,'RUA ALPHAVILLE', 'ALPHAVILLE', 'BARUERI', 'SP', 5);
        INSERT INTO ENDERECO VALUES (NULL,'RUA COELHO NETO', 'COELHO NETO', 'RIO DE JANEIRO', 'RJ', 6);

    /* INSERINDO NA TABELA ENDERECO 1-N */

        INSERT INTO TELEFONE VALUES (NULL, 'CEL' ,'987865248',1);
        INSERT INTO TELEFONE VALUES (NULL,'RES','34532400',2);
        INSERT INTO TELEFONE VALUES (NULL,'RES', '983162465',3);
        INSERT INTO TELEFONE VALUES (NULL,'RES', '965156643',4);
        INSERT INTO TELEFONE VALUES (NULL,NULL, NULL,5);
        INSERT INTO TELEFONE VALUES (NULL,'COM', '2222464',2);
        INSERT INTO TELEFONE VALUES (NULL,'CEL', '987652464',5);
        INSERT INTO TELEFONE VALUES (NULL,'COM', '988762464',5);
        INSERT INTO TELEFONE VALUES (NULL,'CEL', '983322464',4);
        INSERT INTO TELEFONE VALUES (NULL,'RES', '33652554',6);

/* SELECAO, PROJECAO E JUNCAO */

    /* SELECAO -> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA.
    A CLAUSULA DE SELECAO É O WHERE */

        SELECT NOME, SEXO, EMAIL /* PROJECAO */
        FROM CLIENTE /* ORIGEM */
        WHERE SEXO = 'F'; /* SELECAO */

        SELECT NUMERO /* PROJECAO */
        FROM TELEFONE /* ORIGEM */
        WHERE TIPO = 'CEL'; /* SELECAO */

    /* JUNCAO - JOIN */

        SELECT IDCLIENTE, NOME, SEXO, CIDADE, BAIRRO /* PROJECAO */
        FROM CLIENTE; /* ORIGEM */
            INNER JOIN ENDERECO /* JUNCAO */
            ON IDCLIENTE = ID_CLIENTE;


        SELECT IDCLIENTE, NOME, SEXO, CIDADE, BAIRRO /* PROJECAO */
        FROM CLIENTE; /* ORIGEM */
            INNER JOIN ENDERECO /* JUNCAO */
            ON IDCLIENTE = ID_CLIENTE
        WHERE SEXO = 'F'; /* SELECAO */


    /* INNER JOIN COM: 
    
    NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

    SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
    FROM CLIENTE
    INNER JOIN ENDERECO
    ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
    INNER JOIN TELEFONE
    ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

    SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
    FROM CLIENTE C
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE;


/* CATEGORIAS DA LINGUAGEM SQL 

    - DML: DATA MANIPULATION LANGUAGE
    - DDL: DATA DEFINITION LANGUAGE
    - DCL: DATA CONTROL LANGUAGE
    - TCL: TRANSACTION CONTROL LANGUAGE

*/

/* DML - DATA MANIPULATION LANGUAGE */

    /* INSERT */

        INSERT INTO CLIENTE VALUES(7,'PAULA', 'M', 'PAULA@GMAIL.COM', '989889876');
        INSERT ENDERECO VALUES(NULL,'RUA JOAQUIN SILVA', 'ALVORADA', 'NITEROI', 'RJ',7);

    /* FILTRO */

        SELECT * FROM CLIENTE
        WHERE SEXO = 'M';

    /* UPDATE */

        SELECT * FROM CLIENTE
        WHERE IDCLIENTE = 7;

        UPDATE CLIENTE 
        SET SEXO = 'F'
        WHERE IDCLIENTE = 7;

    /* DELETE */ 

        SELECT * FROM CLIENTE
        WHERE IDCLIENTE = 8;

        DELETE FROM CLIENTE 
        WHERE IDCLIENTE = 8;


    /* DDL - DATA DEFINITION LANGUAGE */

        CREATE TABLE PRODUTO(
        IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
        NOME_PRODUTO VARCHAR(30) NOT NULL,
        PRECO INT,
        FRETE FLOAT(10,2) NOT NULL

        );

/* ALTER TABLE */

    /*ALTERANDO O NOME DA UMA COLUNA - CHANGE */

    /* USAR O CHANGE PARA ALTERAR O NOME POIS TERÁ UM HISTÓRICO NO CÓDIGO */

        ALTER TABLE PRODUTO
        CHANGE VALOR_UNITARIO /*PRIMEIRO A COLUNA QUE QUER ALTERAR*/ 
        PRECO_PRODUTO /* DEPOIS O NOVO NOME */ INT NOT NULL;


        ALTER TABLE PRODUTO
        CHANGE PRECO_PRODUTO PRECO INT;

        +--------------+-------------+------+-----+---------+----------------+
        | Field        | Type        | Null | Key | Default | Extra          |
        +--------------+-------------+------+-----+---------+----------------+
        | QUANTIDADE   | float(10,2) | NO   |     | NULL    |                |
        | IDPRODUTO    | int         | NO   | PRI | NULL    | auto_increment |
        | NOME_PRODUTO | varchar(30) | NO   |     | NULL    |                |
        | PRECO        | int         | YES  |     | NULL    |                |
        | FRETE        | float(10,2) | NO   |     | NULL    |                |
        +--------------+-------------+------+-----+---------+----------------+

    /*  MODIFY - ALTERANDO O TIPO */

        /* USAR MODIFY PARA ALTERAR O TIPO DA COLUNA, MAIS PRÁTICO */

        ALTER TABLE PRODUTO
        MODIFY PRECO_PRODUTO VARCHAR(50) NOT NULL;

    /* ADICIONANDO COLUNAS */

        ALTER TABLE PRODUTO
        ADD QUANTIDADE FLOAT(10,2) NOT NULL;

    /* APAGANDO UMA COLUNA */

        ALTER TABLE PRODUTO 
        DROP COLUMN QUANTIDADE;

    /* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */

        ALTER TABLE PRODUTO
        ADD COLUMN QUANTIDADE FLOAT(10,2) NOT NULL;
        AFTER NOME_PRODUTO;

        ALTER TABLE PRODUTO
        ADD COLUMN QUANTIDADE FLOAT(10,2) NOT NULL;
        FIRST;


    /* EXCLUINDO UM DATABASE */

        DROP DATABASE NOME DA DATABASE;