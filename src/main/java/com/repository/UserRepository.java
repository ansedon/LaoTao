package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.model.UserEntity;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by ansedon on 2017/4/26.
 */
@Repository
public interface UserRepository extends JpaRepository<UserEntity,Integer>{
    UserEntity findByUserName(String username);

    UserEntity findByUserId(int userId);

    UserEntity findByUserTel(String phone);

    @Modifying
    @Transactional
    @Query("update UserEntity us set us.userMoney =us.userMoney+:qMoney, us.userExperience =us.userExperience+:qExp where us.userId=:qId")
    void updateUser(@Param("qMoney") int money, @Param("qExp") int exp, @Param("qId") int user_id);

    @Modifying
    @Transactional
    @Query("update UserEntity user set user.userCertStatus=:status where user.userId=:userId")
    void updateUserCertStatus(@Param("status") int status, @Param("userId") int userId);

    @Modifying
    @Transactional
    @Query("update UserEntity user set user.userLevel=:level where user.userId=:userId")
    void updateUserLevel(@Param("level") int level, @Param("userId") int userId);
}
