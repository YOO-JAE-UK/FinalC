package com.naver.myhome;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.domain.AttendCheckMember;
import com.naver.myhome.service.EventService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping(value = "/event")
public class EventController {

	@Autowired
	private EventService eventservice;

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);

	@RequestMapping(value = "/attendCheck")
	// @RequestMapping(value="/wrtie",method=RequestMethod.GET)
	public String attendCheck() {
		return "event/attend_check";
	}

	@ResponseBody
	@RequestMapping(value = "/attendAdd", method = RequestMethod.POST)
	public Map<String, Integer> attendAdd(@RequestParam("id") String id) {

		Map<String, Integer> map = new HashMap<String, Integer>();

		int result = eventservice.add(id);
		if (result == 1) {
			map.put("result", result);

		} else {
			logger.info("attendAdd 실패했습니다.");
		}
		return map;

	}

	@ResponseBody
	@RequestMapping(value = "/attendList", method = RequestMethod.POST)
	public List<AttendCheckMember> attendList(@RequestParam("id") String id) {

		List<AttendCheckMember> list = new ArrayList<>();

		list = eventservice.getList(id);

		logger.info("12");
		return list;

	}

	@ResponseBody
	@RequestMapping(value = "/isCheck", method = RequestMethod.POST)
	public HashMap<String, Object> isCheck(@RequestParam("id") String id) {

		Date today = new Date();
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		String attenddate = (String) format.format(today);

		logger.info("attend:" + attenddate);
		AttendCheckMember member = eventservice.isCheck(id, attenddate);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		return map;

	}

	@ResponseBody
	@RequestMapping(value = "/attendCount", method = RequestMethod.POST)
	public HashMap<String, Integer> attendCount(@RequestParam("id") String id, @RequestParam("year") String year,
			@RequestParam("month") String month) {
		if (Integer.parseInt(month) < 10) {
			month = "0" + month;
		}

		String date = year + "-" + month;
		logger.info("yearMonth:" + date);

		int count = eventservice.attendCount(id, date);

		logger.info("count:" + count);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("count", count);
		return map;

	}

	// roulette

	@RequestMapping(value = "/roulette")
	// @RequestMapping(value="/wrtie",method=RequestMethod.GET)
	public String rouletteGame(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");

		int point = eventservice.getPoint(id);
		logger.info("컨트롤러 point=" + point);
		model.addAttribute("point", point);

		return "event/roulette";

	}

	@ResponseBody
	@RequestMapping(value = "/getRandomNum", method = RequestMethod.POST)
	public HashMap<String, Object> getRandomNum(@RequestParam("id") String id, @RequestParam("point") int rpoint) {

		int num = 0;
		int point = 0;
		int messagePoint = 0;
		num = (int) (Math.random() * 100 + 1);
		if (num > 5 && num <= 34) {
			num = 1;
			point = rpoint + 10;
			messagePoint = 10;
		} else if (num > 49 && num <= 64) {
			num = 2;
			point = rpoint + 20;
			messagePoint = 20;
		} else if (num > 64 && num <= 79) {
			num = 3;
			point = rpoint + 30;
			messagePoint = 30;
		} else if (num > 79 && num <= 90) {
			num = 4;
			point = rpoint + 50;
			messagePoint = 50;
		} else if (num > 90 && num <= 95) {
			num = 5;
			point = rpoint + 80;
			messagePoint = 80;
		} else if (num > 34 && num <= 49) {
			num = 6;
			point = rpoint + 15;
			messagePoint = 15;
		} else if (num > 0 && num <= 5) {
			num = 7;
			point = rpoint;
		} else if (num > 95 && num < 101) {
			num = 8;
			point = rpoint + 100;
			messagePoint = 100;
		}
		int a = eventservice.addPoint(id, point);
		logger.info("addPoint=" + a);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rnum", num);
		map.put("messagePoint", messagePoint);
		map.put("point", point);
		return map;

	}
}
