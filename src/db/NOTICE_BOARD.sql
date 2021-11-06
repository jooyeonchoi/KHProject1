CREATE TABLE NOTICE_BOARD(
	NOTICE_SEQ NUMBER NOT NULL,
	CATEGORY VARCHAR2(20) NOT NULL,	--NOT NULL삭제
	REG_ID VARCHAR2(50) NOT NULL,
	REG_DT DATE NOT NULL,
	MOD_DT DATE NOT NULL,
	TITLE VARCHAR2(100) NOT NULL,
	CONTENT VARCHAR2(3000) NOT NULL,
	VIEW_CNT NUMBER NOT NULL
);

--NOTICE테이블 제약조건 삭제
--SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='NOTICE_BOARD';
--ALTER TABLE NOTICE_BOARD DROP CONSTRAINT SYS_C007371;
--ALTER TABLE NOTICE_BOARD DROP CONSTRAINT SYS_C007370;



SELECT * FROM NOTICE_BOARD;

COMMIT;

INSERT INTO NOTICE_BOARD(NOTICE_SEQ, CATEGORY, REG_ID, REG_DT, MOD_DT, TITLE, CONTENT, VIEW_CNT)
VALUES(NOTICE_SEQ_TABLE.NEXTVAL, 'ADMIN111', '기타사항', SYSDATE, SYSDATE, '자원봉사 신청 기간 안내',
	'자원봉사 신청 시 반드시 보호소 일정 확인 후 신청부탁드립니다. 해당되지 않는 기한은 신청이 불가할 수 있습니다. 감사합니다.',
	0);

--시퀀스 아이디 발번
CREATE SEQUENCE NOTICE_SEQ_TABLE;

COMMIT;

SELECT * FROM NOTICE_BOARD ORDER BY NOTICE_SEQ DESC;

--SELECT * FROM NOTICE_BOARD WHERE NOTICE_SEQ=?

--현재 게시글 갯수(행) COUNT하기
SELECT COUNT(*) FROM NOTICE_BOARD;

--페이징 적용 쿼리
SELECT T2.*
FROM(
		SELECT ROWNUM AS RN, T1.*
		FROM (
				SELECT  NOTICE_SEQ, CATEGORY, REG_ID, REG_DT, MOD_DT, TITLE, CONTENT, VIEW_CNT
				FROM NOTICE_BOARD
				ORDER BY NOTICE_SEQ DESC) T1
		)T2
WHERE RN BETWEEN 1 AND 10;

SELECT T2.*
FROM(
		SELECT ROWNUM AS RN, T1.*
		FROM (
				SELECT  NOTICE_SEQ, CATEGORY, REG_ID, REG_DT, MOD_DT, TITLE, CONTENT, VIEW_CNT
				FROM NOTICE_BOARD
				ORDER BY NOTICE_SEQ DESC) T1
		)T2
WHERE RN BETWEEN 11 AND 20;


한 페이지 노출갯수 : y = 10
총 게시물의 갯수 : Z = COUNT
현재 페이지 : N = 클릭 파라메터


--WHERE RN BETWEEN 10N-9 AND 10N
--WHERE RN BETWEEN yN-(y-1) AND yN