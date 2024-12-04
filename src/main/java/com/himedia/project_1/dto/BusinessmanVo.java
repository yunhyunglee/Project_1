package com.himedia.project_1.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class BusinessmanVo {
    @NotNull
    @NotEmpty
    private String id;
    @NotNull
    @NotEmpty
    private String name;
    @NotNull
    @NotEmpty
    private String pwd;
    @NotNull
    @NotEmpty
    private String phone;
    @NotNull
    @NotEmpty
    private String email;
    @NotNull
    @NotEmpty
    private String businessnum;
    private Timestamp indate;
}
