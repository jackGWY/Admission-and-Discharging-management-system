<%--
  Created by IntelliJ IDEA.
  User: 郑金鑫
  Date: 2018/1/1
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath }" scope="page" var="ctx"/>
<div class="check_head">
    <p>出院记录专项检查表</p>
</div>
<div class="check_body">
    <div class="container">
        <div class="row">
            <div class="col-sm-2">
                <p>检查标准</p>
            </div>
            <div class="col-sm-1">
                <div style="">
                    <p>科室</p>
                </div>
                <div style="">
                    <p>住院号</p>
                </div>
            </div>
            <div class="col-offset-sm-8 col-sm-1">
                <p>项目缺陷率</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>有出院记录小结</p>
            </div>
            <div class="col-sm-9"></div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>一般项目无缺陷</p>
            </div>
            <div class="col-sm-9"></div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>有入院主诉、入院诊断</p>
            </div>
            <div class="col-sm-9"></div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>有与诊断相关的重要辅助检查结果</p>
            </div>
            <div class="col-sm-9"></div>
        </div>
    </div>
</div>
<div class="tail">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <p>科室:</p>
            </div>
            <div class="col-sm-4">
                <p>检查者:</p>
            </div>
            <div class="col-sm-4">
                <p>检查时间:</p>
            </div>
        </div>
    </div>
</div>