package com.himedia.project_1.service;


import com.himedia.project_1.dao.IAdminDao;
import com.himedia.project_1.dao.IQnaDao;
import com.himedia.project_1.dto.AdminVo;
import com.himedia.project_1.dto.QnaVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    IAdminDao adao;

    public AdminVo getAdmin(String adminid) {
        return adao.getAdmin( adminid );
    }

    @Autowired
    private IQnaDao qdao;

    public List<QnaVo> getQnaList() {
        return qdao.getQnaList();
    }
}
