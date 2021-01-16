package com.myschool.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myschool.bean.Student;

public interface StudentMapper {
    int insert(Student record);
    int delete(Integer id);
	int update(Student record);
    Student selectByPrimaryKey(Integer id);
    List<Student> findAll();
    int selectCount();
    int count(@Param("name")String name);
    List<Student> selectlimit(@Param("form")Integer form,@Param("pageSize")Integer pageSize);
}