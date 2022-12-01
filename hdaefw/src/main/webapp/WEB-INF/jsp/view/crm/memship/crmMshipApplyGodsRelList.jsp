 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 
 
 
 
 
              
  <div id="divGrid" style="height:520px"
	  data-post="Y"
	  data-grid-id="grdList"
	  data-pagenation="Y"
	  data-get-url="<c:url value='/crmMshipApplyGodsRel/getList'/>"
	  data-type="grid" 
	  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmMshipApplyGodsRel.xml'/>"
	  >
	</div>