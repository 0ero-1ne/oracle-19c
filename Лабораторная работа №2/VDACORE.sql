CREATE TABLE VDA_T
(
	record_id number(3),
	record_name varchar2(50)
);

INSERT INTO VDA_T values(1, 'Dmitry');
INSERT INTO VDA_T values(2, 'Andrey');

SELECT * FROM VDA_T;