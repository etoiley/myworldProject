package com.web.test.notice.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.test.common.pagenation.pagenation;
import com.web.test.common.vo.pageVo;
import com.web.test.notice.service.noticeService;
import com.web.test.notice.vo.noticeVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class noticeController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private noticeService noticeservice;

	// 작성할 공지사항 목록 가져오기
	@RequestMapping("/noticeList.no")
	public ModelAndView noticeList(@RequestParam(value = "npage", defaultValue = "1") int currentPage) {
		ModelAndView mv = new ModelAndView();
		noticeVo noticevo = new noticeVo();
		
		// pagenation
		int listCount = noticeservice.listCount();
		pagenation pagenation = new pagenation();
		pageVo pagevo = pagenation.getPageInfo(listCount, currentPage, 2, 10);

		int row = 5;// 변동 X, limit
		int offset = ((currentPage - 1) * 2);//

		noticevo.setRow(row);
		noticevo.setOffset(offset);

		List<noticeVo> noticeList = noticeservice.noticeList(noticevo);
		logger.debug("noticeList{}", noticeList);
		mv.addObject("noticeList", noticeList).addObject("page", pagevo).setViewName("admin/notice");
		return mv;
	}

	@RequestMapping("/noticeEnrollForm.no")
	public String noticeEnrollform() {
		return "admin/noticeForm";
	}

	// 공지사항 작성하기
	@RequestMapping("/insertNotice.no")
	public String insertNotice(noticeVo noticeVo, HttpSession session) {		 
		
		logger.debug("CONTROLLER -- insertNotice -- noticeVo{}", noticeVo);
		int result = noticeservice.insertNotice(noticeVo);
		if (result > 0) {
			logger.debug("CONTROLLER -- insertNotice Success", result);
			return "redirect:/noticeList.no";
		} else {
			return "redirect:/noticeList.no";
		}
	}

	// 공지사항 상세보기
	@RequestMapping("/noticeDetail.no")
	public ModelAndView noticeDetail(@RequestParam(value = "nno") int noticeNo) {
		logger.debug("noticeDetail noticeNo {}", noticeNo);
		ModelAndView mv = new ModelAndView();
		int result = noticeservice.noticeIncreaseCount(noticeNo);
		if (result > 0) {
			noticeVo noticeVo = noticeservice.noticeDetail(noticeNo);
			logger.debug("CONTROLLER <-- noticeDetail noticeVo {}", noticeVo);
			mv.addObject("noticeVo", noticeVo).setViewName("admin/noticeDetail");
		} else {
			mv.setViewName("admin/notice");
		}
		return mv;
	}

	// 공지사항 수정하기(수정폼으로)
	@RequestMapping("/updateNoticeDetail.no")
	public ModelAndView updateNoticeDetail(int noticeNo) {
		ModelAndView mv = new ModelAndView();
		noticeVo noticeVo = noticeservice.noticeDetail(noticeNo);
		logger.debug("CONTROLLER <-- noticeDetail noticeVo {}", noticeVo);
		mv.addObject("noticeVo", noticeVo).setViewName("admin/noticeUpdate");
		return mv;
	}

	// 공지사항 수정하기
	@RequestMapping("/updateNotice.no")
	public String updateNotice(noticeVo noticeVo, HttpSession session) {
		logger.debug("CONTROLLER --> updateNotice noticeVo {}", noticeVo);
		int result = noticeservice.updateNotice(noticeVo);
		if (result > 0) {
			session.setAttribute("alertMsg", "게시글 수정 성공");
			return "redirect:/noticeDetail.no?nno=" + noticeVo.getNoticeNo();
		} else {
			session.setAttribute("alertMsg", "게시글 수정 실패");
			return "redirect:/noticeDetail.no?nno=" + noticeVo.getNoticeNo();
		}
	}

	// 공지사항 삭제하기
	@RequestMapping("/deleteNotice.no")
	public String deleteNotice(int noticeNo, HttpSession session) {
		int result = noticeservice.deleteNotice(noticeNo);
		if (result > 0) {
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redircet:/noticeList.no";
		} else {
			session.setAttribute("alertMsg", "게시글 삭제 실패");
			return "redircet:/noticeList.no";
		}
	}
}
