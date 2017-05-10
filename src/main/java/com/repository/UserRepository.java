package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.model.UserEntity;
import org.springframework.stereotype.Repository;

/**
 * Created by ansedon on 2017/4/26.
 */
@Repository
public interface UserRepository extends JpaRepository<UserEntity,Integer>{
    UserEntity findByUserName(String username);
    UserEntity findByUserTel(String phone);
}
