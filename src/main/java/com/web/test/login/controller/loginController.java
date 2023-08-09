package com.web.test.login.controller;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.test.common.saveFile.saveFile;
import com.web.test.common.vo.fileVo;
import com.web.test.login.service.loginService;
import com.web.test.login.vo.userVo;
import com.web.test.minihomepy.service.minihomepyService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class loginController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private loginService loginservice;
	
	@Autowired
	private minihomepyService miniservice;
	

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	// 로그인
	@RequestMapping("/mylogin.lo")
	public String login() {

		return "user/login";
	}
	// 로그인 유효성검사
	@ResponseBody
	@RequestMapping("/userCheck.lo")
	public String userCheck(userVo lv) {
		logger.debug("CONTROLLER --> userCheck loginVo{}", lv);
		userVo userVo = loginservice.loginProgress(lv);
		logger.debug("CONTROLLER <-- userCheck loginVo{}", userVo);
		// userVo userCheck = loginservice.userCheck(lv);
		if (userVo != null && !userVo.getUserPw().equals("N")) {
			return "Y";
		}else {
			return "N";
		}
	}
	
  @RequestMapping("/loginProgress.lo") 
  public String loginProgress(userVo lv, HttpSession session) { 
	  logger.debug("CONTROLLER --> loginProgress loginVo{}",lv); 
	  userVo loginUser = loginservice.loginProgress(lv);
	  fileVo loginUserFile = loginservice.loginUserFile(loginUser.getUserNo());	
	  logger.debug("CONTROLLER <-- loginProgress loginVo{}", loginUser);
	  //로그인 성공 
	  session.setAttribute("loginUser", loginUser); 
	  session.setAttribute("loginUserFile", loginUserFile);	  
	  return "redirect:/mypage.hp"; 
	}
	 
	// 회원가입
	@RequestMapping("/registerForm.lo")
	public String registerForm() {
		return "user/register";
	}
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping("idCheck.lo")
	public String idCheck(String userId) {
		logger.debug("CONTROLLER --> idCheck userId{}", userId);
		int result = loginservice.idCheck(userId);
		if(result>0) {
			return "NN";
		}else {
			return "YY";
		}
	}
	//이메일 중복 체크
	@ResponseBody
	@RequestMapping("emailCheck.lo")
	public String emailCheck(String userEmail) {
		logger.debug("CONTROLLER --> idCheck userId{}", userEmail);
		int result = loginservice.emailCheck(userEmail);
		if(result>0) {
			return "NN";
		}else {
			return "YY";
		}
	}

	@RequestMapping("/register.lo")
	public String register(userVo lv, HttpServletRequest request) {
		logger.debug("CONTROLLER --> register loginVo{}", lv);

		int result = loginservice.register(lv);
		int userNo = loginservice.searchRegisterUser(lv);
		loginservice.insertFile(userNo);//파일 업로드
		logger.debug("result{}", result);

		return "redirect:/mylogin.lo";
	}
	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/findId.lo", method = RequestMethod.POST)
	public String findId(userVo lv) {
		logger.debug("CONTROLLER --> findId loginVo{}", lv);
		userVo uservo = loginservice.findId(lv);
		logger.debug("CONTROLLER <-- findId loginVo{}", lv);
		if (uservo != null) {
			return uservo.getUserId();
		} else {
			return "N";
		}
	}
	//로그아웃
	@RequestMapping("/logout.lo")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
    	session.invalidate();
    	return "redirect:/mylogin.lo";
	}
	//사진 변경
	@RequestMapping("/changeIMG.lo")
	public String changeIMG(int userNo, MultipartFile upfile, HttpSession session) {
		logger.debug("CONTROLLER --> changeIMG userNo{}", userNo);
		logger.debug("CONTROLLER --> changeIMG file{}", upfile);
		fileVo filevo = null;
		if(upfile != null) {
			if(!upfile.getOriginalFilename().equals("")) {
					
				filevo = miniservice.detailFile(userNo);			
				
				logger.debug("CONTROLLER <-- updateMiniProfiledetailFile{}", filevo);
				if(filevo != null) {
					new File(session.getServletContext().getRealPath(filevo.getFilePath())).delete();//파일삭제
				}
				//새파일 등록
				String changeName = saveFile.changeFileName(upfile, session);//파일명 수정하기
				filevo = fileVo.builder()
								.originName(upfile.getOriginalFilename())
								.changeName(changeName)
								.filePath("resources/uploadFiles/" + changeName)
								.userNo(userNo)
								.build();
			}
			loginservice.updateFile(filevo);//파일 업로드
		}
		//유저정보 session에 담아야함
		fileVo loginFile = ((fileVo)session.getAttribute("loginUserFile"));
		fileVo loginUserFile = loginservice.loginUserFile(loginFile.getUserNo());	
		session.setAttribute("loginUserFile", loginUserFile);
		return "redirect:/mypage.hp";
	}
}
