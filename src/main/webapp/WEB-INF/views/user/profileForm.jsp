<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>

<section class="s-content s-content--narrow">

   <div class="row">
      <div class="col-full s-content__main">
         <h3>Profile</h3>
         <form action="/user/profileUpload" method="POST" enctype="multipart/form-data">
            <input type="file" name="userProfile" /><br />
            <input type="submit" value="전송" />
         </form>

         <!-- end form -->


      </div>
      <!-- end s-content__main -->

   </div>
   <!-- end row -->

</section>
<!-- s-content -->

 <%@ include file="../include/footer.jsp"%>
 
</html>
