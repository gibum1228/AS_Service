package com.as.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Device_Join_Detail {
    private String code;
    private String name;
    private int type;
    private Date buy_date;
    private int major_id;
    private int detail_no;
    private int state;
}
