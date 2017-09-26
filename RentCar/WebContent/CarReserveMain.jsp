<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 데이터 베이스에 연결하여 최신순 자동차 3대만 뿌려주는 데이터를 가져옴  -->
<%
	RentcarDAO rdao =new RentcarDAO();
    //벡터를 이용하여 자동차를 저장
    Vector<CarListBean> v =rdao.getSelectCar();

%>
    
