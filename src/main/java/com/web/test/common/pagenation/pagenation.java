package com.web.test.common.pagenation;

import com.web.test.common.vo.pageVo;

public class pagenation {
	
public static pageVo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		return new pageVo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	}

}


