# 📚 BookSite (도서 소개 및 게시판 관리 웹 서비스)

JSP/Servlet과 DAO/DTO 아키텍처 기반으로 구축된 **도서 정보 제공 및 커뮤니티 웹 애플리케이션**입니다.  
회원 관리부터 도서 목록 조회, 자유게시판, Q&A 게시판, 사이트맵까지 통합 관리되는 데이터베이스 연동형 웹 서비스를 제공합니다.

---

## 🛠 기술 스택 (Tech Stack)

| 구분 | 사용 기술 및 환경 |
| :--- | :--- |
| **Backend** | Java, JSP (JavaServer Pages) |
| **Database** | MySQL, JDBC (Java Database Connectivity) |
| **Frontend** | HTML5, CSS3 (`style.css`) |
| **Architecture** | Model 1 (JSP + JavaBean/DTO + DAO) |
| **Tools / Server** | Eclipse IDE, Apache Tomcat |

---

## 📁 프로젝트 디렉토리 구조 (Directory Structure)

```text
BookSite/
├── src/
│   └── main/
│       └── java/
│           └── qna/
│               ├── QnaDAO.java          # Q&A 게시판 DB 연동 (Singleton CRUD)
│               └── QnaDTO.java          # Q&A 게시판 데이터 객체 (Value Object)
└── src/main/webapp/
    ├── css/
    │   └── style.css            # 전체 사이트 공통 스타일시트
    ├── header.jsp               # 상단 공통 로고, 세션 기반 가변 메뉴, 보라색 네비게이션 바
    ├── main/
    │   └── main.jsp             # 메인 랜딩 페이지
    ├── book/
    │   └── booklist.jsp         # 도서 소개 목록 페이지
    ├── freeboard/
    │   └── list.jsp             # 자유게시판 목록 페이지
    ├── qna/
    │   ├── qnaList.jsp          # Q&A 목록 조회 페이지
    │   ├── qnaWrite.jsp         # Q&A 글쓰기 폼
    │   ├── qnaWritePro.jsp      # Q&A 글 등록 처리
    │   └── qnaDetail.jsp        # Q&A 상세보기 및 조회수 증가 처리
    ├── member/
    │   ├── memberForm.jsp       # 회원가입 폼
    │   ├── loginForm.jsp        # 로그인 폼
    │   ├── LogoutPro.jsp        # 로그아웃 처리
    │   └── memberupdateForm.jsp # 회원정보 수정 폼
    └── finalPage/
        └── index.jsp            # 사이트맵 및 프로젝트 요약 가이드
