package com.himedia.project_1.service;

import com.himedia.project_1.dao.IMyPageDao;
import com.himedia.project_1.dto.ProductVo;
import com.himedia.project_1.dto.ReservationVo;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.sound.midi.Soundbank;
import java.util.HashMap;
import java.util.List;

@Service
public class MyPageService {
    @Autowired
    IMyPageDao mdao;

    public List<ReservationVo> getMyClassInfo(String id) {
        List<ReservationVo> list = mdao.selectTotalPrice(id);
        System.out.println("list.size(): " + list.size());
        return list;
    }
}
