# 📚 BookSite (JSP/Servlet 도서 웹 애플리케이션)

JSP와 Servlet, JDBC를 활용하여 구현한 **웹 기반 도서 쇼핑몰/관리 시스템**입니다.

---

## 📌 주요 기능 (Key Features)

* **회원 관리**: 회원가입, 로그인/로그아웃, 회원 정보 수정
* **도서 목록 및 검색**: 메인 페이지(`main.jsp`) 도서 리스트 조회, 카테고리 분류, 검색 기능
* **도서 상세 정보 및 장바구니**: 도서 상세 보기, 장바구니 담기 및 수량 변경
* **주문/결제 처리**: 장바구니 상품 주문 및 구매 내역 확인
* **게시판**: 도서 리뷰 및 문의 게시판

---

## 🛠 기술 스택 (Tech Stack)

| 구분 | 기술 |
| :--- | :--- |
| **Language** | Java, JSP, HTML5/CSS3, JavaScript |
| **Server** | Apache Tomcat 9.0+ |
| **Database** | MySQL / Oracle DB (JDBC 연동) |
| **Architecture** | MVC Pattern (JSP - Servlet - DAO/DTO) |
| **IDE** | Eclipse / IntelliJ IDEA |

---

## 📁 프로젝트 구조 (Project Structure)

```text
BookSite/
├── src/main/java/        # Servlet, DAO, DTO, DB 연결 클래스
└── src/main/webapp/      # JSP, HTML, CSS, JS 및 웹 자원
    ├── main/
    │   └── main.jsp      # 메인 메인 페이지
    ├── member/           # 로그인/회원가입 관련 JSP
    ├── book/             # 도서 목록/상세 페이지 JSP
    └── WEB-INF/          # web.xml 및 라이브러리(.jar)
