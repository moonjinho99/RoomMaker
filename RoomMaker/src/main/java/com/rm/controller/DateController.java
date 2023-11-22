 
package com.rm.controller;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
  
  @Log4j public class DateController {
  
  @Autowired public SqlSession sqlSession;
  
  private static final Logger logger =
  LoggerFactory.getLogger(DateController.class);
  
  @RequestMapping(value="calendar.do",method=)
  
  }

img{
	width:100px;
	height:60px;
}