package com.himedia.project_1.dao;


import com.himedia.project_1.dto.BusinessmanVo;
import com.himedia.project_1.dto.UserVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface IBusinessmanDao {


    BusinessmanVo getBusinessmanById(String id);
    void deleteBusinessman(String id);

    List<BusinessmanVo> fetchBusinessList();

    void updateBusiness(BusinessmanVo businessman);

    int getFilteredTotalCount(@Param("searchQuery") String searchQuery, @Param("searchType") String searchType);

    List<BusinessmanVo> getFilteredBusinessList(@Param("searchQuery") String searchQuery,
                                     @Param("searchType") String searchType,
                                     @Param("startNum") int startNum,
                                     @Param("displayRow") int displayRow);
}
