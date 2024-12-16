package com.himedia.project_1.service;

import com.himedia.project_1.dao.IProductDao;
import com.himedia.project_1.dto.ProductVo;
import com.himedia.project_1.dto.UserVo;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


@Service
public class ProductService {

    @Autowired
    IProductDao pdao;


    public List<ProductVo> selectCategory(int category) {
        return pdao.selectCategory(category);
    }
    public List<ProductVo> selectTheme(int theme) {
        return pdao.selectTheme(theme); // 테마 기준 검색
    }

    public List<ProductVo> getNewProducts() {return pdao.selectNewProducts(); // 최신 상품 가져오기
    }
    public List<ProductVo> getBestProducts() {
        return pdao.selectBestProducts(); // 베스트 상품 가져오기
    }

    public boolean toggleZzim( String id, int cseq) {
        boolean zzim= pdao.getZzim(id,cseq);
        if(zzim) {
            pdao.deleteZzim(id,cseq);
            zzim=false;
        }else {
            pdao.insertZzim(id,cseq);
            zzim=true;
        }
        return zzim;
    }

    public HashMap<String,Object> getZzim(Object loginUser, int cseq) {
        HashMap<String,Object> map = new HashMap<>();
        String id="";
        if(loginUser instanceof UserVo){
            id= ((UserVo)loginUser).getId();
            map.put("zzim",pdao.getZzim(id,cseq));
        }
        map.put("productVo",pdao.selectProductById(cseq));
        return map;
    }
    public ProductVo getProductById(int cseq) {
        System.out.println(pdao.getProductById(cseq).getCseq());
        return pdao.getProductById(cseq);
    }







    // 어드민관련


    public List<ProductVo> getAllProducts() {
        return pdao.findAllProducts();
    }

    public ProductVo getProductById2(int productId) {
        return pdao.findProductById(productId);
    }

    public void addProduct(ProductVo product) {
        pdao.insertProduct(product);
    }

    public void updateProduct(ProductVo product) {
        pdao.updateProduct(product);
    }

    public void deleteProduct(int cseq) {
        pdao.deleteProduct(cseq);
    }


    public List<ProductVo> getProductsByBusinessId(String businessId) {
        return pdao.findProductsByBusinessId(businessId);
    }

}
