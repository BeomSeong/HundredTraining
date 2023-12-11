<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.Base64.Encoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%
	InputStream responseStream = request.getInputStream();
    Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
    
    JSONParser parser = new JSONParser();
    JSONObject jsonObject = (JSONObject) parser.parse(reader);
    responseStream.close();
%>

<script>
    // 토스페이먼츠 결제 성공 시 실행되는 코드
    if ("<%=jsonObject.get("status")%>".equals("SUCCESS")) {
        // 여기에 토스페이먼츠 결제 성공 시 실행할 코드 추가
        // 예를 들어, 구매 내역이 저장되는 myShop 페이지로 이동하는 코드를 추가할 수 있습니다.
        window.location.href = "/paging?pageName=myShop";
    }
</script>

<p>secret : <%= jsonObject.get("secret") %></p>
<p>status : <%= jsonObject.get("status") %></p>
<p>orderId : <%= jsonObject.get("orderId") %></p>