package org.zerock.member.mapper;

import java.util.List;

import org.zerock.member.vo.MemberVO;
import org.zerock.member.vo.LoginVO;

import com.webjjang.util.PageObject;

public interface MemberMapper {
	
	//dao에서 작성한 메서드 형식으로 만들어준다.
	//interface만 만들어 두면 MyBatis 라이브러리에서 dao를 대신 만들어 준다
	//주고 받는 데이터 타입 정의, sql문과 처리 명령문이 필요하다. --> MemberMapper.xml, 
	
	//1-1.리스트
	public List<MemberVO> list (PageObject pageObject) throws Exception;
	//1-2. 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	//2-1.보기
	public MemberVO view(String id) throws Exception;
	//3. 회원가입
	public int write(MemberVO vo) throws Exception;
	//4. 수정
	public int update(MemberVO vo)throws Exception;
	//5.탈퇴
	public int delete(long no) throws Exception;
	
	//6.로그인처리
	public LoginVO login(LoginVO invo) throws Exception;
	
	
	//7.아이디 중복 체크
	public String idCheck(String id) throws Exception;
	
	//8.상태 변경
	public int changeStatus(MemberVO vo) throws Exception;
	
	//9.등급 변경
	public int changeGradeNo(MemberVO vo) throws Exception;
	

}
