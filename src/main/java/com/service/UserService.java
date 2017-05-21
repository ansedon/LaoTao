package com.service;

import com.model.RouteEntity;
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

    public UserEntity getUserByName(String userName)
    {
        user = userRepository.findByUserName(userName);
        return user;
    }

    public boolean updateUser(int changeMoney,int changeExp,int userId)
    {
        userRepository.updateUser(changeMoney,changeExp,userId);
        UserEntity userEntity=userRepository.findByUserId(userId);
        //避免用户经验小于0
        if(userEntity.getUserExperience()<0)
        {
            userRepository.updateUser(-1*userEntity.getUserExperience(),0,userId);
        }
        return true;
    }

    public UserEntity updateUserExpAndLevel(int userId,int changeExp)
    {
        userRepository.updateUser(0,changeExp,userId);
        UserEntity userEntity=userRepository.findByUserId(userId);
        int exp=userEntity.getUserExperience();
        if(exp<=0)
        {
            userRepository.updateUser(-1*userEntity.getUserExperience(),0,userId);
            userRepository.updateUserLevel(0,userId);
        }
        else if(exp>0&&exp<=9)
            userRepository.updateUserLevel(1,userId);
        else if(exp>9&&exp<=99)
            userRepository.updateUserLevel(2,userId);
        else if(exp>99&&exp<=299)
            userRepository.updateUserLevel(3,userId);
        else if(exp>299&&exp<=599)
            userRepository.updateUserLevel(4,userId);
        else if(exp>599&&exp<=899)
            userRepository.updateUserLevel(5,userId);
        else if(exp>899&&exp<=1199)
            userRepository.updateUserLevel(6,userId);
        else if(exp>1199&&exp<=1499)
            userRepository.updateUserLevel(7,userId);
        else if(exp>1499&&exp<=1799)
            userRepository.updateUserLevel(8,userId);
        else if(exp>1799&&exp<=2099)
            userRepository.updateUserLevel(9,userId);
        else if(exp>2099&&exp<=2499)
            userRepository.updateUserLevel(10,userId);
        else if(exp>2499&&exp<=2999)
            userRepository.updateUserLevel(11,userId);
        else if(exp>2999&&exp<=3999)
            userRepository.updateUserLevel(12,userId);
        else if(exp>3999&&exp<=5499)
            userRepository.updateUserLevel(13,userId);
        else if(exp>5499&&exp<=7499)
            userRepository.updateUserLevel(14,userId);
        else if(exp>7499&&exp<=9999)
            userRepository.updateUserLevel(15,userId);
        else if(exp>9999)
            userRepository.updateUserLevel(16,userId);
        userEntity=userRepository.findByUserId(userId);
        return  userEntity;
    }
}
