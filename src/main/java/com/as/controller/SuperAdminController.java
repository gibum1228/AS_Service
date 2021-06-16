package com.as.controller;

import java.util.List;

import com.as.dto.Member;
import com.as.mapper.MemberMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/superadmin")
public class SuperAdminController {
    
    @Autowired
    MemberMapper memberMapper;

    @GetMapping("/organization")
    public String organization(Model model, String select, String search){
        List<Member> m = memberMapper.findAllMember();

        if(search == null){ // 조건 없을 시
            select = "학번";
        }else if(select.compareTo("학번") == 0){ // 학번으로 검색하려고 한다면
            if(search.compareTo("") != 0){
                m.clear();
                m.add(memberMapper.findMember(search));
            }
        }else if(select.compareTo("이름") == 0){ // 이름으로 검색하려고 한다면
            if(search.compareTo("") != 0){
                m = memberMapper.findMemberAtName(search);
            }
        }

        model.addAttribute("students", m);
        model.addAttribute("select", select);
        model.addAttribute("search", search);

        return "superadmin/organization";
    }

    @PostMapping("/organization")
    public String changeRole(@RequestParam String snum, @RequestParam int role){

        memberMapper.updateRoleAtSnum(snum, role);
        
        return "redirect:organization";
    }
}
