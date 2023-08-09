package com.web.test.minihomepy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.test.common.vo.fileVo;
import com.web.test.login.vo.userVo;
import com.web.test.minihomepy.vo.boardVo;
import com.web.test.minihomepy.vo.cateVo;
import com.web.test.minihomepy.vo.diaryVo;
import com.web.test.minihomepy.vo.guestBookVo;
import com.web.test.minihomepy.vo.guestcountVo;
import com.web.test.minihomepy.vo.minihomepyVo;
import com.web.test.notice.vo.noticeVo;

@Mapper
public interface minihomepyMapper {
	
	int minihomeCheck(int userNo);

	int madeMiniHomepy(int userNo);
	
	int madeHomepyBasicCate(int miniNo);

	int myHomepyMiniNo(int userNo);

	minihomepyVo myHomepy(int miniNo);

	int updateMiniTitle(minihomepyVo minivo);

	void userCount(guestcountVo userCount);

	int totalCount(int miniNo);

	int todayCount(int miniNo);

	List<minihomepyVo> todayMinihomepyList();
	
	List<boardVo> totalBoardList(int miniNo);
	
	List<noticeVo> noticeList();

	fileVo detailFile(int fileNo);
	
	int insertFile(fileVo filevo);
	
	fileVo searchInsertFile(int miniNo);

	int updateProfile(minihomepyVo minivo);

	List<diaryVo> myDiaryHome(int miniNo);

	int insertDiary(diaryVo diaryvo);

	diaryVo detailDiary(diaryVo diaryvo);

	int updateDiary(diaryVo diaryvo);

	int deleteDiary(int diaryNo);

	List<guestBookVo> guestBookList(guestBookVo gb);

	int searchUser(int miniNo);

	List<guestBookVo> guestBookListS(guestBookVo gb);

	int insertGuestBook(guestBookVo gb);

	int deleteGuestBook(int gbNo);

	guestBookVo updateGuestBookForm(int gbNo);

	int updateGuestBook(guestBookVo gb);

	guestBookVo searchGuestBook(int gbNo);

	List<cateVo> boardCate(int miniNo);

	int updateboardCate(cateVo cate);

	List<boardVo> cateBoardList(String cateName);

	void updateboardCateList(boardVo boardvo);

	int deleteYN(cateVo cate);

	int deleteYN2(cateVo cate);

	int deleteBoardCate(cateVo cate);

	int insertYN(cateVo cate);

	int insertBoardCate(cateVo cate);

	int insertBoard(boardVo boardvo);

	int searchBoardNo(int miniNo);

	String searchCateNo(int cateNo);

	List<boardVo> boardList(int cateNo);

	boardVo detailBoard(boardVo boardvo);

	int updateBoard(boardVo boardvo);

	int deleteBoard(int boardNo);

	List<guestcountVo> todayVisitor(userVo uservo);

	int miniHomepyUserNo(int miniNo);

	int gblistcount(int miniNo);
	
	int gblistcountS(int miniNo);

	

	

	

	



}
