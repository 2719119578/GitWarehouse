package com.myschool.dao;

import java.util.List;

import com.myschool.bean.Grade;

public interface GradeMapper {
    int insert(Grade record);
    int delete(Integer id);
	int update(Grade record);
    Grade selectByPrimaryKey(Integer id);
    List<Grade> findAll();
    int selectCount();
}