package com.himedia.project_1.dao;

import com.himedia.project_1.dto.ProductVo;
import com.himedia.project_1.dto.ReservationVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMyPageDao {

    List<ProductVo> getMyClassInfo(String id);

    List<ReservationVo> selectTotalPrice(String id);

    List<ReservationVo> selectReservListDay(String cseq);

    void deleteReservation(String reseq);

    int selectcseqByReseq(String reseq);

    void insertNewProduct(ProductVo productvo);

    int getNewProductCseq(String id);

    void insertNewProductTime(int cseq, String selectedtime);

    ProductVo selectProductbycseq(int cseq);

    List<String> selectedtimes(int cseq);

    void UpdateProduct(ProductVo productvo);

    void deleteProductTime(Integer cseq);

    void deleteProduct(int cseq);

    void clearpay(int cseq);

    void deleteReview(int id);
}
