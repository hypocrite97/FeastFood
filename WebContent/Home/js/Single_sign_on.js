//Ajax请求session
		var xhr = false;
		function createXHR() {
			try {
				xhr = new XMLHttpRequest();
			} catch (e) {
				try {
					xhr = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e1) {
					xhr = false;
				}
			}
			if (!xhr)
				alert("初始化XMLHttpRequest对象失败！");
		}
		function ajax() {
			createXHR();
			var url = "/FoodStore/AjaxServlet";
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var responseData = xhr.responseText.split(",");
					var msg = responseData[0];
					if (msg == 'true1') {
						alert("此账号在异地登录，您被迫下线");
						window.location = '/FoodStore/Home/login.jsp';
					}
				}
			}
			xhr.open("GET", url, true);
			xhr.send(null);
		}
		window.onload = function() {
			setInterval(ajax, 3000);
		}