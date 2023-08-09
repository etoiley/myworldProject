package com.web.test.notice.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class noticeVo {
	
	private int noticeNo;
	private int userNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDay;
	private Date noticeModify;
	private String NoticeStatus;
	private int NoticeCount;
	
	private int row;
	private int offset;
	
}
