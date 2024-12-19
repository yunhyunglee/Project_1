package com.himedia.project_1.dto;

import lombok.Data;

@Data
public class ZzimVo {
    private String uid;
    private int price;
    private int cnum;
    private String id;
    private String title;
    private String address1;
    private String address2;
    private String address3;
    private String category;
    private String savefilename;
    private int cseq; // 상품 ID (추가 필드)
}
