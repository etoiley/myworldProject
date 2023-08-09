package com.web.test.minihomepy.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class cateVo {
	private int cateNo;
	private int miniNo;
	private String cateName;
	private String cateStatus;
	
	private String changeName;
}
