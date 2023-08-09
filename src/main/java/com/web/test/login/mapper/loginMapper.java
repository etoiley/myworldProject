package com.web.test.login.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.web.test.common.vo.fileVo;
import com.web.test.login.vo.userVo;

@Mapper
public interface loginMapper {

	    void register(userVo userVo);

		userVo loginProgress(userVo userVo);

		userVo findId(userVo lv);

		int searchREgisterUser(userVo lv);

		void insertFile(int userNo);

		fileVo loginUserFile(int userNo);

		int idCheck(String userId);

		int emailcheck(String userEmail);

		int updateFile(fileVo filevo);
		
}
