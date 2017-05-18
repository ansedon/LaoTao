package com.repository;

import com.model.RouTradeEntity;
import com.model.RouteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by tciisxy on 2017/5/16.
 */
@Repository
public interface RouTradeRepository  extends JpaRepository<RouTradeEntity,Integer> {
    List<RouTradeEntity> findByTradeRouId(int rou_id);
    RouTradeEntity findByTradeRouIdAndTradeUserId(int rou_id, int user_id);

    @Query(value = "select rouTrade from RouTradeEntity rouTrade where rouTrade.tradeRouId=?1 and rouTrade.tradeUserId=?2")
    RouTradeEntity checkBought(int rou_Id, int user_Id);

}
