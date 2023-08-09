package com.web.test.minihomepy.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class diaryVo {
		private int diaryNo;
		private int userNo;
		private int miniNo;
		private String diaryTitle;
		private String DiaryContent;
		private Date diaryDay;
		private String diaryStatus;
		private int diaryCount;

}
