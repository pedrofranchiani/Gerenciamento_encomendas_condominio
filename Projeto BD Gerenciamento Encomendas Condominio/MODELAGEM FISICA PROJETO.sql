CREATE TABLE ENCOMENDA(
	IDENCOMENDA VARCHAR(20) PRIMARY KEY  UNIQUE,
	STATUS VARCHAR(8) NOT NULL,
	DATARECEBIMENTO DATETIME NOT NULL
);


CREATE TABLE DESTINATARIO(
	IDDESTINATARIO INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
	NOME VARCHAR(30) NOT NULL,
	UNIDADE VARCHAR (4) NOT NULL,
	BLOCO CHAR (1) NOT NULL,
	TELEFONE VARCHAR (11) NOT NULL
);


CREATE TABLE FUNCIONARIO(
	IDFUNCIONARIO INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
	NOME VARCHAR(30) NOT NULL
	);

CREATE TABLE CONFIRMACAO(
	IDCONFIRMACAO INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
	ID_DESTINATARIO INT,
	CODCONFIRMACAO CHAR(4),
	CONSTRAINT FK_DESTINATARIO_CONFIRMACAO FOREIGN KEY (ID_DESTINATARIO)
	REFERENCES DESTINATARIO (IDDESTINATARIO)
);


CREATE TABLE RETIRADA(
	IDRETIRADA INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
	ID_FUNCIONARIO INT,
	ID_DESTINATARIO INT,
	DATARETIRADA DATETIME,
	CONSTRAINT FK_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO)
	REFERENCES FUNCIONARIO (IDFUNCIONARIO),
	CONSTRAINT FK_DESTINATARIO_RETIRADA FOREIGN KEY (ID_DESTINATARIO)
	REFERENCES DESTINATARIO (IDDESTINATARIO)
);

DELIMITER //

CREATE TRIGGER after_insert_destinatario
AFTER INSERT ON DESTINATARIO
FOR EACH ROW
BEGIN
    DECLARE codigo_unico BOOLEAN DEFAULT FALSE;
    DECLARE novo_codigo CHAR(4);

    -- Loop para gerar um código único
    WHILE NOT codigo_unico DO
        -- Gera um novo código aleatório de 4 dígitos
        SET novo_codigo = LPAD(FLOOR(RAND() * 10000), 4, '0');

        -- Verifica se o código já existe na tabela CONFIRMACAO
        IF NOT EXISTS (SELECT 1 FROM CONFIRMACAO WHERE CODCONFIRMACAO = novo_codigo) THEN
            SET codigo_unico = TRUE; -- Se não existir, marca como único
        END IF;
    END WHILE;

    -- Insere o novo registro na tabela CONFIRMACAO com o código único gerado
    INSERT INTO CONFIRMACAO (ID_DESTINATARIO, CODCONFIRMACAO) VALUES (NEW.IDDESTINATARIO, novo_codigo);
END //

DELIMITER ;