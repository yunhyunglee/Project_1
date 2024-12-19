package com.himedia.project_1.service;

import com.himedia.project_1.dao.ICustomerDao;
import com.himedia.project_1.dto.BusinessmanVo;
import com.himedia.project_1.dto.Paging;
import com.himedia.project_1.dto.QnaVo;
import com.himedia.project_1.dto.UserVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CustomerService {
    @Autowired
    ICustomerDao cdao;

    public HashMap<String,Object> getQnaList(HttpServletRequest request) {
        HashMap<String,Object> map = new HashMap<>();
        HttpSession session = request.getSession();

        if(request.getParameter("first") != null) {
            session.removeAttribute("qnapage");
            session.removeAttribute("key");
        }

        int page=1;
        if(request.getParameter("qnapage")!=null){
            page=Integer.parseInt(request.getParameter("qnapage"));
            session.setAttribute("qnapage",page);
        }else if(session.getAttribute("qnapage")!=null){
            page=(Integer) session.getAttribute("qnapage");
        }

        String key="";
        if(request.getParameter("key") != null) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        }else if(session.getAttribute("key") != null) {
            key = (String)session.getAttribute("key");
        }

        Paging paging = new Paging();
        paging.setPage(page);
        int count = cdao.getAllCount(key);
        paging.setTotalCount(count);
        paging.calPaging();

        List<QnaVo> list = cdao.getQnaList(key,paging);

        map.put("paging",paging);
        map.put("qnaList",list);
        map.put("key",key);
        return map;
    }

    public int insertQna(QnaVo qnavo,Object loginUser) {
        cdao.insertQna(qnavo);
        int qseq=0;
        if(loginUser instanceof UserVo) {
            qseq=cdao.getQseq("writer1",((UserVo) loginUser).getId());
        }else if(loginUser instanceof BusinessmanVo){
            qseq=cdao.getQseq("writer2",((BusinessmanVo) loginUser).getId());
        }
        return qseq;
    }

    public QnaVo getQnaDetail(int qseq) {
        return cdao.getQnaDetail(qseq);
    }

    public void updateQna(QnaVo qnavo) {
        cdao.updateQna(qnavo);
    }

    public void deleteQna(int qseq) {
        cdao.deleteQna(qseq);
    }
}
