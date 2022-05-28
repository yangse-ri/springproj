package org.zerock.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.member.mapper.MemberMapper;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.PageObject;

@Service
public class MemberService {//메소드 만들기
	
	//자동 DI
	@Inject
	private MemberMapper mapper;
	
	//회원 리스트
	public List<MemberVO> list(PageObject pageObject) throws Exception{
		//전체 데이터의 갯수를 구해서 pageObject에 넣는다.
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	//회원 정보보기 / 내정보보기
	public MemberVO view(String id) throws Exception{
		return mapper.view(id);
	}
	
	//회원가입
	public int write(MemberVO vo)throws Exception{
		return mapper.write(vo);
	}
	
	
	//로그인 
	public LoginVO login(LoginVO invo) throws Exception{
		return mapper.login(invo);
		
	}
	//idCheck(아이디 가져오기)
	public String idCheck(String id) throws Exception{
		return mapper.idCheck(id);
		
	}
	//상태 변경
	public int changeStatus(MemberVO vo) throws Exception{
		return mapper.changeStatus(vo);
	}
	
	//등급 변경
	public int changeGradeNo(MemberVO vo) throws Exception{
		return mapper.changeGradeNo(vo);
	}


}
