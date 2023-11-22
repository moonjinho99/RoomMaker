
package com.rm.controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller

@Log4j
public class DateController {

	@Autowired
	public SqlSession sqlSession;

	private static final Logger logger =
  LoggerFactory.getLogger(DateController.class);

	@RequestMapping(value="calendar.do",method=RequestMethod.GET)
  public String calendar(Model model,HttpServletRequest request,DateData dateData) {
		
		Calendar cal = Calendar.getInstance();
		DateData calendar;
		//검색 날짜
		if(dateData.get)
		
	}
  
  }
