package com.himedia.project_1.dao;


import com.himedia.project_1.dto.QnaVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IQnaDao {



    List<QnaVo> fetchQnaList();

    QnaVo findById(@Param("qseq") int qseq);
    void updateReply(@Param("qseq") int qseq, @Param("reply") String reply);


    int getFilteredTotalCount(@Param("filter") String filter, @Param("searchQuery") String searchQuery, @Param("searchType") String searchType);
    List<QnaVo> getFilteredQnaList(@Param("filter") String filter, @Param("searchQuery") String searchQuery, @Param("searchType") String searchType, @Param("startNum") int startNum, @Param("displayRow") int displayRow);

}
