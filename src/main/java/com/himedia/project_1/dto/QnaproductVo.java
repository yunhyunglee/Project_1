package com.himedia.project_1.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class QnaproductVo {
    private int qpseq;
    private int cseq;
    private String userid;
    private String businessid;
    private String content;
    private Timestamp indate;
    private String reply;
    private Timestamp replyindate;
}
