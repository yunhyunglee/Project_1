package com.himedia.project_1.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BannerVo {
    private int bannerId;  // 배너 ID
    private String image;  // 배너 이미지 URL
    private String title;  // 배너 제목
    private String content; // 배너 내용
    private String link;   // 배너 클릭 링크
    private boolean active; // 활성화 여부
    private int priority;  // 우선순위
    private Timestamp created; // 생성 날짜
    private Timestamp updated; // 수정 날짜
}
