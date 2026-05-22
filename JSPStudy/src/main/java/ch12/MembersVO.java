package ch12;

import java.sql.Timestamp;

//Value Object =  값(value) 자체를 표현하는 객체
//                테이블의 데이터를 객체로 캡술화하여 사용
public class MembersVO {
	private String id;
	private String passwd;
	private String name;
	private Timestamp reg_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
