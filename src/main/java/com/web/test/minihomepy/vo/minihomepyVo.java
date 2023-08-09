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
public class minihomepyVo {
	
	private int miniNo;
	private int userNo;
	private Date miniDay;
	private int miniTotal;
	private int miniToday;
	private String miniProfile;
	private String miniMystatus;
	private String miniTitle;
	private int fileNo;
	
	private int gcCount;
	private String filePath;
	private String userName;
	private Date userDay;
}
