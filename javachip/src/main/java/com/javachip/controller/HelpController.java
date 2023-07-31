package com.javachip.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javachip.service.HelpService;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/help")
public class HelpController {
	
	@Autowired HelpService helpService;
	
	// faq
	@RequestMapping(value="/faq.do", method = RequestMethod.GET)
	public String faq() {
		return "help/faq";
	}
	
	//qna
	@RequestMapping(value="/qna.do", method = RequestMethod.GET)
	public String qna() {
		return "help/qna";
	}
	@RequestMapping(value="/qnaWrite.do", method = RequestMethod.GET)
	public String qnaWrite(String qType, Model model) {
			
		// qType 이 없을 경우 qType은 nQnA
		if(qType == null || qType.equals("")) {
			qType = "n";
		}
		
		model.addAttribute("qType", qType);
		
		if(qType == "n" || qType == "p") {
			
			return "help/qnaWrite";
		}
		// 잘못된 타입일 경우 qna 페이지로
		return "help/qna";
	}
	@RequestMapping(value="/qnaWrite.do", method = RequestMethod.POST)
	public String qnaWriteAction() {
		
		return "redirect:qnaView.do";
	}
	@RequestMapping(value="/qnaView.do", method = RequestMethod.GET)
	public String qnaView() {
		return "help/qnaView";
	}
	@RequestMapping(value="/qnaModify.do", method = RequestMethod.GET)
	public String qnaModify(String qType, Model model) {
		
		// qNo 를 받아올 수 있을 때 boardVo로 받아오고 다음 항목을 제거 start
		// qType 이 없을 경우 qType은 nQnA
		if(qType == null || qType.equals("")) {
			qType = "n";
		}
		
		model.addAttribute("qType", qType);
		
		if(qType == "n" || qType == "p") {
			
			return "help/qnaModify";
		}
		// 잘못된 타입일 경우 qna 페이지로
		return "help/qna";
		//board 를 받아올 수 있을 때 boardVo로 받아오고 다음 항목을 제거 end
		
	}
	@RequestMapping(value="/qnaModify.do", method = RequestMethod.POST)
	public String qnaModifyAction() {
		return "redirect:qnaView.do";
	}
	
	@RequestMapping(value="/qnaDelete.do", method = RequestMethod.POST)
	public String qnaDelete() {
		return "redirect:qna.do";
	}
	
	@RequestMapping(value="/productSelect.do", method = RequestMethod.GET)
	public String productSelecte() {
		return "help/productSelect";
	}
	
	//notice
	@RequestMapping(value="/notice.do", method = RequestMethod.GET)
	public String notice() {
		return "help/notice";
	}
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.GET)
	public String noticeWrite() {
		return "help/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.POST)
	public String noticeWriteAction(NoticeVO noticeVO, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
				
		// login 기능 활성화 시 추후 작성
		// UserVO loginVO = (UserVO)session.getAttribute("login");
		int uNo = 1;	// 임시 uNo
		
		noticeVO.setuNo(uNo);
		
		int result = helpService.insertNotice(noticeVO);
		
		System.out.println(noticeVO.toString());
		
		return "redirect:noticeView.do";	// 추후 주소 변경
	}
	
	
	@RequestMapping(value="/noticeView.do", method = RequestMethod.GET)
	public String noticeView() {
		return "help/noticeView";
	}
	@RequestMapping(value="/noticeModify.do", method = RequestMethod.GET)
	public String noticeModify() {
		return "help/noticeModify";
	}
	@RequestMapping(value="/noticeModify.do", method = RequestMethod.POST)
	public String noticeModifyAction() {
		return "redirect:noticeView.do";
	}
	@RequestMapping(value="/noticeDelete.do", method = RequestMethod.POST)
	public String noticeDelete() {
		return "redirect:notice.do";
	}


	
}