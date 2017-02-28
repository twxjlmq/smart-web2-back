<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link href="${ctx}/plugins/form/css/form.css" rel="stylesheet" />
<link href="${ctx}/plugins/flow/css/flow.css" rel="stylesheet" />
<script src="${ctx}/plugins/flow/js/flow.form.js" type="text/javascript"></script>
<div class="wrap-content m-n5">
   <div class="flow-form-contents">
       <div class="panel-tabs-wrap">
			<div class="panel-heading p-0">
				<div class="panel-tabs-tab">
					<ul class="nav nav-tabs ui-state-default" role="tablist">
						<li class="active"><a href="#process-form-tab" role="presentation" data-toggle="tab"> 表单信息</a></li>
						<c:if test="${isAtt==1 }">
						  <li><a href="#process-att-tab" id="process-att-tab-a" role="presentation" data-toggle="tab"> 附件</a></li>
						</c:if>
						<li><a href="#process-record-tab" role="presentation" data-toggle="tab"> 流转记录</a></li>
					</ul>
				</div>
			</div>
			<div class="panel-body p-0">
				<div id="flow-form-panel-contents" class="tab-content panel-tab-content bg-color-white">
					<div role="tabpanel" class="tab-pane active" id="process-form-tab">
					    <c:if test="${isPrint==1 }">
					        <div class="pull-right">
					    	  <button class="btn btn-default btn-sm cnoj-print" data-target="#process-handle-form"><i class="fa fa-print" aria-hidden="true"></i> 打印</button>
					    	</div>
					    </c:if>
						<div class="form-prop view-form-prop">
					       <form id="process-handle-form" method="post">
					           ${smartResp.data.parseHtml}
					       </form>
					   </div>
					</div>
					<c:if test="${isAtt==1 }">
				    <div role="tabpanel" class="tab-pane" id="process-att-tab">
						<div class="cnoj-load-url" data-uri="process/attachment/list?processId=${processId}&orderId=${orderId}&taskId=${taskId}&taskKey=${taskKey}&formId=${formId }&isAtt=${isAtt}&isView=1" ></div>
					</div>
					</c:if>
					<div role="tabpanel" class="tab-pane" id="process-record-tab">
						<div class="cnoj-load-url" data-uri="process/processHandleInfo?orderId=${orderId }" ></div>
					</div>
				</div>
			</div>
	  </div><!-- panel-tabs-wrap -->
   </div>
</div>
<script type="text/javascript">
  $(function(){
	  $("#process-handle-form").flowForm({
	    	formFieldNames:'${taskModel.formPropIds}',
	    	formData:'${output}'
	    });
	   var mainContentH = $(window).height() - 70;
	   var flowFormContentH = mainContentH - 40 - 35;
	   $("#flow-form-panel-contents").height(flowFormContentH);
  });
</script>