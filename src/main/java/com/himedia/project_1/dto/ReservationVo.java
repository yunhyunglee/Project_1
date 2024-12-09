package com.himedia.project_1.dto;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;

@Data
public class ReservationVo {
    private int reseq;
    private String userid;
    private int cseq;
    private int people;
    private Time classtime;
    private Date classday;
    private int totalprice;
    private String title;
    private String payment;
    private String endedclass;
}
