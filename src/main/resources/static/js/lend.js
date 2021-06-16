function popup1(frm) {
		var url = "testpop.asp";
		var title = "testpop";
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=700, height=800, top=0,left=20";
		window.open("", title, status);
		frm.target = title;
		frm.action = "/admin/lend/rent";
		frm.method = "post";
		frm.submit();
	}
	
	function popup2(frm) {
		var url = "testpop.asp";
		var title = "testpop";
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=700, height=800, top=0,left=20";
		window.open("", title, status);
		frm.target = title;
		frm.action = "/admin/lend/return";
		frm.method = "post";
		frm.submit();
		}


