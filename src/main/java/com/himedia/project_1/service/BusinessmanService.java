package com.himedia.project_1.service;


import com.himedia.project_1.dao.IBusinessmanDao;
import com.himedia.project_1.dto.BusinessmanVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BusinessmanService {

    @Autowired
    private IBusinessmanDao bdao;

    public BusinessmanVo getBusinessmanById(String id) {
        return bdao.getBusinessmanById(id);
    }

    public void deleteBusinessman(String id) {
        bdao.deleteBusinessman(id);
    }



    public List<BusinessmanVo> fetchBusinessList() {
        return bdao.fetchBusinessList();
    }

    public void updateBusiness(BusinessmanVo businessman) {
        System.out.println("수정 요청 데이터: " + businessman);
        bdao.updateBusiness(businessman);
    }
}
