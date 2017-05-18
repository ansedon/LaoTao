package com.controller;

import com.model.ResCollectEntity;
import com.model.UserEntity;
import com.repository.RestaurantRepository;
import com.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ansedon on 2017/5/16.
 */
@Controller
public class RestaurantController {
    @Autowired
    RestaurantRepository restaurantRepository;
    @Autowired
    RestaurantService restaurantService;

    Map<String, String> map=new HashMap<>();

    @RequestMapping(value = "/resCollect", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> resOp(@RequestBody Map<String, String> data, HttpSession session) {
        String method = data.get("method").trim();
        int resId = Integer.parseInt(data.get("resId").trim());
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        if (user == null) {
            map.put("msg", "请先登录");
        } else {
            int userId = user.getUserId();

            //收藏餐馆
            if (method.equals("collectRes")) {
                //检查用户是否已经收藏该餐馆
                boolean msg = restaurantService.checkCollectRes(resId, userId);
                if (msg == false) {
                    //用户未收藏此餐馆，收藏餐馆
                    ResCollectEntity resCollectEntity = new ResCollectEntity();
                    resCollectEntity.setCresId(resId);
                    resCollectEntity.setCollectorId(userId);
                    restaurantService.collectRes(resCollectEntity);
                    map.put("msg", "收藏成功");
                } else {
                    map.put("msg", "您已收藏");
                }
            }
        }
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }
}
