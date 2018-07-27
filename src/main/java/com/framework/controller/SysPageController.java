package com.framework.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.framework.utils.JSONUtil;
import com.framework.utils.UploadUtil;

/**
 * 系统页面视图
 */
@Controller
public class SysPageController {
	@RequestMapping("sys/{url}.html")
	public String page(@PathVariable("url") String url) {
		return "sys/" + url + ".html";
	}

	@RequestMapping("demo/{url}.html")
	public String demo(@PathVariable("url") String url) {
		return "demo/" + url + ".html";
	}

	@RequestMapping(value = "/uploadMultipleFile", method = RequestMethod.POST, produces = "application/json;charset=utf8")
	@ResponseBody
	public String uploadMultipleFileHandler(@RequestParam("file") MultipartFile[] files, HttpServletRequest request)
			throws IOException {
		return UploadUtil.uploadImage(request.getSession().getServletContext().getRealPath("/"), files);
	}

	// UploadUtil.java中uploadImage方法如下
	public static String uploadImage(String serverPath, MultipartFile[] files) {
		try {
			String uploadPath = serverPath + getImageRelativePath();
			String images = "{}";
			// 如果不存在目录,创建一个目录
			isDirectory(uploadPath);
			if (files != null && files.length > 0) {
				for (int i = 0; i < files.length; i++) {
					MultipartFile file = files[i];
					// save file
					if (!file.isEmpty()) {
						String savePath = getImageRelativePath() + file.getOriginalFilename();// 数据库保存的图片路径
						images = JSONUtil.addProperty(images, String.valueOf(i), savePath);
						save(file, uploadPath);
					}
				}
			}
			return images;
		} catch (Exception e) {
			e.printStackTrace();
			return "{}";
		}
	}

	private static void save(MultipartFile file, String uploadPath) {
		
	}

	private static void isDirectory(String uploadPath) {
		
	}

	private static String getImageRelativePath() {
		return null;
	}
}
