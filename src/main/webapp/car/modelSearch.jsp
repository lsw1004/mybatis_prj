<%@page import="day1226.CarModelDomain"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="kr.co.sist.car.CarService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String maker = request.getParameter("maker");

//System.out.println(country);

CarService cs = CarService.getInstance();

JSONArray jsonArr = new JSONArray();
JSONObject jsonTemp = null;

List<CarModelDomain> carList = cs.searchModel(maker);
for(CarModelDomain cmDomain : carList){
	jsonTemp = new JSONObject();
	jsonTemp.put("model", cmDomain.getModel());
	jsonArr.add(jsonTemp);
}// end for

//System.out.println(jsonArr);

JSONObject jsonObj = new JSONObject();
jsonObj.put("data", jsonArr);
out.print(jsonObj.toJSONString());
%>