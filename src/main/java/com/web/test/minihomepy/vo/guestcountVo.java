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
public class guestcountVo {
	private int userNo;
	private int miniNo;
	private int gcGuest;
	private Date gcDay;
	private int gcCount;
	
	private String userId;
	private String userName;

}
