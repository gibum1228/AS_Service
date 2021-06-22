package com.as.controller;

import java.security.Principal;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.as.dto.Inquiry;
import com.as.dto.Member;
import com.as.dto.Sequence;
import com.as.mapper.InquiryMapper;
import com.as.mapper.MemberMapper;




@Controller
public class InquiryController {

	@Autowired InquiryMapper inquiryMapper;
	@Autowired MemberMapper memberMapper;

	/*문의사항 글쓰기 컨트롤러*/
    @GetMapping("user/inquiry/inquiry")
    public String inquiry_front(Model model) {

        return "user/inquiry/inquiry";
    }

    @PostMapping("user/inquiry/inquiry")
    public String inquiry_front(Model model, Principal principal, String title, String body, int type) {
    	Inquiry inquiry = new Inquiry();

    	inquiry.setSnum(principal.getName());
    	inquiry.setTitle(title);
    	inquiry.setBody(body);
    	inquiry.setViews(0);
    	inquiry.setType(type);
    	inquiry.setState(0);
    	inquiry.setAnswer("");

    	inquiryMapper.insertInquiry(inquiry);

        return "redirect:inquiry_list_front";
    }

    /*문의사항 모아보기 컨트롤러(admin)*/
    @GetMapping("admin/inquiry/inquiry_list")
    public String inquiry_list_admin(Model model) {

    	List<Inquiry> list = inquiryMapper.findAll();
    	Collections.sort(list);

    	model.addAttribute("inquiry_list", list);


        return "admin/inquiry/inquiry_list";
    }

    @PostMapping("admin/inquiry/inquiry_list")
    public String inquiry_list_admin(Model model, int select_value) {

    	if(select_value == 2) {
    		List<Inquiry> list = inquiryMapper.findAll();
        	Collections.sort(list);

        	model.addAttribute("inquiry_list", list);
        	model.addAttribute("select_value", select_value);
    	}
    	else {
    		List<Inquiry> list = inquiryMapper.findByState(select_value);
        	Collections.sort(list);

        	model.addAttribute("inquiry_list", list);
        	model.addAttribute("select_value", select_value);
    	}



        return "admin/inquiry/inquiry_list";
    }

    /*문의사항 모아보기 컨트롤러(front)*/
    @GetMapping("user/inquiry/inquiry_list_front")
    public String inquiry_list_front(Model model, Principal principal) {
    	Member student = memberMapper.findMember(principal.getName());

    	List<Inquiry> list = inquiryMapper.findBySnum(student.getSnum());
    	Collections.sort(list);

    	model.addAttribute("inquiry_list", list);

        return "user/inquiry/inquiry_list_front";
    }

    @PostMapping("user/inquiry/inquiry_list_front")
    public String inquiry_list_front(Model model, int select_value, Principal principal) {
    	Member student = memberMapper.findMember(principal.getName());

    	if(select_value == 2) {
    		List<Inquiry> list = inquiryMapper.findBySnum(student.getSnum());
        	Collections.sort(list);

        	model.addAttribute("inquiry_list", list);
        	model.addAttribute("select_value", select_value);
    	}
    	else {
    		List<Inquiry> list = inquiryMapper.findBySnumState(student.getSnum(),select_value);
        	Collections.sort(list);

        	model.addAttribute("inquiry_list", list);
        	model.addAttribute("select_value", select_value);
    	}

        return "user/inquiry/inquiry_list_front";
    }

    /*문의사항 디테일 컨트롤러(admin)*/
    @GetMapping("admin/inquiry/inquiry_details_admin")
    public String inquiry_details_admin(Model model, int no, String nextTitle, String preTitle, HttpSession session) {
    	int LX = inquiryMapper.findLX();
    	int FX = inquiryMapper.findFX();

    	Inquiry inquiry = inquiryMapper.findByNo(no);
    	Sequence list = inquiryMapper.find_ud_inquiry(no);


    	if(FX == no) {
        	Inquiry next = inquiryMapper.findByNo(list.getNextNo());

        	if(next != null) {
        		nextTitle = next.getTitle();
        		preTitle = "게시글이 존재하지 않습니다";

        		model.addAttribute("nextTitle",nextTitle);
            	model.addAttribute("preTitle",preTitle);

            	int next_no = list.getNextNo();
            	int pre_no = list.getPreNo();

            	model.addAttribute("inquiry_next",next_no);
            	model.addAttribute("inquiry_pre", pre_no);
        	}
        	else {
        		nextTitle = "게시글이 존재하지 않습니다";
        		preTitle = "게시글이 존재하지 않습니다";

        		model.addAttribute("nextTitle",nextTitle);
            	model.addAttribute("preTitle",preTitle);

            	int next_no = list.getNextNo();
            	int pre_no = list.getPreNo();

            	model.addAttribute("inquriy_next",next_no);
            	model.addAttribute("inquriy_pre", pre_no);
        	}
    	}
    	else if(no == LX) {
    		Inquiry previous = inquiryMapper.findByNo(list.getPreNo());

        	preTitle = previous.getTitle();
    		nextTitle = "게시글이 존재하지 않습니다";

    		model.addAttribute("nextTitle",nextTitle);
        	model.addAttribute("preTitle",preTitle);

        	int pre_no = list.getPreNo();
        	int next_no = list.getNextNo();

        	model.addAttribute("inquiry_next",next_no);
        	model.addAttribute("inquiry_pre", pre_no);
    	}
    	else {
        	Inquiry next = inquiryMapper.findByNo(list.getNextNo());
        	Inquiry previous = inquiryMapper.findByNo(list.getPreNo());

        	nextTitle = next.getTitle();
        	preTitle = previous.getTitle();

        	model.addAttribute("nextTitle",nextTitle);
        	model.addAttribute("preTitle",preTitle);

        	int next_no = list.getNextNo();
        	int pre_no = list.getPreNo();

        	model.addAttribute("inquiry_next",next_no);
        	model.addAttribute("inquiry_pre", pre_no);

    	}

    	model.addAttribute("LX", LX);
    	model.addAttribute("FX", FX);
    	model.addAttribute("inquiry_list", inquiry);



    	session.setAttribute("no", no);

        return "admin/inquiry/inquiry_details_admin";
    }

    @PostMapping("admin/inquiry/inquiry_details_admin")
    public String inquiry_details_admin(Model model, String answer, HttpSession session) {

    	int no = (int) session.getAttribute("no");

    	Inquiry inquiry = inquiryMapper.findByNo(no);

    	inquiry.setAnswer(answer);
    	if(answer.equals("")) {
    		inquiry.setState(0);
    	}
    	else {
    		inquiry.setState(1);
    	}

    	System.out.println(answer);

    	inquiryMapper.updateInquiry(inquiry);

    	session.removeAttribute("no");

        return "redirect:inquiry_list";
    }

    /*문의사항 디테일 컨트롤러(front)*/
    @GetMapping("user/inquiry/inquiry_details_front")
    public String inquiry_details_front(Model model, int no, String nextTitle, String preTitle) {
       	int LX = inquiryMapper.findLX();
       	int FX = inquiryMapper.findFX();

    	Inquiry inquiry = inquiryMapper.findByNo(no);
    	Sequence list = inquiryMapper.find_ud_inquiry(no);



    	if(FX == no) {
        	Inquiry next = inquiryMapper.findByNo(list.getNextNo());

        	if(next != null) {
        		nextTitle = next.getTitle();
        		preTitle = "게시글이 존재하지 않습니다";

        		model.addAttribute("nextTitle",nextTitle);
            	model.addAttribute("preTitle",preTitle);

            	int next_no = list.getNextNo();
            	int pre_no = list.getPreNo();

            	model.addAttribute("inquiry_next",next_no);
            	model.addAttribute("inquiry_pre", pre_no);
        	}
        	else {
        		nextTitle = "게시글이 존재하지 않습니다";
        		preTitle = "게시글이 존재하지 않습니다";

        		model.addAttribute("nextTitle",nextTitle);
            	model.addAttribute("preTitle",preTitle);

            	int next_no = list.getNextNo();
            	int pre_no = list.getPreNo();

            	model.addAttribute("inquriy_next",next_no);
            	model.addAttribute("inquriy_pre", pre_no);
        	}
    	}
    	else if(no == LX) {
    		Inquiry previous = inquiryMapper.findByNo(list.getPreNo());

        	preTitle = previous.getTitle();
    		nextTitle = "게시글이 존재하지 않습니다";

    		model.addAttribute("nextTitle",nextTitle);
        	model.addAttribute("preTitle",preTitle);

        	int pre_no = list.getPreNo();
        	int next_no = list.getNextNo();

        	model.addAttribute("inquiry_next",next_no);
        	model.addAttribute("inquiry_pre", pre_no);
    	}
    	else {
        	Inquiry next = inquiryMapper.findByNo(list.getNextNo());
        	Inquiry previous = inquiryMapper.findByNo(list.getPreNo());

        	nextTitle = next.getTitle();
        	preTitle = previous.getTitle();

        	model.addAttribute("nextTitle",nextTitle);
        	model.addAttribute("preTitle",preTitle);

        	int next_no = list.getNextNo();
        	int pre_no = list.getPreNo();

        	model.addAttribute("inquiry_next",next_no);
        	model.addAttribute("inquiry_pre", pre_no);

    	}


    	model.addAttribute("LX", LX);
    	model.addAttribute("FX", FX);
    	model.addAttribute("inquiry_list", inquiry);



        return "user/inquiry/inquiry_details_front";
    }

    @PostMapping("user/inquiry/inquiry_details_front")
    public String inquiry_details_front(Model model, String title) {

        return "user/inquiry/inquiry_details_front";
    }



}