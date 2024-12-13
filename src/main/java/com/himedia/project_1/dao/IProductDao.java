package com.himedia.project_1.dao;


import com.himedia.project_1.dto.Paging;
import com.himedia.project_1.dto.ProductVo;
import com.himedia.project_1.dto.QnaVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IProductDao {
    List<ProductVo> selectCategory(int category);

    ProductVo selectProductById(int id); // 상품 ID로 상품 조회
    List<ProductVo> selectNewProducts(); // 최신 상품 가져오기
    List<ProductVo> selectBestProducts(); // 베스트 상품 가져오기

    boolean getZzim(String id, int cseq);

    void insertZzim(String id, int cseq);

    void deleteZzim(String id, int cseq);

    ProductVo getProductById(int cseq);

    String[] getClassTime(int cseq);

    void insertReservation(String userid, int cseq, String classday, int classtime,int people);

    int getAllCount(String key);

    List<ProductVo> getSearchList(String key, Paging paging);
}
