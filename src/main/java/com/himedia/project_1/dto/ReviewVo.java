package com.himedia.project_1.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReviewVo {
    private int revseq;
    private int cseq;
    private String title;
    private String content;
    private String id;
    private Timestamp indate;
    private String rev_img;
}
