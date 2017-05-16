package com.repository;

import com.model.ResCollectEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yinjiaming on 17/5/16.
 */
@Repository
public interface ResCollectRepository  extends JpaRepository<ResCollectEntity,Integer> {
    List<ResCollectEntity> readByCollectorId(int collectorId);
}
