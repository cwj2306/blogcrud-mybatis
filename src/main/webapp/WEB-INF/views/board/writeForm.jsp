<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>


<%@ include file="../include/header.jsp"%>


	<section class="s-content s-content--narrow s-content--no-padding-bottom">

		<form class="row contact_form" action="/write" method="post" id="contactForm" novalidate="novalidate">
		
			<div class="col-md-12">
				<div class="form-group">
					<input type="text" class="form-control" id="title" name="title" placeholder="Title">
				</div>
			</div>
			
			<div class="col-md-12">
				<div class="form-group">
					<textarea class="form-control" id="summernote" name="content"></textarea>
				</div>
			</div>
			
			<div class="col-md-12 text-right">
				<button type="submit" value="submit" class="btn submit_btn">Posting</button>
			</div>
			
		</form>
				
	</section>
	
	<script>
		$('#summernote').summernote({
			placeholder : '글을 입력하세요.',
			tabsize : 2,
			height : 300
		});
	</script>



<%@ include file="../include/footer.jsp"%>

</html>