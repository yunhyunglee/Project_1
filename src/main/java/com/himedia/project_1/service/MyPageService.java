package com.himedia.project_1.service;

import com.himedia.project_1.dao.IMyPageDao;
import com.himedia.project_1.dao.IZZimDao;
import com.himedia.project_1.dto.ProductVo;
import com.himedia.project_1.dto.ReservationVo;
import com.himedia.project_1.dto.ZzimVo;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.amqp.RabbitProperties;
import org.springframework.stereotype.Service;

import javax.sound.midi.Soundbank;
import java.util.HashMap;
import java.util.List;

@Service
public class MyPageService {
    @Autowired
    IMyPageDao mdao;
    @Autowired
    IZZimDao zdao;

    public List<ReservationVo> getMyClassInfo(String id) {
        List<ReservationVo> list = mdao.selectTotalPrice(id);
        return list;
    }

    public List<ReservationVo> selectReservListDay(String cseq) {
        return mdao.selectReservListDay(cseq);
    }

    public int reservationCancel(String reseq) {
        int cseq= mdao.selectcseqByReseq(reseq);
        mdao.deleteReservation(reseq);
        return cseq;
    }


    public void insertNewProduct(ProductVo productvo, List<String> selectedtimes) {
        mdao.insertNewProduct(productvo);
        int cseq= mdao.getNewProductCseq(productvo.getId());
        for(String selectedtime : selectedtimes){
            //등록한 상품의 cseq 조회하고 cseq,selectedtime,payment=y로 인서트
            mdao.insertNewProductTime(cseq,selectedtime);
        }
    }

    public ProductVo selectProductbycseq(int cseq) {
        return mdao.selectProductbycseq(cseq);
    }

    public List<String> selectedtimes(int cseq) {
        return mdao.selectedtimes(cseq);
    }

    public void UpdateProduct(ProductVo productvo, List<String> selectedtimes) {
        mdao.UpdateProduct(productvo);
        mdao.deleteProductTime(productvo.getCseq());
        for(String selectedtime : selectedtimes){
            mdao.insertNewProductTime(productvo.getCseq(),selectedtime);
        }

    }

    public void deleteProduct(int cseq) {
        mdao.deleteProduct(cseq);
    }

    public void clearpay(int cseq) {
        mdao.clearpay(cseq);
    }

    public List<ZzimVo> getZzimList(int userId) {
        return zdao.getZzimList(userId);
    }
}
