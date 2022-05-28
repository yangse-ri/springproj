package org.zerock.notice.mapper;

import java.util.List;

import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.PageObject;

public interface NoticeMapper {
	
	//dao에서 작성한 메서드 형식으로 만들어준다.
	//interface만 만들어 두면 MyBatis 라이브러리에서 dao를 대신 만들어 준다
	//주고 받는 데이터 타입 정의, sql문과 처리 명령문이 필요하다. --> NoticeMapper.xml, 
	
	//1-1.리스트
	public List<NoticeVO> list(PageObject pageObject) throws Exception;
	//1-2. 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	//2-1.보기
	public NoticeVO view(long no) throws Exception;
	
	//3. 글쓰기
	public int write(NoticeVO vo) throws Exception;
	//4. 수정
	public int update(NoticeVO vo)throws Exception;
	//5.삭제
	public int delete(long no) throws Exception;
	
	

}
