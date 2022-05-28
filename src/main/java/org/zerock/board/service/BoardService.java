package org.zerock.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.board.mapper.BoardMapper;
import org.zerock.board.vo.BoardVO;

import com.webjjang.util.PageObject;

// @Controller, @Service, @Repository, @Component, @RestController
//-> root-context.xml, servlet-context.xml에 scan패키지 안쪽에 존재
@Service
public class BoardService {
	@Inject
	private BoardMapper mapper;
		//1.list
		public List<BoardVO> list(PageObject pageObject) throws Exception{
			//전체 데이터 개수 가져오기는 처리를 해야 시작줄과 끝줄
			pageObject.setTotalRow(mapper.getTotalRow(pageObject));
			System.out.println("BoardService.list().pageObject - " + pageObject);
			return mapper.list(pageObject);
	}
		
		//2. view
		public BoardVO view(long no, int inc) throws Exception{
			System.out.println("BoardService.view().no -" + no + ", " + inc);
			if(inc ==1) mapper.increase(no);
			return mapper.view(no);
				
			}
		
		//3.write
		public int write(BoardVO vo)throws Exception{
			System.out.println("BoardService.write().vo - " + vo);
			return mapper.write(vo);
		}
		
		//4.update
		public int update(BoardVO vo)throws Exception{
			System.out.println("BoardService.update().vo - " + vo);
			return mapper.update(vo);
		}
		
		//5.delete
		public int delete(long no)throws Exception{
			System.out.println("BoardService.update().no - " + no);
			return mapper.delete(no);
		}
		
}
	

