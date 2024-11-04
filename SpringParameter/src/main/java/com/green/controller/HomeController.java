package com.green.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.domain.DataVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class HomeController {

	// http://localhost:80
	@RequestMapping("/")
	public String home() {
		return "home";
		// return "/WEB-INF/views/home.jsp";
	}
	
	// /temp?a=hello&b=123
	//@RequestMapping("/temp")  // GET, POST
	//@RequestMapping(value="/temp", method=RequestMethod.GET )
	@GetMapping("/temp")
	public  String   temp(String a, int b) {
		System.out.println("a=" + a);
		System.out.println("b=" + (b+3) );
		return  "none";
	}
	
	// http://localhost/temp1?a=hello&b=123
	@RequestMapping("/temp1")
	public  String   temp1(
		HttpServletRequest   request,
		HttpServletResponse  response
			) {
		
		String  in_a  = request.getParameter("a");
		String  in_b  = request.getParameter("b");
		
		String  a     = in_a;
		int     b     = Integer.parseInt(in_b) + 4;
		System.out.println("a=" + a);
		System.out.println("b=" + b);
		
		return "none";
	}
	
	// http://localhost/temp2?a=hello&b=123
	@RequestMapping("/temp2")
	public  String  temp2(
		@RequestParam  Map<String, String> map) {
		
		System.out.println("map:" + map );
		String  a  =  map.get("a");
		int     b  =  Integer.parseInt( map.get("b") );
		System.out.println("a=" + a);
		System.out.println("b=" + (b+5) );
				
		return "none";		
	}
	
	// http://localhost/temp3?a=hello&b=123
	@RequestMapping("/temp3")
	public  String  temp2(
		@RequestParam("a") String v1,
		@RequestParam("b") int    v2 ) {
		
		System.out.println("a=" + v1);
		System.out.println("b=" + v2);
		
		return "none";
	}
	
	// http://localhost/temp4?a=hello&b=123
	@RequestMapping("temp4")
	public  String  temp4(  DataVo vo ) {
		System.out.println("a=" + vo.getA() );
		System.out.println("b=" + (vo.getB() + 10) );
		return  "none";
	}
	
	//--------------------------------------
	// 값을 넘겨 주는 방법 jsp 로
	// Model 객체를 사용 
	// jsp 에 넘겨줄 데이터를 Model 에 담아서 전달
	// /temp5?a=hello&b=123
	@RequestMapping("/temp5")
	public  String  temp5(
		String  a, int b, Model model ) {
		System.out.println("a=" + a);
		System.out.println("b=" + b);
		
		model.addAttribute("a", a);
		model.addAttribute("b", b);
		model.addAttribute("c", "이것도 넘어가나?");
		
		return "reqdata";
	} 
	
	// /temp6?a=hello&b=123
	@RequestMapping("/temp6")
	public  String  temp6(
		DataVo  vo,  Model  model ) {
		// 넘겨받은 data, DataVo  vo
		// Model : reqdata.jsp  에 넘겨줄 data 를 담고있는 객체
		
		System.out.println("a=" + vo.getA() );
		System.out.println("b=" + (vo.getB() + 100) );
		
		model.addAttribute("a", vo.getA() );
		model.addAttribute("b", vo.getB() );
		model.addAttribute("c", "이값도 넘어간다" );
		
		return "reqdata";
	}
	
	// /temp7?a=hello&b=123
	@RequestMapping("/temp7")
	public  String  temp7(
		@ModelAttribute("attrName")  DataVo  vo,
		Model                        model ) {
		
		System.out.println("a=" + vo.getA() );
		System.out.println("b=" + (vo.getB() + 100) );
		
		model.addAttribute("a", vo.getA() );
		model.addAttribute("b", vo.getB() );
		
		return "noneModel";
	}
	
	// --------------------------------
	// Path Variable : data 를  경로처럼 사용하기
	// /temp8/hello/123
	@RequestMapping("/temp8/{a}/{b}")
	public  String   temp8(
		@PathVariable("a")  String  a,
		@PathVariable("b")  int     b ) {
		// @PathVariable("a") 생략하면 에러
		
		System.out.println("a=" + a );
		System.out.println("b=" + b );
		
		return "none";
	}
	
	// /temp9/hello/123
	@RequestMapping("/temp9/{a}/{b}")
	public  String   temp9(
			DataVo vo ) {
		// @PathVariable 를 생략해도 된다
		
		System.out.println("a=" + vo.getA() );
		System.out.println("b=" + vo.getB() );
		
		return "none";
	}
	
	// /temp10/hello/123
	@RequestMapping("/temp10/{a}/{b}")
	public  String   temp10(
			@ModelAttribute("vo")   DataVo   vo,
			Model                            model) {
		
		System.out.println("a=" + vo.getA() );
		System.out.println("b=" + vo.getB() );
		
		return "noneModel";
	}
}














