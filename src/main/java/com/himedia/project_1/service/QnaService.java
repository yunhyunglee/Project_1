package com.himedia.project_1.service;

import com.himedia.project_1.dao.IQnaDao;
import com.himedia.project_1.dto.QnaVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {

    @Autowired
    IQnaDao iqnaDao;

    public void updateReply(int qseq, String reply) {
        iqnaDao.updateReply(qseq, reply);
    }

    public QnaVo getQnaById(int qseq) {
        return iqnaDao.findById(qseq);
    }
}
