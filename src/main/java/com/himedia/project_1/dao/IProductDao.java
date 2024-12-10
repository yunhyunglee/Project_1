package com.himedia.project_1.dao;


import com.himedia.project_1.dto.ProductVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IProductDao {
    List<ProductVo> selectCategory(int category);
    ProductVo selectProductById(int id); // 상품 ID로 상품 조회
    List<ProductVo> selectNewProducts(); // 최신 상품 가져오기
    List<ProductVo> selectBestProducts(); // 베스트 상품 가져오기
}
