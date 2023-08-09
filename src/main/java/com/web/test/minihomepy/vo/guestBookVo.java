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
public class guestBookVo {
	private int gbNo;
	private int  userNo;
	private int miniNo;
	private int gbWriter;
	private String gbContent;
	private Date gbDay;
	private String gbStatus;
	private String gbSecret;
	
	private String filePath;
	private String userName;
	private int offset;
	private int row;

}
