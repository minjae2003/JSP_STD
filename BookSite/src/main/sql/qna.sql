CREATE TABLE qna (
    num INT AUTO_INCREMENT PRIMARY KEY,
    writer VARCHAR(50) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    readcount INT DEFAULT 0,
    ref INT DEFAULT 0,         -- 질문 그룹 번호 (원글 num)
    re_step INT DEFAULT 0,     -- 답변 출력 순서
    re_level INT DEFAULT 0,    -- 답변 들여쓰기 깊이
    secret CHAR(1) DEFAULT 'N' -- 비밀글 여부 ('Y' / 'N')
);

CREATE TABLE qna_comment (
    c_num INT AUTO_INCREMENT PRIMARY KEY,
    num INT NOT NULL,
    writer VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE qna ADD secret VARCHAR(1) DEFAULT 'N';

SELECT * FROM qna;