package com.service;

import com.model.UserEntity;
import com.repository.UserRepository;
import com.tool.GetDate;
import com.tool.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ansedon on 2017/5/9.
 */
@Service
public class UserService {
    // 自动装配数据库接口，不需要再写原始的Connection来操作数据库
    @Autowired
    UserRepository userRepository;

    UserEntity user;
    private Map<String, String> map=new HashMap<>();

    public Map checkLogin(String username, String ps) {
        user = userRepository.findByUserName(username);
        if (user == null || username.compareTo(user.getUserName()) != 0 || ps.compareTo(user.getUserPassword()) != 0) {
            map.put("msg", "用户名或密码错误！");
        } else {
            map.put("msg", "1");
        }
        return map;
    }

    public Map register(UserEntity userEntity) {
        if (Message.isMobileNO(userEntity.getUserTel()) == false) {
            map.put("msg", "wrong phone number");
            return map;
        }
        user = userRepository.findByUserName(userEntity.getUserName());
        if (user != null) {
            map.put("msg", "user name exists");
            return map;
        }
        user = userRepository.findByUserTel(userEntity.getUserTel());
        if (user != null) {
            map.put("msg", "phone number exists");
            return map;
        }
        GetDate getTime = new GetDate();
        java.sql.Date reg_time = null;
        reg_time = getTime.getNetworkTime("http://www.baidu.com");
        if(reg_time==null)
            reg_time= new java.sql.Date(new java.util.Date().getTime());
        userEntity.setUserGender("0");
        userEntity.setUserBirthYear(1990);
        userEntity.setUserCertStatus("0");
        userEntity.setUserExperience(0);
        userEntity.setUserLevel(1);
        userEntity.setUserMoney(0);
        userEntity.setUserRegTime(reg_time);
        userRepository.saveAndFlush(userEntity);
        map.put("msg", "1");
        return map;
    }
}
