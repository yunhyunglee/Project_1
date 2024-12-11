package com.himedia.project_1.service;

import com.himedia.project_1.dao.IProductDao;
import com.himedia.project_1.dto.ProductVo;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ProductService {

    @Autowired
    IProductDao pdao;


    public List<ProductVo> selectCategory(int category) {
        return pdao.selectCategory(category);
    }
    public ProductVo getProductById(int id) {
        return pdao.selectProductById(id);
    }
    public List<ProductVo> getNewProducts() {
        return pdao.selectNewProducts(); // 최신 상품 가져오기
    }

    public List<ProductVo> getBestProducts() {
        return pdao.selectBestProducts(); // 베스트 상품 가져오기
    }


    public boolean toggleZzim( String id, int cseq) {
        boolean zzim= pdao.getZzim(id,cseq);
        System.out.println("zzim : "+zzim);
        if(zzim) {
            pdao.deleteZzim(id,cseq);
            zzim=false;
        }else {
            pdao.insertZzim(id,cseq);
            zzim=true;
        }
        return zzim;
    }

    public boolean getZzim( String id, int cseq) {
        return pdao.getZzim(id,cseq);
    }
}
