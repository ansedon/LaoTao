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
    UserEntity findByUserTel(String phone);
    @Modifying
    @Transactional
    @Query("update UserEntity us set us.userMoney =:qMoney, us.userExperience =:qExp where us.userId=:qId")
    void updateUser(@Param("qMoney") int money, @Param("qExp") int exp, @Param("qId") int user_id);
}
