<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>


<section class="s-content s-content--narrow s-content--no-padding-bottom">

	<article class="row format-standard">

		<div class="s-content__header col-full">
			<h1 class="s-content__header-title">${board.title}</h1>
			<ul class="s-content__header-meta">
				<li class="date">${board.createDate}</li>
			</ul>
		</div>
		<!-- end s-content__header -->

		<div>
			<img src="/images/userprofile/${board.userProfile}" alt="" style="width: 6.6rem; height: 6.6rem; border-radius: 50%;">
			<h4 style="margin: 0rem">${board.username}</h4>
			
			<div class="s-extra" style="background-color: transparent; padding: 0rem;">
				<div class="tagcloud">
					<c:if test="${board.userId eq sessionScope.user.id}">
						<a href="/delete/${board.id}">Delete</a>
						<a href="/updateForm/${board.id}">Update</a>
					</c:if>
				</div>
			</div>
			
		</div>


		<div class="col-full s-content__main">

			<div class="lead">${board.content}</div>

		</div>
		<!-- end s-content__main -->

	</article>


</section>
<!-- s-content -->


<%@ include file="../include/footer.jsp"%>

</html>