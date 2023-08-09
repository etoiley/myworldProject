package com.web.test.login.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.web.test.common.vo.fileVo;
import com.web.test.login.mapper.loginMapper;
import com.web.test.login.vo.userVo;

@Service
public class loginService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private loginMapper loginmapper;
	
	//비밀번호 암호화 위한 brypt
	public BCryptPasswordEncoder encodePassword() {
        return new BCryptPasswordEncoder();
    }
		
	//회원가입
	public int register(userVo lv) {
		logger.debug("SERVICE - register loginVo{}", lv);
		BCryptPasswordEncoder bn = new BCryptPasswordEncoder();
		String encPwd = bn.encode(lv.getUserPw());	
		lv.setUserPw(encPwd);
		loginmapper.register(lv);
		
		return 0;
	}
	
	
	//로그인
	public userVo loginProgress(userVo lv) {
		userVo loginUser = loginmapper.loginProgress(lv);
		logger.debug("SERVICE - loginProgress *loginVo{}", loginUser);
		BCryptPasswordEncoder bn = new BCryptPasswordEncoder();			
		
		if(loginUser != null && bn.matches(lv.getUserPw(), loginUser.getUserPw())){
			loginUser.setUserPw("");	
			return loginUser;
		}else {
			if(loginUser != null) {
				loginUser.setUserPw("N");
			}		
			return loginUser;
		}	
	}

	public userVo findId(userVo lv) {
		logger.debug("SERVICE - findId *loginVo{}", lv);
		userVo userVo = loginmapper.findId(lv);
		return userVo;		
	}

	public int searchRegisterUser(userVo lv) {
		
		return loginmapper.searchREgisterUser(lv);
	}

	public void insertFile(int userNo) {
		loginmapper.insertFile(userNo);	
	}

	public fileVo loginUserFile(int userNo) {	
		return loginmapper.loginUserFile(userNo);
	}

	public int idCheck(String userId) {
		return loginmapper.idCheck(userId);	
	}

	public int emailCheck(String userEmail) {
		return loginmapper.emailcheck(userEmail);
	}

	public int updateFile(fileVo filevo) {
		return loginmapper.updateFile(filevo);
		
	}










}
