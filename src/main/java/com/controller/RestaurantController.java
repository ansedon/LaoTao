package com.controller;

import com.model.*;
import com.repository.DishRepository;
import com.repository.ReferRepository;
import com.repository.RestaurantRepository;
import com.service.RestaurantService;
import com.service.SearchService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ansedon on 2017/5/16.
 */
@Controller
public class RestaurantController {
    @Autowired
    RestaurantRepository restaurantRepository;
    @Autowired
    ReferRepository referRepository;
    @Autowired
    RestaurantService restaurantService;
    @Autowired
    SearchService searchService;
    @Autowired
    UserService userService;
    @Autowired
    DishRepository dishRepository;

    Map<String, String> map = new HashMap<>();

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

    @RequestMapping(value = "/addRestaurant", method = RequestMethod.GET)
    public String addRestaurant(ModelMap modelMap, HttpSession session) {
        session.setAttribute("referResNum", 0);
        int artId=(int)session.getAttribute("referArtId");
        modelMap.addAttribute("referArtId", artId);
        modelMap.addAttribute("referResList",null);
        return "addRestaurant";
    }

    @RequestMapping(value = "/searchRestaurant", method = RequestMethod.GET)
    public String searchRestaurant(@RequestParam("key") String key, ModelMap modelMap, HttpSession session) {
        List<RestaurantEntity> resList = searchService.searchRestaurantByNameLike(key);
        //除去已经被提及的餐馆
        int artId=(int)session.getAttribute("referArtId");
        resList=restaurantService.selectRes(resList,artId);
        List<RestaurantEntity> restaurantEntityList = null;
        try {
            restaurantEntityList = (List<RestaurantEntity>) session.getAttribute("referResList");
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("referResNum", resList.size());
        modelMap.addAttribute("key", key);
        modelMap.addAttribute("searchRestaurants", resList);
        modelMap.addAttribute("referResList",restaurantEntityList);
        modelMap.addAttribute("artId",artId);
        return "addRestaurant";
    }

    @RequestMapping(value = "/postRestaurant", method = RequestMethod.POST)
    public String postRestaurant(@RequestParam("resName")String resName, @RequestParam("resStyle")String resStyle,
                                 @RequestParam("resAverageCost")int resAverageCost,
                                 @RequestParam("resAddrProvince")String resAddrProvince,
                                 @RequestParam("resAddrCity")String resAddrCity,
                                 @RequestParam("resAddrStreet")String resAddrStreet,
                                 @RequestParam("f1") MultipartFile file ,@RequestParam("picName")String picName,
                                 HttpSession session)
    {
        //保存文件到临时目录
        String savePath = session.getServletContext().getRealPath("/")
                + "/images/" + file.getOriginalFilename();
        File saveFile = new File(savePath);
        try {
            file.transferTo(saveFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String resPic="images/"+file.getOriginalFilename();
        int artId=(int)session.getAttribute("referArtId");
        RestaurantEntity restaurantEntity=new RestaurantEntity();
        restaurantEntity.setResPic(resPic);
        restaurantEntity.setResName(resName);
        restaurantEntity.setResStyle(resStyle);
        restaurantEntity.setResAverageCost(resAverageCost);
        restaurantEntity.setResAddrProvince(resAddrProvince);
        restaurantEntity.setResAddrCity(resAddrCity);
        restaurantEntity.setResAddrStreet(resAddrStreet);
        restaurantEntity.setResReferNum(1);
        restaurantEntity.setResScore(0.0);
        restaurantRepository.saveAndFlush(restaurantEntity);
        //更新经验和等级
        UserEntity userEntity=(UserEntity)session.getAttribute("currentUser");
        userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),5);
        session.setAttribute("currentUser",userEntity);
        //添加 article与restaurant的refer
        ReferEntity referEntity=new ReferEntity();
        referEntity.setReferResId(restaurantEntity.getResId());
        referEntity.setReferArtId(artId);
        referRepository.saveAndFlush(referEntity);
        return "redirect:/readArticle?id="+Integer.toString(artId);
    }

    //加载餐馆页
    @RequestMapping(value = "/resPage",method=RequestMethod.GET)
    public String resPage(@RequestParam("resId") int resId, ModelMap modelMap, HttpSession session){
        //查找餐馆详细信息
        RestaurantEntity res = restaurantRepository.findByResId(resId);
        modelMap.addAttribute("res",res);
        session.setAttribute("currentResId",resId);
        //查找菜品信息
        List<DishEntity> dishList = new ArrayList<DishEntity>();
        dishList = dishRepository.findByRestaurantId(resId);
        modelMap.addAttribute("dishlist",dishList);

        return "restaurantPage";
    }

    //新增菜品
    @RequestMapping(value="/addPage",method=RequestMethod.GET)
    public String addPage(@RequestParam("resId") int resId, ModelMap modelMap){
        //查找餐馆详细信息
        RestaurantEntity res = restaurantRepository.findByResId(resId);
        modelMap.addAttribute("res",res);
        return "addDish";
    }

    @RequestMapping(value="/addDish",method=RequestMethod.POST)
    public String addDish(@RequestParam("dishname") String dishName, @RequestParam("dishprice")double dishPrice,
                          @RequestParam("dishPic")CommonsMultipartFile file, HttpSession session){
        //保存文件到临时目录
        String savePath = session.getServletContext().getRealPath("/")
                + "/images/" + file.getOriginalFilename();
        File saveFile = new File(savePath);
        try {
            file.transferTo(saveFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String dishPic="images/"+file.getOriginalFilename();
        int resId = (int)session.getAttribute("currentResId");
        DishEntity dishEntity = new DishEntity();

        dishEntity.setDishName(dishName);
        dishEntity.setDishPrice(dishPrice);
        dishEntity.setDishPic(dishPic);
        dishEntity.setRestaurantId(resId);
        dishRepository.saveAndFlush(dishEntity);
        return "redirect:/resPage?resId="+Integer.toString(resId);
    }

    //编辑菜品信息
    @RequestMapping(value="/editPage", method=RequestMethod.GET)
    public String editPage(@RequestParam("dishId") int dishId, ModelMap modelMap, HttpSession session){
        DishEntity dish = dishRepository.findByDishId(dishId);
        RestaurantEntity res = restaurantRepository.findByResId(dish.getRestaurantId());
        modelMap.addAttribute("res",res);
        modelMap.addAttribute("dish",dish);
        session.setAttribute("currentDishId",dish.getDishId());
        return "editDish";
    }

    @RequestMapping(value="/edit",method=RequestMethod.POST)
    public String editDish(@RequestParam("dishname") String dishName, @RequestParam("dishprice")Double dishPrice,
    @RequestParam("dishPic")CommonsMultipartFile file, HttpSession session){
        int dishId = (int)session.getAttribute("currentDishId");
        DishEntity dish = dishRepository.findByDishId(dishId);
        String dishpic = dish.getDishPic();
        if(file.getOriginalFilename()!="") {
            String savePath = session.getServletContext().getRealPath("/")
                    + "/images/" + file.getOriginalFilename();
            File saveFile = new File(savePath);
            try {
                file.transferTo(saveFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
            dishpic = "images/" + file.getOriginalFilename();
        }
        dishRepository.updateDish(dishName, dishPrice, dishpic,dishId);
        dishRepository.flush();
        int resId = (int)session.getAttribute("currentResId");
        return "redirect:/resPage?resId=" + Integer.toString(resId);
    }
}
