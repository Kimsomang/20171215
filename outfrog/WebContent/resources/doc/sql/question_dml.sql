/* 1:1문의 등록 */
insert into question values(seq_question_num.nextval, ?, ?, ?, ?, ?, ?)
--values('1','nick','외않돼죠?','게시판 들어가서 실행이 아무것도 안되네요',sysdate,null,'답변대기');
--values('2','땡중','마하반야반다라밀다심경','헤헤히히힣ㅎ히히히히히힣히히히히히히히히히히히히히히히히히히히히히히히히히히',sysdate,'미친놈은 매가 약입니다.','답변완료');


/* 1:1문의 단일 조회 */
select * from question where question_num = ?

/* 1:1문의 다중 조회 */
select * from question where user_nickname = ?

/* 1:1문의 수정 */
update question set question_title = ?, question_content = ? where question_num = ?

/* 1:1문의 삭제 */
delete from question where question_num = ?

/* 1:1문의 답변대기중인 질문 조회 */
select * from question where comment_state = '답변대기'

/* 관리자가 답변 시 테이블 수정 */
update question set comment_state = '답변완료', question_comment = ? where question_num = ?
update question set question_comment = ? where question_num = ?
