<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Future Imperfect by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../../resources/css/main.css" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	 <!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
	<!-- Scripts -->
	<script src="../../resources/js/jquery.min.js"></script>
	<script src="../../resources/js/browser.min.js"></script>
	<script src="../../resources/js/breakpoints.min.js"></script>
	<script src="../../resources/js/util.js"></script>
	<script src="../../resources/js/main.js"></script>
</head>
<style>
	.modal-dialog{	
	  top: 20%; 
	}
</style>
<body>
<c:if test="${ not empty errorMsg }">
		<script>
			alert("${errorMsg}");
		</script>
		<c:remove var="errorMsg" scope="session" />
	</c:if>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
</c:if>
		<!-- Header -->
			<header id="header">
				<h1><a href="#">Welcome to MyWorld</a></h1>
				<nav class="links">
					<ul>
						<li><a href="/noticeList.no">Notice</a></li>
						<li><a href="/mypage.hp">MyPage</a></li>
						<li><a href="/registerForm.lo">Register</a></li>
						<li><a href="/mylogin.lo">LogIn</a></li>
						<li><a href="/logout.lo">Logout</a></li>
					</ul>
				</nav>
				<nav class="main">
				
				</nav>
			</header>

		<!-- Menu -->
			<section id="menu">
				

				<!-- Links -->
					<section>
						<ul class="links">
							<li>
								<a href="#">
									<h3>Lorem ipsum</h3>
									<p>Feugiat tempus veroeros dolor</p>
								</a>
							</li>
							<li>
								<a href="#">
									<h3>Dolor sit amet</h3>
									<p>Sed vitae justo condimentum</p>
								</a>
							</li>
							<li>
								<a href="#">
									<h3>Feugiat veroeros</h3>
									<p>Phasellus sed ultricies mi congue</p>
								</a>
							</li>
							<li>
								<a href="#">
									<h3>Etiam sed consequat</h3>
									<p>Porta lectus amet ultricies</p>
								</a>
							</li>
						</ul>
					</section>

				<!-- Actions -->
					<section>
						<ul class="actions stacked">
							<li><a href="#" class="button large fit">Log In</a></li>
						</ul>
					</section>

				</section>
</body>
</html>