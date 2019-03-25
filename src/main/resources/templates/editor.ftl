<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Simple example - Editor.md examples</title>
        <link rel="stylesheet" href="/editormd/css/editormd.css" />
        <script src="/js/jquery.min.js"></script>
        <script src="/editormd/js/editormd.js"></script>
        <script type="text/javascript">
  		$(function() {
      		editormd("my-editormd", {//注意1：这里的就是上面的DIV的id属性值
         	 	width   : "90%",
          	 	height  : 640,
          	 	syncScrolling : "single",
          	 	path    : "/editormd/lib/",//注意2：你的路径
          	 	saveHTMLToTextarea : true,//注意3：这个配置，方便post提交表单
          	 	emoji	: true,
          	 	 /**上传图片相关配置如下*/
         		imageUpload : true,
         		imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
         		imageUploadURL : "uploadImg",//注意你后端的上传图片服务地址
         		/**期望返回格式
         		{
    				success : 0 | 1, //0表示上传失败;1表示上传成功
   					message : "提示的信息",
    				url     : "图片地址" //上传成功时才返回
				}
				**/
      		});
    	});
    	function saveTopic(){
    		var value=$("#my-editormd-markdown-doc").val();
    		$.ajax({ 
				     url: "saveTopic",
			         type: "POST", 
			         //dataType:'json',
			         data : {"value":value},//获取所有的菜单
			         success: function (data) {
			         	alert(data);
			         },
			         error : function (data) {
			           	//alert("网络异常");
			         }
			});
    	}
	</script>
    </head>
    <body>
    <div id="my-editormd" >
		<textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;"></textarea>
		<!-- 注意：name属性的值,经测试内容是一样的-->
		<!-- <textarea id="my-editormd-html-code" name="my-editormd-html-code" style="display:none;"></textarea>-->
	</div>
	<button onclick="saveTopic()">上传</button>
    </body>
</html>