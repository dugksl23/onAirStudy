package com.kh.onairstudy.studytime.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.onairstudy.attendance.model.service.AttendanceService;
import com.kh.onairstudy.attendance.model.vo.Attendance;
import com.kh.onairstudy.member.model.service.MemberService;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.member.model.vo.MemberInfo;
import com.kh.onairstudy.scheduler.model.service.SchedulerService;
import com.kh.onairstudy.scheduler.model.vo.Scheduler;
import com.kh.onairstudy.studytime.model.service.StudytimeService;
import com.kh.onairstudy.studytime.model.vo.Studytime;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping
@SessionAttributes({"memberInfo","sideBarInfo"})
public class StudytimeController {
	
	@Autowired
	private StudytimeService studytimeService;
	
	@Autowired
	private AttendanceService attendanceService; 
	
	@Autowired
	private SchedulerService schedulerService;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/mypage1_index.do")
	public String studytimeList(Model model, HttpSession session) {
		
		Member loginMember = (Member)session.getAttribute("loginUser");
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", loginMember.getMemberId());
		
		List<Studytime> studytimeList = studytimeService.selectList(loginMember.getMemberId());
		List<Attendance> attendList = attendanceService.selectList(loginMember.getMemberId());
		List<Scheduler> scheduleList = schedulerService.mainScheduler(map);
		List<String> srList = studytimeService.selectsrList(loginMember.getMemberId());
		Map<String, Object> sideBarInfo = memberService.selectMemberInfo(loginMember.getMemberId());
		
		MemberInfo memberInfo = memberService.selectdDayInfo(loginMember.getMemberId());
		
		log.info("studytimeList= {}", studytimeList);
		log.info("attendList= {}" , attendList );
		log.info("todoList ={}" , scheduleList);
		log.info("srList ={}" , srList);
		log.info("sideBarInfo ={}" , sideBarInfo);
		log.info("memberInfo ={}" , memberInfo);
		
		model.addAttribute("studytimeList",studytimeList);
		model.addAttribute("attendList" , attendList );
		model.addAttribute("todoList" , scheduleList );
		model.addAttribute("srList" , srList );
		model.addAttribute("sideBarInfo" , sideBarInfo );
		model.addAttribute("memberInfo" , memberInfo );
		
		return "mypage1/mypage1_index";
		
	}
	
	
	
	@RequestMapping(value = "/mypage1_studyTime.do", method = RequestMethod.POST) 
	public String registerStudyTime(@RequestParam("studyTime") int studyTime ,
									@RequestParam("studyDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date studyDate, 
									HttpSession session, 
									Model model) {
		
		try {
			Member loginMember = (Member) session.getAttribute("loginUser");
			Studytime newStudytime = new Studytime();
			newStudytime.setMemberId(loginMember.getMemberId());
			newStudytime.setStudyTime(studyTime);
			newStudytime.setStudyDate(studyDate);
			
			studytimeService.insertStudyTime(newStudytime);
			
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return "redirect:/mypage1_index.do";
	}
	
	
	
}
