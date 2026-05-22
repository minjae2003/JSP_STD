package ch12;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.List;
import java.util.ArrayList;

// Data Access Object = 데이터베이스에 접근하여 SQL을 실행하고 데이터를 CRUD 하는 객체
public class MembersDAO {
    
    // 싱글톤 패턴
    private static MembersDAO instance = new MembersDAO();
    
    public static MembersDAO getInstance() {
        return instance;
    }
    
    private MembersDAO() { }
    
    // DB 연결 메서드
    private Connection getConnection() {
        Connection conn = null;
        
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/basicjsp");
            conn = ds.getConnection();
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("DB 연결에 문제가 생겼습니다.");
            return null;
        }
        
        
    }
    
    // members 테이블의 전체 레코드 조회
    public List<MembersVO> getRecords() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<MembersVO> recordList = null;
        
        try {
            conn = getConnection();
            
            String sql = "select * from members";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                recordList = new ArrayList<MembersVO>();
                
                do {
                    MembersVO record = new MembersVO();
                    record.setId(rs.getString("id"));
                    record.setPasswd(rs.getString("passwd"));
                    record.setName(rs.getString("name"));
                    record.setReg_date(rs.getTimestamp("reg_date"));
                    
                    recordList.add(record);
                } while (rs.next());
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("members 테이블 select에 문제가 생겼습니다.");
            
        } finally {
        	//자원해제
            if (rs != null) try { rs.close(); } catch (SQLException se) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException se) {}
            if (conn != null) try { conn.close(); } catch (SQLException se) {}
        }
        
        return recordList;
    }
    public void insertMember(MembersVO member) {
    	
    	Connection conn = null;
        PreparedStatement pstmt = null;
       
        
        try {
            conn = getConnection();
            
            String sql = "insert into members values (?, ?, ?, now())";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPasswd());
            pstmt.setString(3, member.getName());
            pstmt.executeUpdate();
            
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("members 테이블의 레코드 추가에 문제가 생겼습니다.");
            
        } finally {
            
            if (pstmt != null) try { pstmt.close(); } catch (SQLException se) {}
            if (conn != null) try { conn.close(); } catch (SQLException se) {}
        }}
//        public int userCkeck(String id, string passwd) {
//        	Connection conn = null;
//            PreparedStatement pstmt = null;
//            ResultSet rs = null;
//            List<MembersVO> recordList = null;
//            
//            try {
//                conn = getConnection();
//                
//                String sql = "select id,passwd from members where id=?";
//                pstmt = conn.prepareStatement(sql);
//            	pstmt.setString(1,id);
//                rs = pstmt.executeQuery();
//                
//                if (rs.next()) {
//                    recordList = new ArrayList<MembersVO>();
//                    
//                    do {
//                        MembersVO record = new MembersVO();
//                        record.setId(rs.getString("id"));
//                        record.setPasswd(rs.getString("passwd"));
//                        record.setName(rs.getString("name"));
//                        record.setReg_date(rs.getTimestamp("reg_date"));
//                        
//                        recordList.add(record);
//                    } while (rs.next());
//                }
//                
//            } catch (Exception e) {
//                e.printStackTrace();
//                System.out.println("members 테이블 select에 문제가 생겼습니다.");
//                
//            } finally {
//            	//자원해제
//                if (rs != null) try { rs.close(); } catch (SQLException se) {}
//                if (pstmt != null) try { pstmt.close(); } catch (SQLException se) {}
//                if (conn != null) try { conn.close(); } catch (SQLException se) {}
//            }
//            
//            return recordList;
//        }
//		return result;
//	}
//}
        public int userCheck(String id, String passwd) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            int x = -1; // -1: 아이디 없음, 0: 비밀번호 틀림, 1: 로그인 성공

            try {
                conn = getConnection();
                // 1. 해당 아이디의 레코드가 있는지 확인
                String sql = "select passwd from members where id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    // 아이디가 존재하는 경우
                    String dbPasswd = rs.getString("passwd");
                    if (dbPasswd.equals(passwd)) {
                        x = 1; // 인증 성공
                    } else {
                        x = 0; // 비밀번호 불일치
                    }
                } else {
                    x = -1; // 아이디가 존재하지 않음
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException se) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException se) {}
                if (conn != null) try { conn.close(); } catch (SQLException se) {}
            }
            return x;
        }
    }