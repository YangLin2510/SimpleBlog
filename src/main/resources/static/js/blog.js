$(function(){
	$("#comment").keydown(function(){
		comment = $("#comment").val();
		commentlength = comment.length;
		if(200 - commentlength >= 0){
			$("#commentLimit").html(200 - commentlength);
		}else{
			$("#comment").val(comment.substring(0,200));
		}
	});
});