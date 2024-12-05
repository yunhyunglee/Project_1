package com.himedia.project_1.service;


import com.himedia.project_1.dao.IAdminDao;
import com.himedia.project_1.dao.IQnaDao;
import com.himedia.project_1.dao.IUserDao;
import com.himedia.project_1.dto.AdminVo;
import com.himedia.project_1.dto.QnaVo;
import com.himedia.project_1.dto.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    IAdminDao adao;

    public AdminVo getAdmin(String aid) {
        return adao.getAdmin( aid );
    }


    @Autowired
    private IQnaDao qnaDao;

    public List<QnaVo> getQnaList() {
        return qnaDao.getQnaList();
    }

    @Autowired
    private IUserDao userDao;

    public List<UserVo> getUserList() {
        return userDao.getUserList();
    }
}
