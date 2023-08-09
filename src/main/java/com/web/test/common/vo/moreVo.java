package com.web.test.common.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class moreVo {
	private int callLength;
	private int limit;
	
	private int miniNo;
}
