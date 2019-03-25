<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Simple example - Editor.md examples</title>
        <link rel="stylesheet" href="/editormd/css/editormd.min.css"/>
		<link rel="stylesheet" href="/editormd/css/editormd.preview.css" />
		<script src="/js/jquery.min.js"/>"></script>
		<script src="/editormd/lib/marked.min.js"/>"></script>
		<script src="/editormd/lib/prettify.min.js"/>"></script>
 		<script src="/editormd/js/editormd.js"/>"></script>
        <script type="text/javascript">
      		$(function(){
                editormd.markdownToHTML("content",{
                	//content"为包裹显示内容的div的id值如下
                 	htmlDecode: "style,script,iframe",
            		emoji: true,
            		taskList: true,
            		codeFold: true
            	});
            	$("#content textarea").show();
    		});
	</script>
    </head>
    <body>
   		<div id="content">
    		<textarea style="display:none;">${value}</textarea>
		</div>
    </body>
</html>