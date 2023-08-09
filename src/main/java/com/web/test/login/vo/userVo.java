package com.web.test.login.vo;

import java.sql.Date;

import com.web.test.minihomepy.vo.minihomepyVo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class userVo {
	
	private int userNo;
	private String userName;
	private String userId;
	private String userPw;
	private String userPhone;
	private String userEmail;
	private String userAddress;
	private String userAddressDetail;
	private String userZoneCode;
	private Date userDay;
	private String userStatus;
	private String userAdminYN;
	private String userAddressDetail2;
	
	private int miniNo;

	

		

}
