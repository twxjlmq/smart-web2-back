<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="./common-header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<!-- EasyUI 插件-->
	<link href="${pageContext.request.contextPath}/plugins/easyui/themes/default/panel.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/plugins/easyui/themes/default/tabs.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/easyui-bootstrap.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/plugins/easyui/plugins/jquery.parser.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/plugins/easyui/plugins/jquery.resizable.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/plugins/easyui/plugins/jquery.panel.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/plugins/easyui/plugins/jquery.linkbutton.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/plugins/easyui/plugins/jquery.tabs.js" type="text/javascript"></script>
	
	<!-- 封装 bootstrap 弹出对话框 -->  
	<link href="${pageContext.request.contextPath}/css/bootstrap-dialog.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/js/bootstrap-dialog.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap-dialog-util.js" type="text/javascript"></script>
	  
	 <!-- 日期插件  -->
    <link href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8" type="text/javascript" ></script>
	<!-- 上传文件插件 --> 
	<link href="${pageContext.request.contextPath}/plugins/jqueryFileUpload/css/jquery.fileupload.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/plugins/jqueryFileUpload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
	<script src="${pageContext.request.contextPath}/plugins/jqueryFileUpload/js/vendor/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jqueryFileUpload/js/jquery.iframe-transport.js" type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath}/plugins/jqueryFileUpload/js/jquery.fileupload.js" type="text/javascript" ></script>
	
	<!-- 打印 -->
	<link href="${pageContext.request.contextPath}/plugins/printArea/css/jquery.printarea.css" rel="stylesheet"/>
	<script src="${pageContext.request.contextPath}/plugins/printArea/js/jquery.printarea.js" type="text/javascript" ></script>
	
   <!--[if lt IE 9]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/bootstrap/js/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/bootstrap/js/respond.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/jquery-ui-bootstrap/css/custom-theme/jquery.ui.1.10.0.ie.css"/>
    <![endif]-->
    
    <!--[if (gte IE 8)&(lt IE 10)]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jqueryFileUpload/js/cors/jquery.xdr-transport.js"></script>
	<![endif]-->
	
	<!--[if IE 7]>
       <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jquery-ui-bootstrap/assets/css/font-awesome-ie7.min.css">
    <![endif]-->
    
    <!--[if lte IE 6]>
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap-ie6.css">
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/bootstrap/css/ie.css">
      <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap-ie.js"></script>
     <![endif]-->
</head>
  <body>
   <div class="header">
      <div class="navbar-brand p-l-10">
        <div class="p-t-2"><a href="index"><img class="logo-img" height="40" width="40" alt="logo" src="${pageContext.request.contextPath}/images/logo.png" /> ${project.name }</a>
          <span class="header-version version">
          <a class="cnoj-open-blank" data-title="${version.version}更新信息" data-uri="version/view?id=${version.id}" data-width="600" href="javascript:void(0)">${version.version }</a>
          </span>
        </div>
      </div>
      <div class="navbar-left">
        <div class="header-info-row line-ell text-center">
	      	<div class="row">
	      		<div class="col-sm-5">
	      		  <div class="user-info">
	      		  	<i class="fa fa-user fa-lg"></i> &nbsp;<strong>${userInfo.fullName}</strong> &nbsp;
		         <c:if test="${userInfo.deptName != null && userInfo.deptName != ''}"><span title="${userInfo.deptName }">【${userInfo.deptName }】</span></c:if>
	      		  </div>
	      		</div>
	      		<div class="col-sm-5 center-text show-calendar">
	      			<div class="text-bold"><i class="fa fa-calendar fa-lg"></i> &nbsp;<span id="show-date"></span></div>
	      		</div>
	      	</div>
      	</div>
      </div>
      <div class="navbar-nar-right p-t-5"  >
          <ul class="navbar-menu" >
            <li>
                <a href="index"><span class="glyphicon glyphicon-home"></span> 首页</a>
            </li>
             <c:if test="${not empty subSysList }">
             	<c:choose>
             		<c:when test="${fn:length(subSysList) == 1}">
             		   <c:forEach var="subSys" items="${subSysList }">
             		   	   <li><a href="${subSys.url }" target="__blank">
             		   	   <c:if test="${ not empty subSys.icon }">
             		   	   <i class="${subSys.icon }" aria-hidden="true"></i>
             		   	   </c:if>
             		   	   &nbsp;${subSys.name }</a></li>
             		   </c:forEach>
             		</c:when>
             		<c:otherwise>
             			<li class="dropdown">
             				<a href="#" id="switch_system" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    进入其他系统
							  <span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="switch_system">
							    <c:forEach var="subSys" items="${subSysList }" varStatus="st">
							        <c:if test="${st.index > 0 }">
							        	<li role="presentation" class="divider"></li>
							        </c:if>
							    	<li><a href="${subSys.url }" target="__blank">
							    	<c:if test="${ not empty subSys.icon }">
			             		   	   <i class="${subSys.icon }" aria-hidden="true"></i>
			             		   	   </c:if>
			             		   	    ${subSys.name }
							    	</a></li>
							    </c:forEach>
							</ul>
             			</li>
             		</c:otherwise>
             	</c:choose>
             </c:if>
             <li>
               <a href="#" class="cnoj-open-blank" data-uri="showPage/base_user_changePwd" data-title="修改密码" data-width="520"><i class="fa fa-pencil-square-o fa-lg"></i>&nbsp;修改密码</a>
             </li>
             <li>
               <a href="user/logout"><i class="icon icon-logout"></i>安全退出</a>
             </li>
          </ul>
      </div>  
   </div><!-- header -->
<div class="wrap-main p-t-3">
	 <script type="text/javascript">
	 $(document).ready(function(){
		 autoHeaderWidth();
		 $(window).resize(function(){
			 autoHeaderWidth(); 
		 });
		 $("#show-date").cnojCalendar({
			 isShowHMS:false
			 /*showHTag:"#show-hours",
			 showMTag:"#show-minute",
			 showSTag:"#show-seconds-twinkle"*/
		 });
	 });
	 
	 function autoHeaderWidth() {
		 var w = $(window).width();
		 var infoW = $(window).width()-$(".navbar-nar-right").outerWidth(true) - $(".navbar-brand").outerWidth(true) - 20;
		 $(".header-info-row").width(infoW);
		 if(infoW <500) {
			 $(".show-calendar").hide();
		 }
		 if(w<820) {
			 $(".header-info-row").hide();
		 }
	 }
</script>