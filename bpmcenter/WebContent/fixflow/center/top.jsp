<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="header">
    <div class="top-right">
        <ul>
        <li><a id="updateCache" href="#">更新缓存</a></li>
        <li><a id="setAgent" href="#">委托授权</a></li>
        <li><a href="#" onclick="updateMyself();">${sessionScope.LOGIN_USER_NAME}</a></li>
        <li><a href="LoginServlet?doLogOut=true">退出</a></li>
        <li><a href="FlowManager?action=processDefinitionList" target='_blank'>管控中心</a></li>
        <li><a href="#" id="red" name="theme_color" style="background-color: #dc562e;display: block;width:10px;height:10px;margin-top:5px;border:1px solid #404040"></a></li>
        <li><a href="#" id="blue" name="theme_color" style="background-color: #10a7d9;display: block;width:10px;height:10px;margin-top:4px;border:1px solid #404040"></a></li>
        </ul>
    </div>
    <div class="menu">
        <div class="logo"></div>
        <ul>
        <li><a id="getMyProcess" href="FlowCenter?action=getMyProcess"><h1>发起流程</h1><h4>start flow</h4></a></li>
        <li><a id="getMyTask" href="FlowCenter?action=getMyTask"><h1>待办任务</h1><h4>to do task</h4></a></li>
        <li><a id="getAllProcess" href="FlowCenter?action=getAllProcess"><h1>流程追踪</h1><h4>flow query</h4></a></li>
        <li><a id="getPlaceOnFile" href="FlowCenter?action=getPlaceOnFile"><h1>归档流程</h1><h4>archiving flow</h4></a></li>
        </ul>
    </div>
</div>
<script>
 
	$(function(){
		var color = window.localStorage.getItem("color");
		if(color){
			var url = $("#color").attr("href");
			url=url.substring(0,url.lastIndexOf("_")+1);
			url+=color+".css";
			$("#color").attr("href",url);
		}else{
			var url = $("#color").attr("href");
			url=url.substring(0,url.lastIndexOf("_")+1);
			url+="red.css";
			$("#color").attr("href",url);
		}
		$("#"+color).css("border","1px solid #fff");
		$("#updateCache").click(function(){ 
			$.get("FlowManager?action=updateCache",function(msg){
				alert(msg);
			})
		});
		
		$("#setAgent").click(function(){
			var url = "FlowCenter?action=viewDelegation";
			Fix.OpenMethod.openWindow(url);
		});
		
		$("#red").click(function(){
			var url = $("#color").attr("href");
			url=url.substring(0,url.lastIndexOf("_")+1);
			url+="red.css";
			$("#color").attr("href",url);
			window.localStorage.setItem("color","red");
			$("a[name=theme_color]").css("border","1px solid #404040");
			$(this).css("border","1px solid #fff");
			return false;
		});
		$("#blue").click(function(){
			var url = $("#color").attr("href");
			url=url.substring(0,url.lastIndexOf("_")+1);
			url+="blue.css";
			$("#color").attr("href",url);
			window.localStorage.setItem("color","blue");
			$("a[name=theme_color]").css("border","1px solid #404040");
			$(this).css("border","1px solid #fff");
			return false;
		});
	})

	chooseSelect();
	function updateMyself(){
		var obj = {};
		window.open("FlowCenter?action=getUserInfo&isUpdate=true");
	}
	
	function chooseSelect(){
		var now = '${nowAction}';
		$("#"+now).addClass("select");
	}
</script>
