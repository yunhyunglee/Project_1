package com.himedia.project_1.dto;

import lombok.Data;

import java.sql.Timestamp;


@Data
public class ProductVo {
    private int cseq;
    private int price;
    private String id;
    private String title;
    private String content;
    private int zip_num;
    private String  address1;
    private String address2;
    private String address3;
    private String category;
    private String bestyn;
    private Timestamp indate;
    private String image;
    private String savefilename;
    private int max_people;
    private int theme;
}
