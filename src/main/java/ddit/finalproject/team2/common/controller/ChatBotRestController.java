package ddit.finalproject.team2.common.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ddit.finalproject.team2.common.service.KJE_IChatBotService;
import ddit.finalproject.team2.vo.KJE_ChatBotScheduleResponseVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;

@Controller
public class ChatBotRestController {
	
	@Inject
	KJE_IChatBotService chatBotService;

	@ResponseBody
	@RequestMapping(value="/chatBotSchedule", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	List<KJE_ChatBotScheduleResponseVo> getScheduleResponse(
			@RequestParam (required =false)String target,
			Authentication authentication){
		
		Map<String, String> semester = new HashedMap();
		String openseme_year = "2019" ;//이번학기 어떻게 파악?? 아직 해결 안됨..
		String openseme_semester ="1";
		
		semester.put("openseme_year",openseme_year);
		semester.put("openseme_semester",openseme_semester);
		semester.put("target", target);
		semester.put("user_id", authentication.getName());
		
		List<KJE_ChatBotScheduleResponseVo> scheduleResponseList = new ArrayList<>();
		scheduleResponseList  = chatBotService.getOpenSemester(semester);
		
		return scheduleResponseList;
	}
	
	
}
