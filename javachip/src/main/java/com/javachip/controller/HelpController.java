package com.javachip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/help")
public class HelpController {
	
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
			
		// qType �� ���� ��� qType�� nQnA
		if(qType == null || qType.equals("")) {
			qType = "n";
		}
		
		model.addAttribute("qType", qType);
		
		if(qType == "n" || qType == "p") {
			
			return "help/qnaWrite";
		}
		// �߸��� Ÿ���� ��� qna ��������
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
		
		// qNo �� �޾ƿ� �� ���� �� boardVo�� �޾ƿ��� ���� �׸��� ���� start
		// qType �� ���� ��� qType�� nQnA
		if(qType == null || qType.equals("")) {
			qType = "n";
		}
		
		model.addAttribute("qType", qType);
		
		if(qType == "n" || qType == "p") {
			
			return "help/qnaModify";
		}
		// �߸��� Ÿ���� ��� qna ��������
		return "help/qna";
		//board �� �޾ƿ� �� ���� �� boardVo�� �޾ƿ��� ���� �׸��� ���� end
		
	}
	@RequestMapping(value="/qnaModify.do", method = RequestMethod.POST)
	public String qnaModifyAction() {
		return "redirect:qnaView.do";
	}
	
	@RequestMapping(value="/qnaDelete.do", method = RequestMethod.POST)
	public String qnaDelete() {
		return "redirect:qna.do";
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
	public String noticeWriteAction() {
		
		return "redirect:noticeView.do";
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
