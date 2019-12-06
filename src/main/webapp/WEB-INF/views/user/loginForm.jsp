<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>

<section class="s-content s-content--narrow">

	<div class="row">
	
		<form action="/user/login" method="post" style="width: 400px; margin-left: 30%;">
		
			<input type="text" id="username" name="username" placeholder="ID" class="full-width">
								
			<input type="password" id="password" name="password" placeholder="PassWord" class="full-width">
			
			<label><input type="checkbox" name="rememberMe" />	Remember me</label> <br/>
	
			<button type="submit" value="submit" style="float: right;">Login</button>
		</form>
	
	</div>
	
</section>
	
<%@ include file="../include/footer.jsp"%>
</html>