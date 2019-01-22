package cn.edu.tit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.apache.http.entity.ContentType;
import org.junit.runner.Request;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.common.Common;
import cn.edu.tit.iservice.IAdminService;
import cn.edu.tit.iservice.ITeacherService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private IAdminService iAdminService;
	@Autowired
	private ITeacherService iTeacherService;


	/**
	 * 添加教师的方法  excel 相关的操作,将数据插入到数据库 
	 * 使用spring的MultipartFile上传文件
	 * */
	@RequestMapping(value="AddTeacher",method= {RequestMethod.POST})
	public ModelAndView DoExcelTeacher(HttpServletRequest request) throws Exception {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB
		List<FileItem> items = new ArrayList<FileItem>();
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		File file = new File("");
		for(FileItem fi : items) {
			File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题,获得文件内容
			file = new File("/home/wenruo/Desktop/userInfo", fullFile.getName()); // 为文件设置存储路径
			fi.write(file);
		}
		FileInputStream fileInputStream = new FileInputStream(file);
		MultipartFile multipartFile = new MockMultipartFile(file.getName(), file.getName(),
				ContentType.APPLICATION_OCTET_STREAM.toString(), fileInputStream);
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		try {
			//调用ITeacherService 下的方法，完成增加教师
			readResult = iAdminService.addTeacherInfo(multipartFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv = readTeacherInfo();
		mv.addObject("readResult", readResult);//返回信息
		return mv;
	}


	/**
	 * 增加学生操作，处理EXCEL表
	 * @throws Exception 
	 * */
	@RequestMapping(value="addStudent",method= {RequestMethod.POST})
	public ModelAndView DoExcelStudent(HttpServletRequest request) throws Exception {	
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB
		List<FileItem> items = new ArrayList<FileItem>();
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		File file = new File("");
		for(FileItem fi : items) {
			File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题,获得文件内容
			file = new File("/home/wenruo/Desktop/userInfo", fullFile.getName()); // 为文件设置存储路径
			fi.write(file);
		}
		FileInputStream fileInputStream = new FileInputStream(file);
		MultipartFile multipartFile = new MockMultipartFile(file.getName(), file.getName(),
				ContentType.APPLICATION_OCTET_STREAM.toString(), fileInputStream);
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		try {
			//调用ITeacherService 下的方法，完成增加教师
			readResult = iAdminService.addStudentInfo(multipartFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv = readStudentInfo();
		mv.addObject("readResult", readResult);//返回信息
		return mv;
	}

	/**
	 * 读取教师信息
	 * */
	@RequestMapping(value="readTeacherInfo",method= {RequestMethod.GET})
	public ModelAndView readTeacherInfo() {			
		ModelAndView mv = new ModelAndView();
		List<Teacher> readResult = new ArrayList<Teacher>();
		try {
			readResult = iAdminService.readTeacherInfo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("teacherList", readResult);//返回信息
		mv.setViewName("/jsp/AdminJsp/teacherManager");//设置返回页面
		return mv;
	}

	/**
	 * 读取学生信息
	 * */
	@RequestMapping(value="readStudentInfo",method= {RequestMethod.GET})
	public ModelAndView readStudentInfo() {			
		ModelAndView mv = new ModelAndView();
		List<Student> readResult = new ArrayList<Student>();
		try {
			readResult = iAdminService.readStudentInfo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("studentList", readResult);//返回信息
		mv.setViewName("/jsp/AdminJsp/studentManager");//设置返回页面
		return mv;
	}
	
	
	/**
	 * 添加分类
	 * */
	@RequestMapping(value="AddCategory",method= {RequestMethod.POST})
	public ModelAndView AddCategory(@RequestParam(value="categoryNum") String categoryNum,@RequestParam(value="categoryName") String categoryName,@RequestParam(value="categoryDetail") String categoryDetail) {			
		ModelAndView mv = new ModelAndView();
		String readResult = null;
		try {
			Category category = new Category();
			category.setCategoryDetail(categoryDetail);
			category.setCategoryName(categoryName);
			category.setCategoryNum(categoryNum);
			category.setCategoryId(categoryNum);
			System.out.println(category.toString());
			List<Category> categories = new ArrayList<Category>();
			categories.add(category);
			readResult = iAdminService.addCategory(categories);
			mv = readCategories();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("readResult", readResult);//返回信息
		mv.setViewName("/jsp/AdminJsp/categoryManager");//设置返回页面
		return mv;
	}

	/**
	 * 登陆管理员操作
	 * */
	@RequestMapping(value="LoginAdmin",method= {RequestMethod.GET})
	public ModelAndView LoginAdmin(@RequestParam(value="employeeNum") String adminUsername,@RequestParam(value="password") String adminPassword,HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		Admin admin = new Admin();
		try {
			admin = iAdminService.loginAdmin(adminUsername);
			String password=Common.eccryptMD5(adminPassword);
			if(password.equals(admin.getAdminPassword()))
			{	
				mv = readTeacherInfo();//登陆成功之后调用另一个函数,进入index页面
				request.getSession().setAttribute("admin", admin);//将amdin 放入session
			}
			else {
				readResult = "密码输入不正确";	
				mv.addObject("readResult", readResult);//返回信息
				mv.addObject("admin", admin);
				mv.setViewName("/jsp/AdminJsp/adminLogin");//设置返回页面
			}
		} catch (Exception e) {
			readResult = "账号输入不正确";
			mv.addObject("readResult", readResult);//返回信息
			mv.setViewName("/jsp/AdminJsp/adminLogin");//设置返回页面
			e.printStackTrace();
		}
		return mv;
	}


	/**
	 * 重置学生密码
	 * */
	@RequestMapping(value="resetStudentPassword/{studentId}",method= {RequestMethod.GET})
	public ModelAndView resetStudentPassword(@PathVariable String studentId) {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		try {
			readResult = iAdminService.resetStudentPassword(studentId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("resetStudentPasswordMsg", readResult);//返回信息
		mv = readStudentInfo();
		return mv;
	}


	/**
	 * 重置老师密码
	 * */
	@RequestMapping(value="resetTeacherPassword/{employeeNum}",method= {RequestMethod.GET})
	public ModelAndView resetTeacherPassword(@PathVariable String employeeNum) {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		try {
			readResult = iAdminService.resetTeacherPassword(employeeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("resetTeacherPasswordMsg", readResult);//返回信息
		mv = readTeacherInfo();
		return mv;
	}

	/**
	 * 增加系部信息
	 * */
	@RequestMapping(value="addCategories",method= {RequestMethod.POST})
	public ModelAndView addCategories() {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		mv.addObject("readResult", readResult);//返回信息
		mv.setViewName("/jsp/AdminJsp/departInformation");//设置返回页面
		return mv;
	}

	/**
	 * 读取系部信息
	 * */
	@RequestMapping(value="readCategories",method= {RequestMethod.GET})
	public ModelAndView readCategories() {			
		ModelAndView mv = new ModelAndView();
		List<Category> readResult = new ArrayList<Category>();
		try {
			readResult = iAdminService.readCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (Category category : readResult) {
			System.out.println(category.toString());
		}
		mv.addObject("categoryList", readResult);//返回信息
		mv.setViewName("/jsp/AdminJsp/categoryManager");//设置返回页面
		return mv;
	}


	/**
	 * 读取实体班级信息
	 * */
	@RequestMapping(value="readRealClass",method= {RequestMethod.GET})
	public ModelAndView readRealClass() {			
		ModelAndView mv = new ModelAndView();
		List<RealClass> readResult = new ArrayList<RealClass>();
		List<Category> categories = new ArrayList<Category>();
		try {
			readResult = iTeacherService.readRealClass(null);
			categories = iTeacherService.readCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (RealClass category : readResult) {
			System.out.println(category.toString());
		}
		mv.addObject("categories",categories);
		mv.addObject("realClassList", readResult);
		mv.setViewName("/jsp/AdminJsp/realClassManager");//设置返回页面
		return mv;
	}
	/**
	 * 增加实体班级信息
	 * */
	@RequestMapping(value="AddRealClass",method= {RequestMethod.GET})
	public ModelAndView AddRealClass( @RequestParam("realClassNum")String realClassNum,@RequestParam("category")String category,@RequestParam("realClassPersonNum")String realClassPersonNum,HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		RealClass realClass = new RealClass();
		realClass.setRealClassCategory(category);
		realClass.setRealClassNum(realClassNum);
		realClass.setRealPersonNum(Integer.parseInt(realClassPersonNum));
		List<RealClass> realCLassList = new ArrayList<RealClass>();
		realCLassList.add(realClass);
		try {
			iAdminService.addRealClass(realCLassList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv = readRealClass();
		return mv;
	}
	/**
	 * 学术管理页面
	 * */
	@RequestMapping(value="toAcademicManager",method= {RequestMethod.GET})
	public ModelAndView toAcademicManager() {			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/AdminJsp/academicManager");
		return mv;
	}
	
	/**
	 * 管理员个人信息
	 * */
	@RequestMapping(value="toAdminInfo",method= {RequestMethod.GET})
	public ModelAndView toAdminInfo(HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		mv.addObject("admin",admin);
		mv.setViewName("/jsp/AdminJsp/adminInfo");
		return mv;
	}
	/**
	 * 更新教师信息
	 * */
	@RequestMapping(value="updateTeacher",method= {RequestMethod.GET})
	public ModelAndView updateTeacher( @RequestParam("teacherId")String teacherId,@RequestParam("teacherName")String teacherName,@RequestParam("select")String select,HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		Teacher teacher = new Teacher();
		teacher.setEmployeeNum(teacherId);
		teacher.setTeacherName(teacherName);
		teacher.setTeacherGender(select);
		String updateMsg = null;
		List<Teacher> readResult = new ArrayList<Teacher>();
		try {
			readResult = iAdminService.readTeacherInfo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//查看是否修改的工号是已经存在的
		for (Teacher tc : readResult) {
			if(tc.getEmployeeNum() == teacherId)
				{
				updateMsg = "工号以存在，不可修改";
				mv.addObject("updateMsg",updateMsg);
				mv = readTeacherInfo();
				return mv;
				}
		}
		try {
			updateMsg = "更新成功";
			mv.addObject("updateMsg",updateMsg);
			mv = readTeacherInfo();
			iTeacherService.UpdateTeacher(teacher);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
