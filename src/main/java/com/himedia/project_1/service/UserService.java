package com.himedia.project_1.service;

import com.himedia.project_1.dao.IUserDao;
import com.himedia.project_1.dto.BusinessmanVo;
import com.himedia.project_1.dto.UserVo;
import com.himedia.project_1.dto.ZzimVo;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    IUserDao udao;

    public void InsertUser(UserVo uvo) {
        udao.InsertUser(uvo);
    }

    public UserVo getMember(String id) {
        return udao.getUser(id);
    }

    public void updateUser(UserVo uservo) {
        udao.updateUser(uservo);
    }

    public void InsertBusinessman(BusinessmanVo uservo) {
        udao.InsertBusinessman(uservo);
    }

    public BusinessmanVo getBusinessman(String userid) {
        return udao.getBusinessman(userid);
    }

    public void updateBusiness(BusinessmanVo uservo) {
        udao.updateBusiness(uservo);
    }

    public void deleteuser(String id) {
        udao.deleteuser(id);
    }

    public void deleteBusiness(String id) {
        udao.deleteBusiness(id);
    }

    public List<ZzimVo> getZZim(String id) {
        return udao.getZZim(id);
    }
}
