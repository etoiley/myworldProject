package com.web.test.notice.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.test.notice.mapper.noticeMapper;
import com.web.test.notice.vo.noticeVo;

@Service
public class noticeService {

	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private noticeMapper noticemapper;
	
	public List<noticeVo> noticeList(noticeVo noticevo) {
		 List<noticeVo> noticeList = noticemapper.noticeList(noticevo);
		 logger.debug("SERVICE <-- noticeList noticeList{}", noticeList);
		return noticeList;
	}
	// 공지사항 등록하기
	public int insertNotice(noticeVo noticeVo) {
		int result = noticemapper.insertNotice(noticeVo);
		return result;		
	}
	public int noticeIncreaseCount(int noticeNo) {
		int result = noticemapper.noticeIncreaseCount(noticeNo);
		return result;
	}
	//공지사항 상세보기
	public noticeVo noticeDetail(int noticeNo) {
		noticeVo noticeVo = noticemapper.noticeDetail(noticeNo);
		return noticeVo;
	}
	//공지사항 삭제하기
	public int deleteNotice(int noticeNo) {
		int result = noticemapper.deleteNotice(noticeNo);
		return result;
	}
	//공지사항 수정하기
	public int updateNotice(noticeVo noticeVo) {
		int result = noticemapper.updateNotice(noticeVo);
		return result;
	}
	//공지사항 글 개수
	public int listCount() {
		int result = noticemapper.listCount();
		return result;
	}

	
}
