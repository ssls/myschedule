<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/header.inc" %>
<%@ include file="/WEB-INF/views/job/submenu.inc" %>

<h1>Scheduled Jobs</h1>

<p id="info">${ fn:length(data.jobs) } jobs found.</p>

<table class="simple">
	<tr>
		<td> X </td>
		<td> JOB_NAME </td>
		<td> TRIGGER_NAME </td>
		<td> NEXT FIRE TIME </td>
		<td> More ...</td>
	</tr>
	<c:forEach items="${ data.jobs }" var="job">
	<tr>
		<c:choose>
		<c:when test="${ not empty job.trigger }">
		<td>
			<a href="${ actionPath }/job/delete?name=${ job.trigger.name }&group=${ job.trigger.group }&type=trigger">Delete</a>
		</td>
		<td> ${ job.jobDetail.fullName } </td>
		<td> ${ job.trigger.fullName } </td>
		<td> ${ job.trigger.nextFireTime } </td>
		<td>
			<a href="${ actionPath }/job/details?type=trigger&name=${ job.trigger.name }&group=${ job.trigger.group }&fireTimesCount=20">More Details</a>
		</td>
		</c:when>
		<c:otherwise>
		<td>
			<a href="${ actionPath }/job/delete?name=${ job.jobDetail.name }&group=${ job.jobDetail.group }&type=job">Delete</a>
		</td>
		<td> ${ job.jobDetail.fullName } </td>
		<td> No Trigger Assigned.</td>
		<td> N/A </td>
		<td>
			<a href="${ actionPath }/job/details?type=job&name=${ job.trigger.name }&group=${ job.trigger.group }">More Details</a>
		</td>
		</c:otherwise>
		</c:choose>
	</tr>
	</c:forEach>
</table>

<%@ include file="/WEB-INF/views/footer.inc" %>