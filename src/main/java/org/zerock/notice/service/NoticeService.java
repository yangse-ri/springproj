package org.zerock.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.notice.mapper.NoticeMapper;
import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.PageObject;

// @Controller, @Service, @Repository, @Component, @RestController
//-> root-context.xml, servlet-context.xml에 scan패키지 안쪽에 존재
@Service
public class NoticeService {
	@Inject
	private NoticeMapper mapper;
		//1.list
		public List<NoticeVO> list(PageObject pageObject) throws Exception{
			//전체 데이터 개수 가져오기는 처리를 해야 시작줄과 끝줄
			pageObject.setTotalRow(mapper.getTotalRow(pageObject));
			System.out.println("NoticeService.list().pageObject - " + pageObject);
			return mapper.list(pageObject);
	}
		
		//2. view
		public NoticeVO view(long no) throws Exception{
			System.out.println("NoticeService.view().no -" + no);
			
			return mapper.view(no);
				
			}
		
		//3.write
		public int write(NoticeVO vo)throws Exception{
			System.out.println("NoticeService.write().vo - " + vo);
			return mapper.write(vo);
		}
		
		//4.update
		public int update(NoticeVO vo)throws Exception{
			System.out.println("NoticeService.update().vo - " + vo);
			return mapper.update(vo);
		}
		
		//5.delete
		public int delete(long no)throws Exception{
			System.out.println("NoticeService.update().no - " + no);
			return mapper.delete(no);
		}
		
}
	

