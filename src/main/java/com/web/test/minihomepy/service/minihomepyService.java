package com.web.test.minihomepy.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.test.common.vo.fileVo;
import com.web.test.login.vo.userVo;
import com.web.test.minihomepy.mapper.minihomepyMapper;
import com.web.test.minihomepy.vo.boardVo;
import com.web.test.minihomepy.vo.cateVo;
import com.web.test.minihomepy.vo.diaryVo;
import com.web.test.minihomepy.vo.guestBookVo;
import com.web.test.minihomepy.vo.guestcountVo;
import com.web.test.minihomepy.vo.minihomepyVo;
import com.web.test.notice.vo.noticeVo;
@Service
public class minihomepyService {
	

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private minihomepyMapper minimapper;
	
	//미니홈피 존재유무 체크
	public int minihomeCheck(int userNo) {
		return minimapper.minihomeCheck(userNo);
	}
	
	//미니홈피 만들기
	public int madeMiniHomepy(int userNo) {
		int result = minimapper.madeMiniHomepy(userNo);	
		return result;		
	}
	//미니홈피 게시판 기본 카테고리 생성 
	public int madeHomepyBasicCate(int miniNo) {
		return minimapper.madeHomepyBasicCate(miniNo);
	}


	//미니홈피 번호 찾기
	public int myHomepyMiniNo(int userNo) {
		int miniNo = minimapper.myHomepyMiniNo(userNo);
		return miniNo;
	}

	//미니홈피 정보 가져오기
	public minihomepyVo myHomepy(int miniNo) {
		minihomepyVo miniVo = minimapper.myHomepy(miniNo);
		logger.debug("SERVICE <-- myHomepy miniVo{}", miniVo);
		return miniVo;
	}

	public int updateMiniTitle(minihomepyVo minivo) {
		int result = minimapper.updateMiniTitle(minivo);
		return result;
	}

	public void userCount(guestcountVo userCount) {
		minimapper.userCount(userCount);	
	}

	public int totalCount(int miniNo) {
		int result = minimapper.totalCount(miniNo);
		return result;	
	}

	public int todayCount(int miniNo) {
		int result = minimapper.todayCount(miniNo);
		return result;
	}

	public List<minihomepyVo> todayMinihomepyList() {	
		return minimapper.todayMinihomepyList();
	}
	
	public List<boardVo> totalBoardList(int miniNo) {
		return minimapper.totalBoardList(miniNo);
	}
	
	public List<noticeVo> noticeList() {
		return minimapper.noticeList();
	}

	public fileVo detailFile(int fileNo) {		
		return minimapper.detailFile(fileNo);
	}
	
	public int insertFile(fileVo filevo) {	
		return minimapper.insertFile(filevo);
	}

	public int updateProfile(minihomepyVo minivo) {	
		return minimapper.updateProfile(minivo);
	}

	public fileVo searchInsertFile(int miniNo) {	
		return minimapper.searchInsertFile(miniNo);
	}

	public List<diaryVo> myDiaryHome(int miniNo) {	
		return minimapper.myDiaryHome(miniNo);
	}

	public int inserDiary(diaryVo diaryvo) {
		return minimapper.insertDiary(diaryvo);
	}

	public diaryVo detailDiary(diaryVo diaryvo) {	
		return minimapper.detailDiary(diaryvo);
	}

	public int updateDiary(diaryVo diaryvo) {		
		return minimapper.updateDiary(diaryvo);
	}

	public int deleteDiary(int diaryNo) {
		return minimapper.deleteDiary(diaryNo);
	}

	public List<guestBookVo> guestBookList(guestBookVo gb) {
		return minimapper.guestBookList(gb);	
	}

	public int searchUser(int miniNo) {
		return minimapper.searchUser(miniNo);
	}

	public List<guestBookVo> guestBookListS(guestBookVo gb) {
		return minimapper.guestBookListS(gb);
	}

	public int insertGuestBook(guestBookVo gb) {		
		return minimapper.insertGuestBook(gb);
	}

	public int deleteGuestBook(int gbNo) {	
		return minimapper.deleteGuestBook(gbNo);
	}

	public guestBookVo updateGuestBookForm(int gbNo) {
		return minimapper.updateGuestBookForm(gbNo);
	}

	public int updateGuestBook(guestBookVo gb) {	
		return minimapper.updateGuestBook(gb);
	}

	public guestBookVo searchGuestBook(int gbNo) {	
		return minimapper.searchGuestBook(gbNo);
	}

	public List<cateVo> boardCate(int miniNo) {
		return minimapper.boardCate(miniNo);
	}

	public int updateboardCate(cateVo cate) {
		return minimapper.updateboardCate(cate);
	}

	public List<boardVo> cateBoardList(String cateName) {
		return minimapper.cateBoardList(cateName);
	}

	public void updateboardCateList(boardVo boardvo) {
		minimapper.updateboardCateList(boardvo);	
	}

	public int deleteYN(cateVo cate) {
		return minimapper.deleteYN(cate);
	}

	public int deleteYN2(cateVo cate) {
		return minimapper.deleteYN2(cate);
	}

	public int deleteBoardCate(cateVo cate) {
		return minimapper.deleteBoardCate(cate);	
	}
	
	public int insertYN(cateVo cate) {
		return minimapper.insertYN(cate);
	}

	public int insertBoardCate(cateVo cate) {
		return minimapper.insertBoardCate(cate);
	}

	public int insertBoard(boardVo boardvo) {
		return minimapper.insertBoard(boardvo);
	}

	public int searchBoardNo(int miniNo) {
		return minimapper.searchBoardNo(miniNo);
	}

	public String searchCateNo(int cateNo) {
		return minimapper.searchCateNo(cateNo);
	}

	public List<boardVo> boardList(int cateNo) {
		return minimapper.boardList(cateNo);
	}

	public boardVo detailBoard(boardVo boardvo) {
		return minimapper.detailBoard(boardvo);
	}

	public int updateBoard(boardVo boardvo) {
		return minimapper.updateBoard(boardvo);	
	}

	public int deleteBoard(int boardNo) {
		return minimapper.deleteBoard(boardNo);
	}

	public List<guestcountVo> todayVisitor(userVo uservo) {
		return minimapper.todayVisitor(uservo);
	}

	public int miniHomepyUserNo(int miniNo) {
		return minimapper.miniHomepyUserNo(miniNo);
	}

	public int gblistCount(int miniNo) {
		return minimapper.gblistcount(miniNo);
	}
	
	public int gblistCountS(int miniNo) {
		return minimapper.gblistcountS(miniNo);
	}

	





	
	

}
