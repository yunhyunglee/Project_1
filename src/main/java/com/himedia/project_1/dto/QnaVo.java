package com.himedia.project_1.dto;


import lombok.Data;

import java.sql.Timestamp;

@Data
public class QnaVo {

    private int qseq;
    private String title;
    private String content;
    private String pwd;
    private String writer1;
    private String writer2;
    private String reply;

}
