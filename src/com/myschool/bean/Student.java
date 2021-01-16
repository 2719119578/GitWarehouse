package com.myschool.bean;

import java.util.Date;

public class Student{
	private Integer id;
	private String name;
	private Integer gid;
	private Boolean sex;
	private Date birthday;
	private Grade grade;
	

	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public Student(){
		super();
	}
	public Student(Integer id,String name,Integer gid,Boolean sex,Date birthday) {
		super();
		this.id = id;
		this.name = name;
		this.gid = gid;
		this.sex = sex;
		this.birthday = birthday;

	}
	
	public Integer getId(){
		return id;
	}

	public void setId(Integer id){
		this.id = id;
	}
	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name = name;
	}
	public Integer getGid(){
		return gid;
	}

	public void setGid(Integer gid){
		this.gid = gid;
	}
	public Boolean getSex(){
		return sex;
	}

	public void setSex(Boolean sex){
		this.sex = sex;
	}
	public Date getBirthday(){
		return birthday;
	}

	public void setBirthday(Date birthday){
		this.birthday = birthday;
	}

}