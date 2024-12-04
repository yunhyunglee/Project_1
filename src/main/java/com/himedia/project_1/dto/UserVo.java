package com.himedia.project_1.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class UserVo {
    @NotEmpty
    @NotNull
    private String id;
    @NotEmpty
    @NotNull
    private String name;
    @NotEmpty
    @NotNull
    private String pwd;
    @NotEmpty
    @NotNull
    private String email;
    @NotEmpty
    @NotNull
    private String phone;
    private Timestamp indate;
}
