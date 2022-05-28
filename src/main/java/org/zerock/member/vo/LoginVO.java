package org.zerock.member.vo;

import lombok.Data;

@Data
public class LoginVO {

	// 필드선언 = 변수
	
	private String id;
	private String pw;
	private String name;
	private String photo;
	private int gradeNo;
	private String gradeName;
	
	//새로운 메시지를 저장하는 변수->서브쿼리
	//메시지 시스템에서 새 메시지를 읽으면 세션에 있는 새메시지 정보를 -1 처리를 해 줘야한다.
	private long newMessage;
	
	
}
