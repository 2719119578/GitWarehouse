<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		*{
			margin: 0px;
			padding: 0px;
		}
		table {
			margin: 0px auto;
			border-collapse: collapse;
			width: 800px;
			text-align: center;
		}
		tr {
			height: 50px;
		}
		tbody tr:nth-child(2n){
			background-color: pink;
		}
		tbody tr:nth-child(2n+1){
			background-color: lightblue;
		}
		.a{
			display: inline-block;
			height: 30px;
			width: 30px;
			background-color: #ccc;
			cursor: pointer;
			border-radius:50%;
			text-align: center;
			line-height: 30px;
		}
		.b{
			display: inline-block;
			height: 30px;
			width: 30px;
			background-color:orange;
			cursor: pointer;
			border-radius:50%;
			text-align: center;
			line-height: 30px;
		}
		
	</style>
  <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script></head>
 
  
  <body>
    <c:if test="${stulist==null}">
    	<c:redirect url="/stu/fy/1"></c:redirect>
    </c:if>
    <input type="text" id="txt"/>
    <input type="button" id="btn" value="显示"/>
    <span id="span"></span>
    <table>
    	<thead>
    		<tr style="background-color: ;">
    			<td>编号</td>
    			<td>姓名</td>
    			<td>班级</td>
    			<td>性别</td>
    			<td>出生日期</td>
    			<td>编辑</td>
    		</tr>
    	</thead>
    	<tbody>
		    <c:forEach items="${stulist.list}" var="s">
		    	<tr onmouseover="c=this.style.backgroundColor;this.style.backgroundColor='orange';"
	    		onmouseout="this.style.backgroundColor=c;">
	    			<td>${s.id}</td>
	    			<td>${s.name}</td>
	    			<td>${s.grade.name}</td>
	    			<td>${s.sex?"男":"女"}</td>
	    			<td>
	    				<fmt:formatDate value="${s.birthday}" pattern="yyyy-MM-dd"/>
	    			</td>
	    			<td><span onclick=a(this)>删除</span></td>
	    		</tr>
		    </c:forEach>
	    </tbody>
    </table>
    	第几页${stulist.pageIndex},总共有${stulist.totalPage}页
    <a onclick="return ${stulist.pageIndex>1}" href="stu/fy/${stulist.pageIndex-1}">上一页</a>
    <a onclick="return ${stulist.pageIndex<totalPage}" href="stu/fy/${stulist.pageIndex+1}">下一页</a>
    <c:forEach begin="1" end="${stulist.totalPage}" var="i">
    	<p onclick="location.href='stu/fy/${i}'" class="${stulist.pageIndex==i?'b':'a'}">${i}</p>
    </c:forEach>
    <script type="text/javascript">
    	$("#txt").keyup(function(){
    		$.ajax({
    			url:"stu/ajax",
    			type:"post",
    			data:{"name":$("#txt").val()},
    			success:function(data){
    			console.log($("#txt").val());
    			console.log(data);
    				if(data == "false"){
    					$("#span").html("用户名可用").css("color","#f0f");
    				}else{
    					$("#span").html("该用户已存在").css("color","#f00");
    				}
    			}
    		});
    	});
    	
    	$("#btn").click(function(){
    		$.ajax({
    			url:"stu/json",
    			type:"post",
    			success:function(data){
    				$.each(data,function(i,d){
    					console.log(d.name);
    				});
    			}
    		});
    	});
    </script>
  </body>
</html>
