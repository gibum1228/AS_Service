package com.as.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.as.dto.Notice;
import com.as.mapper.NoticeMapper;


@Controller
public class NoticeController {

	@Autowired NoticeMapper noticeMapper;

    @GetMapping("admin/notice")
    public String text1(Model model) {
        return "admin/notice";
    }

    @PostMapping("admin/notice")
    public String text1(Model model, Principal principal, String title, String body) {
        Notice notice = new Notice();

        notice.setSnum(principal.getName());
        notice.setTitle(title);
        notice.setBody(body);
        notice.setViews(0);

        noticeMapper.insertNotice(notice);

        return "admin/notice";
    }

}

