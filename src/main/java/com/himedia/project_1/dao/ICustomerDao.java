package com.himedia.project_1.dao;

import com.himedia.project_1.dto.Paging;
import com.himedia.project_1.dto.QnaVo;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ICustomerDao {
    List<QnaVo> getQnaList(String key, Paging paging);

    int getAllCount(String key);

    void insertQna(QnaVo qnavo);

    int getQseq(String writer, String id);

    QnaVo getQnaDetail(int qseq);

    void updateQna(QnaVo qnavo);
}
