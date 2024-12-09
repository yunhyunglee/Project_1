package com.himedia.project_1.dao;


import com.himedia.project_1.dto.BusinessmanVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface IBusinessmanDao {


    BusinessmanVo getBusinessmanById(String id);
    void deleteBusinessman(String id);

    List<BusinessmanVo> fetchBusinessList();

    void updateBusiness(BusinessmanVo businessman);
}
