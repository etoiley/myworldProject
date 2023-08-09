package com.web.test.minihomepy.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.test.common.pagenation.pagenation;
import com.web.test.common.saveFile.saveFile;
import com.web.test.common.vo.fileVo;
import com.web.test.common.vo.moreVo;
import com.web.test.login.service.loginService;
import com.web.test.login.vo.userVo;
import com.web.test.minihomepy.service.minihomepyService;
import com.web.test.minihomepy.vo.boardVo;
import com.web.test.minihomepy.vo.cateVo;
import com.web.test.minihomepy.vo.diaryVo;
import com.web.test.minihomepy.vo.guestBookVo;
import com.web.test.minihomepy.vo.guestcountVo;
import com.web.test.minihomepy.vo.minihomepyVo;
import com.web.test.notice.vo.noticeVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class minihomepyController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private minihomepyService miniservice;
	
	@Autowired
	private loginService loginservice;
	
	@RequestMapping("/mypage.hp")
	private ModelAndView mypage(HttpSession session){
		ModelAndView mv = new ModelAndView();
		userVo loginUser = ((userVo)session.getAttribute("loginUser"));
		if(loginUser == null) {
			mv.setViewName("user/login");
			return mv;
			
		}else {		
			//top-n & 공지 리스트
			List<minihomepyVo> miniVo = miniservice.todayMinihomepyList();
			List<noticeVo> noticeList = miniservice.noticeList();
			logger.debug("CONTROLLER <--todayCount miniNo{}", miniVo);
			mv.addObject("todayMiniH", miniVo).addObject("noticeList", noticeList).setViewName("user/mypage");
			return mv;	
			
		}
	
	}
	
	@RequestMapping("/miniHomepy.hp")
	private ModelAndView myHomepy(int miniNo, int userNo, HttpSession session) {
		logger.debug("CONTROLLER -- myHomepy miniNo{}", miniNo);
		guestcountVo userCount = new guestcountVo(); 
		userVo loginUser = ((userVo)session.getAttribute("loginUser"));
	
		userCount.setMiniNo(miniNo);
		userCount.setGcGuest(loginUser.getUserNo());
		miniservice.userCount(userCount);//홈피 카운팅 
		minihomepyVo miniVo = miniservice.myHomepy(miniNo);
		logger.debug("CONTROLLER <-- myHomepy miniVo{}", miniVo);
		fileVo miniFile = miniservice.detailFile(miniVo.getFileNo());	
		if(miniFile != null) {
			miniVo.setFileNo(miniFile.getFileNo());
			miniVo.setFilePath(miniFile.getFilePath());
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("minihomepyVo", miniVo).setViewName("user/homepy");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/madeMiniHomepy.mh")
	private int madeMiniHomepy(@RequestParam(value="userNo") int userNo, HttpSession session) {
		logger.debug("CONTROLLER -- madeMiniHomepy userNo{}", userNo);
		int miniHomeCheck = miniservice.minihomeCheck(userNo);
		
		if(miniHomeCheck == 0) {
			//미니홈피 없을 경우 - 만들기
			int result = miniservice.madeMiniHomepy(userNo);
			int miniNo = miniservice.myHomepyMiniNo(userNo);
			int BasicCate = miniservice.madeHomepyBasicCate(miniNo);		
			return miniNo;
		}else {
			//미니홈피 있을 경우
			userVo login = ((userVo)session.getAttribute("loginUser"));
			userVo loginUser = loginservice.loginProgress(login);
			session.setAttribute("loginUser", loginUser);
			return 0;
		}	
	}
	
	@ResponseBody
	@RequestMapping("/updateMiniTitle.hp")
	private String updateMiniTitle(minihomepyVo minivo) {
		logger.debug("CONTROLLER --> updateMiniTitle miniNo{}", minivo);
		int result = miniservice.updateMiniTitle(minivo);
		logger.debug("CONTROLLER -- updateMiniTitle result{}", result);
		minihomepyVo miniVo = miniservice.myHomepy(minivo.getMiniNo());
		String miniTitle = miniVo.getMiniTitle();
		return miniTitle;
	}
	@ResponseBody
	@RequestMapping(value="/updateMiniProfile.hp", method = RequestMethod.POST, consumes ={"multipart/form-data"})
	private minihomepyVo updateMiniProfile(minihomepyVo minivo, MultipartFile upfile, HttpSession session) {
		logger.debug("CONTROLLER --> updateMiniProfile miniNo{}", minivo);
		logger.debug("CONTROLLER --> updateMiniProfile upfile{}", upfile);
		fileVo filevo = null;
		if(upfile != null) {
			if(!upfile.getOriginalFilename().equals("")) {
					
				filevo = miniservice.detailFile(minivo.getFileNo());			
				
				logger.debug("CONTROLLER <-- updateMiniProfiledetailFile{}", filevo);
				if(filevo != null) {
					new File(session.getServletContext().getRealPath(filevo.getFilePath())).delete();//파일삭제
				}
				//새파일 등록
				String changeName = saveFile.changeFileName(upfile, session);//파일명 수정하기
				filevo = fileVo.builder()
								.originName(upfile.getOriginalFilename())
								.changeName(changeName)
								.filePath("resources/uploadFiles/" + changeName)
								.miniNo(minivo.getMiniNo())
								.build();
			}
			miniservice.insertFile(filevo);//파일 업로드
		}
		
		fileVo updateFile = miniservice.searchInsertFile(minivo.getMiniNo());//업로드한 파일 인덱스 번호 가져오기
		
		if(updateFile !=null) {
			minivo.setFileNo(updateFile.getFileNo());
			minivo.setFilePath(updateFile.getFilePath());
		}
		miniservice.updateProfile(minivo);//프로필, 상태, 파일 인덱스 번호 수정
		logger.debug("CONTROLLER --> minivo{}", minivo);
				
		return minivo;
		
	}
	//total count
	@ResponseBody
	@RequestMapping("/totalCount.hp")
	private int totalCount(int miniNo) {
		logger.debug("CONTROLLER -->totalCount miniNo{}", miniNo);
		int totalCount = miniservice.totalCount(miniNo);
		logger.debug("CONTROLLER <--totalCount totalCount{}", totalCount);
		return totalCount;		
	}
	//today count
	@ResponseBody
	@RequestMapping("/todayCount.hp")
	private int todayCount(int miniNo) {
		logger.debug("CONTROLLER -->todayCount miniNo{}", miniNo);
		int todayCount = miniservice.todayCount(miniNo);
		return todayCount;		
	}
	//TOP-N
	@RequestMapping("/todayMinihomepyList.hp")
	private ModelAndView todayMinihomepyList() {
		ModelAndView mv = new ModelAndView();
		List<minihomepyVo> miniVo = miniservice.todayMinihomepyList();
		logger.debug("CONTROLLER <--todayCount miniNo{}", miniVo);
		mv.addObject("todayMiniH", miniVo).setViewName("user/mypage");
		return mv;
	}
	//다이어리 홈
	@ResponseBody
	@RequestMapping("/myDiaryHome.hp")
	private List<diaryVo> myDiaryHome(int miniNo) {
		List<diaryVo> diaryList = miniservice.myDiaryHome(miniNo);
		logger.debug("CONTROLLER <--myDiaryHome {}", diaryList);
		return diaryList;
	}
	
	//다이어리 작성
	@ResponseBody
	@RequestMapping("/insertDiary.hp")
	private String insertDiary(diaryVo diaryvo) {
		logger.debug("CONTROLLER --> insertDiary {}", diaryvo);
		int insertdiaryvo = miniservice.inserDiary(diaryvo); 
		if(insertdiaryvo>0) {
			return "/mypage.hp";
		}else {
			return "/mypage.hp";
		}
	}
	//다이어리 상세보기
	@ResponseBody
	@RequestMapping("/detailDiary.hp")
	private diaryVo detailDiary(diaryVo diaryvo) {
		diaryVo result = miniservice.detailDiary(diaryvo);
		return result;
	}
	//다이어리 수정하기
	@ResponseBody
	@RequestMapping("/updateDiary.hp")
	private diaryVo updateDiary(diaryVo diaryvo) {
		logger.debug("CONTROLLER --> updateDiary {}", diaryvo);
		int result = miniservice.updateDiary(diaryvo);
		diaryVo result2 = miniservice.detailDiary(diaryvo);
		return result2;
	}
	//다이어리 삭제하기
	@ResponseBody
	@RequestMapping("/deleteDiary.hp")
	private int deleteDiary(int diaryNo) {
		logger.debug("CONTROLLER --> deleteDiary {}", diaryNo);
		int result = miniservice.deleteDiary(diaryNo);
		return result;
	}
	//게시글 카테고리 보기
	@ResponseBody
	@RequestMapping("/boardCate.hp")
	private List<cateVo> boardCate(int miniNo) {
		logger.debug("CONTROLLER -->boardCate {}", miniNo);	
		List<cateVo> list = miniservice.boardCate(miniNo);
		logger.debug("CONTROLLER <--boardCate {}", list);	
		return list;
	}
	//게시글 카테고리 수정
	@ResponseBody
	@RequestMapping("/updateBoardCate.hp")
	private String updateBoardCate(cateVo cate) {
		logger.debug("CONTROLLER --> updateBoardCate {}", cate);
		//해당 카테고리 글 카테고리 수정	
		//중복되는 이름 존재 여부
		int resultOK = miniservice.insertYN(cate);
		if(resultOK == 1) {
			//중복되었을 경우
			return "NN";
		}else {
			String cateName = miniservice.searchCateNo(cate.getCateNo());
			List<boardVo> boardList = miniservice.cateBoardList(cateName);
			
			if(boardList.size()!=  0) {			
				for(boardVo boardvo : boardList) {
					boardvo.setBoardCate(cate.getChangeName());
					logger.debug("CONTROLLER --> updateBoardCate boardvo {}", boardvo);
					miniservice.updateboardCateList(boardvo);
				}
			}
			//마테고리 수정해야 할 글 카테고리 전부 수정 후, 카테고리 이름 수정
			int result = miniservice.updateboardCate(cate);
			if(result>0) {
				return "YY";
			}else {
				return "NN";
			}		
		}	
	}
	//게시글 카테고리 삭제
	@ResponseBody
	@RequestMapping("/deleteBoardCate.hp")
	private String deleteBoardCate(cateVo cate) {
		logger.debug("CONTROLLER --> deleteBoardCate {}", cate);
		//삭제 가능 여부 - 카테고리 1개 뿐인 경우 삭제 불가능
		int result = miniservice.deleteYN(cate);
		if(result == 1) {
			return "NN1";
		}else {
			//삭제 가능 여부2 - 카테고리에 해당하는 글 있을 경우 삭제 불가능
			int result2 = miniservice.deleteYN2(cate);
			if(result2>0) {
				return "NN2";
			}else {
				//삭제 가능
				int deleteOK = miniservice.deleteBoardCate(cate);
				return "YY";
			}
		}	
	}
	//게시글 카테고리 추가
	@ResponseBody
	@RequestMapping("/insertBoardCate.hp")
	private String insertBoardCate(cateVo cate) {
		logger.debug("CONTROLLER --> insertBoardCate {}", cate);
		//중복되는 이름 존재 여부
		int result = miniservice.insertYN(cate);
		if(result == 1) {
			return "NN";
		}else {
			int insertOK = miniservice.insertBoardCate(cate);
			return cate.getCateName();
		}		
	}
	//게시판 작성
	@ResponseBody
	@RequestMapping(value="/insertBoard.hp", method = RequestMethod.POST, consumes ={"multipart/form-data"})
	private String insertBoard(boardVo boardvo, MultipartFile upfile, HttpSession session ) {
		logger.debug("CONTROLLER --> insertBoardt & upfile{}", boardvo, upfile);

		int result = miniservice.insertBoard(boardvo);
		if(upfile != null) {
			if(result>0) { 
				int boardNo = miniservice.searchBoardNo(boardvo.getMiniNo());
				fileVo filevo = null;
				//전달된 파일있을 경우 파일명 수정 후 서버에 업로드
				if(!upfile.getOriginalFilename().equals("")) {//선택된 파일이 있을 경우
								
					String changeName = saveFile.changeFileName(upfile, session);//파일명 수정
					
					filevo = fileVo.builder()
							.originName(upfile.getOriginalFilename())
							.changeName(changeName)
							.filePath("resources/uploadFiles/" + changeName)
							.boardNo(boardNo)
							.build();
					miniservice.insertFile(filevo);//파일 업로드
				}
			}
		}
		return "YY";
	}
	//게시판 리스트(카테고리별)
	@ResponseBody
	@RequestMapping("/boardList.hp")
	private List<boardVo> boardList(int cateNo){
		logger.debug("CONTROLLER --> boardList{}", cateNo);
		List<boardVo> boardList = miniservice.boardList(cateNo);
		logger.debug("CONTROLLER <-- boardList{}", boardList);
		
		return boardList;
	}
	//게시글 리스트(전체)
	@ResponseBody
	@RequestMapping("/totalBoardList.hp")
	private List<boardVo> totalBoardList(int miniNo){
		logger.debug("CONTROLLER --> totalBoardList{}", miniNo);
		List<boardVo> boardList = miniservice.totalBoardList(miniNo);
		logger.debug("CONTROLLER <-- totalBoardList{}", boardList);
		return boardList;
	}
	//게시글 수정
	@ResponseBody
	@RequestMapping("/detailBoard.hp")
	private boardVo detailBoard(boardVo boardvo) {
		logger.debug("CONTROLLER -->detailBoard{}", boardvo);
		boardVo result = miniservice.detailBoard(boardvo);
		logger.debug("CONTROLLER <--detailBoard{}", result);
		return result;
	}
	//게시글 삭제
	@ResponseBody
	@RequestMapping("/deleteBoard.hp")
	private String deleteBoard(int boardNo) {
		logger.debug("CONTROLLER -->deleteBoard{}", boardNo);
		int result = miniservice.deleteBoard(boardNo);
		if(result>0) {
			return "YY";
		}else {
			return "NN";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/updateBoard.hp", method = RequestMethod.POST, consumes ={"multipart/form-data"})
	private boardVo updateBoard(boardVo boardvo, MultipartFile reupfile, HttpSession session ) {
		logger.debug("CONTROLLER -->updateBoard{}", boardvo);
		logger.debug("CONTROLLER -->reupfile{}", reupfile);
		
		fileVo filevo = null;
		int boardNo = boardvo.getBoardNo();
		if(reupfile != null) {
			//새로운 파일 있을 경우
			if(!reupfile.getOriginalFilename().equals("")) {
				
				filevo = miniservice.detailFile(boardNo);			
				
				logger.debug("CONTROLLER <-- updateBoard file{}", filevo);
				if(filevo != null) {
					new File(session.getServletContext().getRealPath(filevo.getFilePath())).delete();//파일삭제
				}
				//새파일 등록
				String changeName = saveFile.changeFileName(reupfile, session);//파일명 수정하기
				filevo = fileVo.builder()
								.originName(reupfile.getOriginalFilename())
								.changeName(changeName)
								.filePath("resources/uploadFiles/" + changeName)
								.boardNo(boardNo)
								.build();
			}
			miniservice.insertFile(filevo);//파일 업로드
		}
		int result = miniservice.updateBoard(boardvo);
	
		//방금 수정한 글 불러오기
		boardVo data = miniservice.detailBoard(boardvo);
		return data;
					
	}
	
	//방명록 리스트
	@ResponseBody
	@RequestMapping("/guestBookList.hp")
	private List<guestBookVo> guestBookList(int miniNo, int loginUserNo, HttpSession session) {
		logger.debug("CONTROLLER --> guestBookList {}", miniNo);
		
		int userNo = miniservice.searchUser(miniNo);
		
		userVo loginUser = ((userVo)session.getAttribute("loginUser"));
		logger.debug("CONTROLLER --> guestBookList loginUser{}", loginUser);
		
		guestBookVo gb = new guestBookVo();
		gb.setGbWriter(loginUser.getUserNo());
		gb.setMiniNo(miniNo);
		gb.setOffset(0);
		gb.setRow(5);
		
		if(userNo != loginUserNo) {				
			List<guestBookVo> data = miniservice.guestBookList(gb);			
			
			return data;
		}else {
			//비밀글 볼 수 있음		
			List<guestBookVo> data = miniservice.guestBookListS(gb);
			return data;
		}	
	}
	//방명록 더보기(페이징)
	  @ResponseBody  
	  @RequestMapping("/moregbList.hp") 
	  private List<guestBookVo> moreGuestBook(moreVo more, int loginUserNo, HttpSession session) { 
		logger.debug("CONTROLLER --> moreGuestBook {}", more);
		userVo loginUser = ((userVo)session.getAttribute("loginUser"));
		List<guestBookVo> data = new ArrayList<>();
		int userNo = miniservice.searchUser(more.getMiniNo());
		int listCount = miniservice.gblistCount(more.getMiniNo());
		int remainder;
		
		guestBookVo gb = new guestBookVo();
		  
		gb.setOffset(more.getCallLength());
		gb.setRow(5);
		gb.setMiniNo(more.getMiniNo());
		gb.setUserNo(loginUser.getUserNo());
		
		remainder = listCount - more.getCallLength();//남은 게시글 수
		if(remainder != 0) {
			if(remainder < more.getLimit()) {//5보다 작을 때
				gb.setRow(remainder);
			}
	
			//비밀글 여부 체크
			if(userNo != loginUserNo) {				
				data = miniservice.guestBookList(gb);	
				logger.debug("CONTROLLER <-- moreGuestBook data {}", data);
				return data;	
				
			}else {
				//비밀글 볼 수 있음		
				data = miniservice.guestBookListS(gb);
				logger.debug("CONTROLLER <-- moreGuestBook data {}", data);
				return data;
			}	
			
		}
		
		return data;
	  }
	  

	
	//방명록 작성
	@ResponseBody
	@RequestMapping("/insertGuestBook.hp")
	private String insertGuestBook(guestBookVo gb){
		logger.debug("CONTROLLER --> insertGuestBook {}", gb);
		int result = miniservice.insertGuestBook(gb);
		if(result>0){
			return "";
		}else {
			return "";
		}
	}
	//방명록 수정 폼 불러오기
	@ResponseBody
	@RequestMapping("/updateGuestBookForm.hp")
	private guestBookVo updateGuestBookForm(int gbNo) {
		logger.debug("CONTROLLER --> updateGuestBookForm {}", gbNo);
		guestBookVo result = miniservice.updateGuestBookForm(gbNo);
		return result;	
	}
	
	//방명록 수정
	@ResponseBody
	@RequestMapping("/updateGuestBook.hp")
	private guestBookVo updateGuestBook(guestBookVo gb) {
		logger.debug("CONTROLLER --> updateGuestBookForm guestBookVo {}", gb);
		int result = miniservice.updateGuestBook(gb);
		guestBookVo data = miniservice.searchGuestBook(gb.getGbNo());
		return data;																	
	}
	
	//방명록 삭제
	@ResponseBody
	@RequestMapping("/deleteGuestBook.hp")
	private int deleteGuestBook(int gbNo) {
		logger.debug("CONTROLLER --> deleteGuestBook {}", gbNo);
		int result = miniservice.deleteGuestBook(gbNo);
		return result;
	}
	
	//오늘의 방문자
	@ResponseBody
	@RequestMapping("/todayVisitor.hp")
	private List<guestcountVo> todayVisitor(int miniNo) {
		logger.debug("CONTROLLER --> todayVisitor {}", miniNo);
		int userNo = miniservice.miniHomepyUserNo(miniNo);
		userVo uservo = new userVo();
			uservo.setUserNo(userNo);
			uservo.setMiniNo(miniNo);
		List<guestcountVo> result = miniservice.todayVisitor(uservo);
		logger.debug("CONTROLLER <-- todayVisitor {}", result);
		return result;
	}
}
