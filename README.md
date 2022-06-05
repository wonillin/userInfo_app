# 05. java project - 회원관리 시스템

## 00. 팀원 소개
- 박재운
- 김현진
- 최원일
- 송준

## 01. 기술 스택
- jsp
- tomcat (tomcat v8.5)
- bootstrap
- Java (eclipse)
- Mysql, Mysql(connector-java-8.0.29.jar)
- jdk (jdk-11.0.14.1+1)

## 02. 프로젝트 주제
- JAVA 수업시간에 배운 CRUD(Create(생성), Read(읽기), Update(갱신), Delete(삭제))를 활용한 회원관리 시스템을 만들어 보자

## 03. 기능 명세
- Mysql 데이터 베이스와 이클립스와의 연결
- 로그인/로그아웃 기능 
- 회원가입 기능 
- ID정보 불러오는 기능
- 회원 정보 수정 기능

## 04. 기능명세  

#### 테이블 조회
![user table](https://user-images.githubusercontent.com/99165620/168630707-b7f3010d-7681-467d-9cc3-8fc2e6090c19.png)



#### 첫 화면
![로그인이 필요합니다](https://user-images.githubusercontent.com/99165620/168630718-de4e1533-d36a-447b-bb97-d2a6bef803c0.png)



#### 회원가입
![회원가입](https://user-images.githubusercontent.com/99165620/168630732-bc8cf359-30d4-45f0-bb35-d8c682415b7c.png)



#### 로그인 후 화면
![로그인후](https://user-images.githubusercontent.com/99165620/168630719-190fccdb-2524-4ab7-94be-5a34e3eebd88.png)



#### 회원가입 후 mysql 
![정보수정전 user](https://user-images.githubusercontent.com/99165620/168630730-7fc54bc8-c838-4099-a9b5-1e65c69453c3.png)



#### 회원정보 수정
![정보 수정](https://user-images.githubusercontent.com/99165620/168630722-652150a1-ee1e-4b11-962a-083862fbd1a0.png)



#### 회원정보 수정 후 mysql
![정보수정 후 user](https://user-images.githubusercontent.com/99165620/168630729-03e16da5-675f-4cab-bbe3-223263fff1b8.png)



#### 로그아웃
![로그아웃](https://user-images.githubusercontent.com/99165620/168632870-65a967ad-3102-4782-91b6-7dd682725b27.png)



### 탈퇴하기 전 database
![탈퇴 user](https://user-images.githubusercontent.com/99165620/168700919-66f5ddfb-4e23-47ab-88b6-00a4864d2eb2.png)



#### 탈퇴하기
![탈퇴확인창](https://user-images.githubusercontent.com/99165620/168700924-2a925694-18bf-40db-b446-c53b2683f121.png)



#### 탈퇴 후 database
![탈퇴후 user](https://user-images.githubusercontent.com/99165620/168700925-c20ee94e-2443-4b92-a7af-2755110073cb.png)


## 05. 트러블 슈팅
- 환경변수 문제
jdk 버전 최신버전은 오류가 많다-> 17 에서 11버전으로 써서 해결

- 회원정보 수정시 id값이 고정이 되지 않고 null로 나오는 문제
현재 로그인 중인 id, session_Id의 값을 넘겨 받아 id에 String타입으로 저장 후 해결

- 회원정보 수정 완료 후 SELECT * FROM user; 시 비밀번호가 null로 뜨는 문제
import java.sql.Statement (editAction.jsp 파일)
private Statement stmt; 없는 코드 추가 (UserDAO.class 파일)
pstmt = conn.prepareStatement();     ====> 	stmt = conn.createStatement();(UserDAO.class 파일)
