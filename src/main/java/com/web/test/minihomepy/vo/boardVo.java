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
public class boardVo {
	private int boardNo;
	private String boardCate;
	private String boardTitle;
	private String boardContent;
	private String boardStatus;
	private Date boardDay;
	private int BoardCount;
	private int miniNo;
	
	private String filePath;
	private int offset;
	private int row;

}
