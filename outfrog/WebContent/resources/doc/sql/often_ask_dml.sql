/* 자주 묻는 질문 등록 */
insert into often_ask values(seq_ask_num.nextval, ?, ?, ?)

/* 자주 묻는 질문 다중 조회 */
select * from often_ask

/* 자주 묻는 질문 내용 수정 */
update often_ask set ask_comment = ? where ask_num = ?

/* 자주 묻는 질문 삭제 */
delete from often_ask where ask_num = ?