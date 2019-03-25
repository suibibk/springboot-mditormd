package cn.myforever.springboot.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class EditorMD {
	@RequestMapping("/editor")
	public String editor() {
		return "editor";
	}
	
	@RequestMapping("/show")
	public String show(HttpServletRequest request) {
		String value = (String) request.getSession().getAttribute("value");
		request.setAttribute("value", value);
		return "show";
	}
	
	@RequestMapping("/saveTopic")
	@ResponseBody
	public String saveTopic(HttpServletRequest request) {
		String value = request.getParameter("value");
		System.out.println("value:"+value);
		request.getSession().setAttribute("value", value);
		return "success";
	}
	
	@RequestMapping("/uploadImg")
	@ResponseBody
	public Map<String,Object> uploadImg(@RequestParam(value = "editormd-image-file", required = true) MultipartFile file, HttpServletRequest request) {
		String trueFileName = file.getOriginalFilename();  

        String suffix = trueFileName.substring(trueFileName.lastIndexOf("."));

        String fileName = System.currentTimeMillis()+suffix;  

        String path = "E:/upload/";
        System.out.println(path);  
        System.out.println(fileName);
        File targetFile = new File(path, fileName);  
       //保存  
        try {  
           file.transferTo(targetFile);  
        } catch (Exception e) {  
           e.printStackTrace();  
        }  
        
		Map<String,Object> map =new HashMap<>();
		map.put("success", 1);
		map.put("message", "上传成功");
		map.put("url", "http://localhost/image/loading.gif");
		return map;
	}
	public static void main(String[] args) {
		System.out.println(System.getProperty("user.dir"));
	}
}
