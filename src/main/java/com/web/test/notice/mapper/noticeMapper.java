package com.web.test.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.test.notice.vo.noticeVo;
@Mapper
public interface noticeMapper {
	
	List<noticeVo> noticeList(noticeVo noticevo);

	int insertNotice(noticeVo noticeVo);

	noticeVo noticeDetail(int noticeNo);

	int deleteNotice(int noticeNo);

	int noticeIncreaseCount(int noticeNo);

	int updateNotice(noticeVo noticeVo);

	int listCount();
	
}
