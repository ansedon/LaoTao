package com.repository;

import com.model.ResCollectEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ansedon on 2017/5/16.
 */
@Repository
public interface ResCollectRepository extends JpaRepository<ResCollectEntity,Integer> {
    @Query(value = "select r from  ResCollectEntity r where r.cresId=?1 and r.collectorId=?2")
    ResCollectEntity checkCollect(int cresId,int collectotId);

    List<ResCollectEntity> readByCollectorId(int collectorId);
}
