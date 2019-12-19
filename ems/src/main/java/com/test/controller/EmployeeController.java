/**
 * 
 */
package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.test.entity.Employee;
import com.test.service.EmployeeService;

/**
 * @author Kabir
 *
 */
@RestController
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/")
	ModelAndView getHome() {
		System.out.println("Inside getHome");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	/*@RequestMapping("/temp")
	ModelAndView getHome1() {
		System.out.println("Inside getHome");
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "Test msg");
		mav.setViewName("userHome");
		return mav;
	}*/
	
	@RequestMapping("/register")
	ModelAndView getRegisterPage() {
		System.out.println("Inside getHome");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("register");
		return mav;
	}
	
	@RequestMapping(value="/sample2")
	public String sample2(@RequestBody Employee employee) {
		return "Name:"+employee.getName()+",designation:"+employee.getDesignation()
		+",dateOfBirth:"+employee.getDateOfBirth()+",salary:"+employee.getSalary();
	}
	
	@RequestMapping(value="/login")
	ModelAndView loginPage1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value="registerEmployee", method = RequestMethod.POST,consumes ="application/json")
	boolean registerEmployee(@RequestBody Employee employee) {
		boolean res = employeeService.saveEmployee(employee);
		System.out.println("EmployeeData saved:"+res);
		return res;
	}
	
	@RequestMapping(value="/adminHome")
	ModelAndView adminHome() {
		ModelAndView mav = new ModelAndView();
		List<Employee> list = employeeService.getAllEmployeeData();
		System.out.println("list size:"+list.size());
		System.out.println("Dob 0:"+list.get(0).getDateOfBirth());
		mav.addObject("list",list);
		mav.setViewName("adminHome");
		return mav;
	}
	//For delete
	
	@RequestMapping(value="/deleteEmpData")
	String deleteEmployeeData(@RequestBody Employee employee){
		System.out.println("EmpId:"+employee.getId());
		String res = employeeService.deleteEmployeeData(employee);
		System.out.println("Res:"+res);
		return res;
	}
	
	@RequestMapping(value="/editEmployeeData")
	String updateEmployeeData(@RequestBody Employee employee){
		System.out.println("EmpId:"+employee.getId());
		String res = employeeService.updateEmployee(employee);
		System.out.println("Res:"+res);
		return res;
	}
	
	

}
