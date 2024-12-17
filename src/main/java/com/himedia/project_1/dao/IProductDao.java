package com.himedia.project_1.dao;


import com.himedia.project_1.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.sql.Time;
import java.util.Date;
import java.util.List;

@Mapper
public interface IProductDao {
    List<ProductVo> selectCategory(int category);
    List<ProductVo> selectTheme(int theme);


    ProductVo selectProductById(int id); // 상품 ID로 상품 조회
    List<ProductVo> selectNewProducts(); // 최신 상품 가져오기
    List<ProductVo> selectBestProducts(); // 베스트 상품 가져오기

    boolean getZzim(String id, int cseq);

    void insertZzim(String id, int cseq);

    void deleteZzim(String id, int cseq);

    ProductVo getProductById(int cseq);





    List<ProductVo> findAllProducts();
    ProductVo findProductById(int productId);
    void insertProduct(ProductVo product);
    void updateProduct(ProductVo product);
    void deleteProduct(int cseq);

    List<ProductVo> findProductsByBusinessId(String businessId);

    String[] getClassTime(int cseq);

    void insertReservation(String userid, int cseq, Date classday, Time classtime, int people);

    int getAllCount(String key);

    List<ProductVo> getSearchList(String key, Paging paging);


    String calAbleCapacity(Date classday, Time time1);


    List<ReservationVo> getReservationForReview(String id, int cseq);

    List<ReviewVo> getreview(int cseq);

    void insertReview(String id, int cseq,String rating, String review,String savefilename);
}
