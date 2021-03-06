package com.ling.web.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ling.entity.Doctor;
import com.ling.service.IDoctorService;

@Controller
@RequestMapping("doctor")
public class DoctorController {
	
	@Autowired
	private IDoctorService iDoctorService;
	
//	@ResponseBody
//	@RequestMapping(value="medicalstaff_updateById", produces="application/json;charset=UTF-8")
	
	@RequestMapping("doctor")
	public ModelAndView doctor(){//信息维护---病人信息维护-----进入加载数据		
		ModelAndView mv=new ModelAndView("/system/doctor");
		mv.addObject("doctor", iDoctorService.selectAll());
		mv.addObject("title", iDoctorService.title());
		mv.addObject("department", iDoctorService.department());
		return mv;
	}	
	
	@RequestMapping("select")
	public ModelAndView select(int titleID,int departmentID){//信息维护---病人信息维护-----查询
		ModelAndView mv=new ModelAndView("/system/doctor");		
		mv.addObject("doctor", iDoctorService.select(titleID,departmentID));
		mv.addObject("title", iDoctorService.title());
		mv.addObject("department", iDoctorService.department());
		mv.addObject("titleID", titleID);
		mv.addObject("departmentID", departmentID);
		return mv;		
	}
	
	@RequestMapping("toaddupdate")
	public ModelAndView toAdd_Update(int doctorID){//信息维护---病人信息维护-----新增修改页面		
		ModelAndView mv=new ModelAndView("/system/doctor_in_up");
		mv.addObject("title", iDoctorService.title());
		mv.addObject("department", iDoctorService.department());
		mv.addObject("treatmentGroup", iDoctorService.treatmentGroup());
		mv.addObject("medicalStaff", iDoctorService.medicalStaff());
		if(doctorID == -1){
			mv.addObject("tibiao", "新增用户");
		}else{
			mv.addObject("tibiao", "修改用户");
			mv.addObject("vo", iDoctorService.selectById(doctorID));
		}
		return mv;
	}
	
	@RequestMapping("insertOrUpdate")
	public ModelAndView insert(Doctor vo){//信息维护---病人信息维护-----新增或修改
		iDoctorService.insertOrUpdateSelective(vo);
		ModelAndView mv=doctor();
		return mv;	
	}
	
	@RequestMapping("delete")
	public ModelAndView delete(Doctor doctor){//信息维护---病人信息维护-----删除	
		doctor.setEffectiveNot(0);		
		iDoctorService.updateSelectiveById(doctor);
		ModelAndView mv=doctor();
		return mv;
	}

	@RequestMapping("doctor_team")
	public ModelAndView doctorTeam(){//医生诊疗组
		ModelAndView mv=new ModelAndView("/doctor/doctor_team");
		return mv;
	}

	@RequestMapping("department_management")
	public ModelAndView departmentManagement(){//医生诊疗组
		ModelAndView mv=new ModelAndView("/doctor/department_management");
		return mv;
	}
}
