package com.web.test.common.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class fileVo {
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int miniNo;
	private int userNo;
	private int boardNo;

}
