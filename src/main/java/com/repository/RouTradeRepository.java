package com.repository;

import com.model.RouTradeEntity;
import com.model.RouteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by tciisxy on 2017/5/16.
 */
@Repository
public interface RouTradeRepository  extends JpaRepository<RouTradeEntity,Integer> {
    List<RouTradeEntity> findByTradeRouId(int rou_id);

    RouTradeEntity findByTradeRouIdAndTradeUserId(int rou_id, int user_id);

    List<RouTradeEntity> readByTradeUserId(int userId);

    @Query(value = "select rouTrade from RouTradeEntity rouTrade where rouTrade.tradeRouId=?1 and rouTrade.tradeUserId=?2")
    RouTradeEntity checkBought(int rou_Id, int user_Id);

    @Modifying
    @Transactional
    @Query("update RouTradeEntity rt set rt.rouTradeStatus=:status,rt.rouComment=:comment where rt.tradeRouId=:routeId and rt.tradeUserId=:userId")
    void confirmTrade(@Param("status") String status,@Param("comment")String comment, @Param("routeId")int routeId, @Param("userId") int userId);
}
