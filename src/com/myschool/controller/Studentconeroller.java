package com.myschool.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myschool.bean.Pages;
import com.myschool.bean.Student;
import com.myschool.dao.StudentMapper;

@Controller
@RequestMapping("/stu")
public class Studentconeroller {
	
	@Resource
	StudentMapper s;
	
	@RequestMapping("/stulist")
	public String list(Model m){
		m.addAttribute("stulist",s.findAll());
		return "index";
	}
	
	@RequestMapping("/ajax")
	public void ajax(String name,HttpServletResponse response) throws IOException{
		response.getWriter().print(s.count(name)>0);
	}
	
	@RequestMapping("/json")
	@ResponseBody
	public List<Student> json(){
		return s.findAll();
	}
	
	@RequestMapping("/fy/{pageIndex}")
	public String fy(@PathVariable("pageIndex")Integer pageIndex, Model m){
		int pageSize = 3;
		int totalCount = s.selectCount();
		//求总页数
		//int totalPage = (totalCount+pageSize-1)/pageSize;
		//m.addAttribute("stulist",s.selectlimit((pageIndex-1)*pageSize, pageSize));
		//m.addAttribute("pageIndex", pageIndex);
		//m.addAttribute("totalPage",totalPage);
		Pages<Student> p = new Pages<Student>(pageIndex, pageSize, totalCount, (totalCount+pageSize-1)/pageSize, s.selectlimit((pageIndex-1)*pageSize, pageSize));
		m.addAttribute("stulist", p);
 		return "index";
	}
}
