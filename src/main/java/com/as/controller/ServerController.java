package com.as.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.as.dto.Device;
import com.as.dto.Device_Join_Detail;
import com.as.dto.Device_detail;
import com.as.mapper.DeviceMapper;
import com.as.mapper.Device_detailMapper;
import com.as.mapper.MemberMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/server")
public class ServerController {

    @Autowired
    DeviceMapper deviceMapper;
    @Autowired
    Device_detailMapper ddMapper;
    @Autowired
    MemberMapper memberMapper;
    
    @GetMapping("/deviceList")
    public String deviceList(Model model, String select, String search) { // 모든 장비 정보 자세하게 보여주기
        List<Device_Join_Detail> devices  = deviceMapper.findAllDeviceJoinDetail();
        List<Device_Join_Detail> pages = new ArrayList<>(); // 일정 수 만큼 페이지 나눠서 보여주기

        if(search == null){ // 조건 없을 시
            select = "장비명";
        }else if(select.compareTo("장비명") == 0){ // 장비명으로 검색하려고 한다면
            if(search.compareTo("") != 0){
                devices = deviceMapper.findDeviceJoinDetailAtName(search);
            }
        }else if(select.compareTo("전공명") == 0){ // 전공명으로 검색하려고 한다면
            if(search.compareTo("") != 0){
                try {
                    int id = memberMapper.findMajorAtName(search);
                    devices = deviceMapper.findDeviceJoinDetailAtMajor(id);
                }catch(Exception e){
                    devices = null;
                }
            }
        }

        if(devices == null){
            devices = deviceMapper.findAllDeviceJoinDetail();
            search = "";
        }

        model.addAttribute("devices", devices);
        model.addAttribute("select", select);
        model.addAttribute("search", search);

        return "server/device_list";
    }

    @PostMapping("/deviceList")
    public String deviceAdd(Model model, String code, String name, int type, @DateTimeFormat(pattern = "yyyy-MM-dd") Date buy_date, int major_id, int no){
        SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
        String date = SDF.format(buy_date);

        Device d = new Device(code, name, type, buy_date, major_id);
        deviceMapper.insertDevice(d);
        
        for(int i = 0; i <= no; i++){
            ddMapper.insertDeviceDetail(new Device_detail(code, i, 1));
        }
        
        return "redirect:deviceList";
    }
    
}
