package org.zerock.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.board.service.BoardService;
import org.zerock.board.vo.BoardVO;

import com.webjjang.util.PageObject;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	
	//의존성 자동 주입(Dependency Inject) ->자동으로 하도록 지정하는 어노테이션: @Autowired,@inject
	@Autowired
	private BoardService service;
	
	//1. list
	//처리 결과를 request에 담아야 하는데 Spring에서는 request가 model에 존재한다.
	//model에 넣어주면 request에 담기도록 프로그램 되어있다. 파라미터로 모델 객체를 전달 받아서 사용한다
	@GetMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model) throws Exception{
		//페이지가 1보다 작으면 1페이지로 세팅해준다.
		if(pageObject.getPage() < 1) pageObject.setPage(1);
		
		//System.out.println("BoardController.list().pageObject - " + pageObject);
		model.addAttribute("list", service.list(pageObject));
		return "board/list";
	}
	
	//2. view
	@GetMapping("/view.do")
	public String view(long no, int inc,Model model) throws Exception{
		//System.out.println("BoardController.view().no,inc - " + no + ", " + inc);
		
		//글내용 중에서 줄바꿈 처리 해야만 한다. \n -><br>로 바꾼다
		BoardVO vo = service.view(no, inc);
		vo.setContent(vo.getContent().replace("\n", "<br>"));
		model.addAttribute("vo",vo);
		
		return "board/view";
		
	}
	//3-1. writeForm
	@GetMapping("/write.do")
	public String writeForm() throws Exception{
		return "board/write";
	}
	//3-2. Write
	@PostMapping("/write.do")
	public String write(BoardVO vo, int perPageNum, RedirectAttributes ra) throws Exception{
		//System.out.println("BoardController.write().vo - " + vo);
		service.write(vo);
		
		ra.addFlashAttribute("msg", "성공적으로 글 등록이 되었습니다.");
		return "redirect:list.do?page=1&perPageNum=" + perPageNum;
	}
	//4-1. updateForm
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception{
		//System.out.println("BoardController.updateForm().no - " + no);
		model.addAttribute("vo", service.view(no,0));
		
		return "board/update";
	}
	
	
	//4-2. update
	@PostMapping("/update.do")
	public String update(PageObject pageObject, BoardVO vo) throws Exception{
		//System.out.println("BoardController.update().vo - " + vo);
		service.update(vo);
		return "redirect:view.do?no=" + vo.getNo() + "&inc=0"
				+ "&page=" + pageObject.getPage() + "&perPageNum=" +pageObject.getPerPageNum();
	}
	//5.delete
	@GetMapping("/delete.do")
	public String delete(long no, int perPageNum, RedirectAttributes ra) throws Exception{
		//System.out.println("BoardController.delete().no - " + no);
		service.delete(no);
		
		//redirect하는 페이지에서 한번만 사용되는 속성값을 전달할 수 있다 -> session
		ra.addFlashAttribute("msg", "성공적으로 글 삭제가 되었습니다.");
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	
	

	}
}
