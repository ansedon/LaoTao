package com.controller;

import com.model.*;
import com.repository.*;
import com.service.ArticleService;
import com.service.RestaurantService;
import com.service.SearchService;
import com.service.UserService;
import com.tool.GetDate;
import com.tool.ImgUtil;
import com.tool.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;
import java.lang.ref.Reference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by tciisxy on 2017/5/7.
 */
@Controller
public class ArticleController {
    @Autowired
    ArticleRepository articleRepository;
    @Autowired
    ArtCommentRepository artCommentRepository;
    @Autowired
    ArtAgreeRepository artAgreeRepository;
    @Autowired
    ArtReportRepository artReportRepository;
    @Autowired
    ArtLikeRepository artLikeRepository;
    @Autowired
    RestaurantRepository restaurantRepository;
    @Autowired
    ArticleService articleService;
    @Autowired
    ReferRepository referRepository;
    @Autowired
    RestaurantService restaurantService;
    @Autowired
    UserService userService;

    Map<String, String> map = new HashMap<>();

    @RequestMapping(value = "/readArticle/{id}", method = RequestMethod.GET)
    public String showArticle(@PathVariable("id") Integer articleId, ModelMap modelMap, HttpSession session) {
        //获取帖子
        ArticleEntity articleEntity = articleService.findArticleByArtId(articleId);
        modelMap.addAttribute("article", articleEntity);
        //获取帖子评论
        List<ArtCommentEntity> comList = articleService.findArtComByArtId(articleId);
        modelMap.addAttribute("comList", comList);
        //为帖子增加阅读量
        articleService.updateArtReadNum(articleId);
        //获取当前用户是否点过赞
        UserEntity userEntity = (UserEntity) session.getAttribute("currentUser");
        int userId = 0;
        if (userEntity != null) {
            userId = userEntity.getUserId();
        }
        if (userId != 0) {
            //true--当前用户已点过赞；false--未登录或当前用户没有点过赞
            if (articleService.findArtAgree(userId, articleId) != null) {
                modelMap.addAttribute("ifLike", true);
            } else
                modelMap.addAttribute("ifLike", false);
        }
        //获取当前用户是否收藏
        if (userId != 0) {
            //true--当前用户已收藏；false--未登录或当前用户没有收藏
            if (articleService.findArtLike(userId, articleId) != null) {
                modelMap.addAttribute("ifCollected", true);
            } else
                modelMap.addAttribute("ifCollected", false);
        }
        //获取当前用户是否评论过
        if (userId != 0) {
            //true--当前用户已经评论过；false--未登录或当前用户没有评论
            if (articleService.findArtComment(userId, articleId) != null) {
                modelMap.addAttribute("ifComment", true);
            } else
                modelMap.addAttribute("ifComment", false);
        }
        //判断是否已举报过
        if (userId != 0) {
            //true--当前用户已举报;false--当前用户尚未举报
            if (articleService.findArtReport(userId, articleId) != null) {
                modelMap.addAttribute("ifReport", true);
            } else
                modelMap.addAttribute("ifReport", false);
        }

        //得到帖子提及的餐馆
        List<RestaurantEntity> restaurantEntityList = new ArrayList<RestaurantEntity>();
        List<ReferEntity> referEntityList = articleService.findArtReferRes(articleId);
        for (ReferEntity referEntity : referEntityList) {
            restaurantEntityList.add(referEntity.getRestaurantByReferResId());
        }
        modelMap.addAttribute("restaurant", restaurantEntityList);
        return "viewArticle";
    }

    @RequestMapping(value = "/artComment", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> commentArticle(@RequestBody Map<String, String> data, HttpSession session) {
        UserEntity userEntity = (UserEntity) session.getAttribute("currentUser");
        String comment = data.get("comment").trim();
        int artId = Integer.parseInt(data.get("artId").trim());
        ArtCommentEntity artCommentEntity = new ArtCommentEntity();
        artCommentEntity.setArtComContent(comment);
        artCommentEntity.setComArtId(artId);
        GetDate getTime = new GetDate();
        java.sql.Date comTime = null;
        comTime = getTime.getNetworkTime("http://www.baidu.com");
        if (comTime == null)
            comTime = new java.sql.Date(new java.util.Date().getTime());
        artCommentEntity.setArtComTime(comTime);
        artCommentEntity.setCommentatorId(userEntity.getUserId());
        artCommentRepository.saveAndFlush(artCommentEntity);
        //更新经验和等级
        userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),5);
        session.setAttribute("currentUser",userEntity);
        map.put("msg", "评论完成");
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }

    @RequestMapping(value = "/artAgree", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> agreeArticle(@RequestBody Map<String, String> data, HttpSession session) {
        UserEntity userEntity = (UserEntity) session.getAttribute("currentUser");
        int artId = Integer.parseInt(data.get("artId").trim());
        if (userEntity == null)
            map.put("msg", "未登录");
        else {
            map = articleService.agreeOrNot(userEntity.getUserId(), artId);
        }
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }

    @RequestMapping(value = "/artCollect", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> collectArticle(@RequestBody Map<String, String> data, HttpSession session) {
        UserEntity userEntity = (UserEntity) session.getAttribute("currentUser");
        int artId = Integer.parseInt(data.get("artId").trim());
        if (userEntity == null)
            map.put("msg", "未登录");
        else {
            map = articleService.collectOrNot(userEntity.getUserId(), artId);
            //更新经验和等级
            userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),5);
            session.setAttribute("currentUser",userEntity);
        }
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }

    @RequestMapping(value = "/artReport", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> reportArticle(@RequestBody Map<String, String> data, HttpSession session) {
        UserEntity userEntity = (UserEntity) session.getAttribute("currentUser");
        int artId = Integer.parseInt(data.get("artId").trim());
        if (userEntity == null)
            map.put("msg", "未登录");
        else {
            map = articleService.reportOrNot(userEntity.getUserId(), artId);
            if(map.get("msg")=="举报成功")
            {
                //更新经验和等级
                userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),-100);
                session.setAttribute("currentUser",userEntity);
            }
                else
            {
                //更新经验和等级
                userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),100);
                session.setAttribute("currentUser",userEntity);
            }

        }
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }

    @RequestMapping(value = "/writeArticle", method = RequestMethod.GET)
    public String writeArticle() {
        return "writeArticle";
    }

    @RequestMapping(value = "/postArticle", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> postRoute(@RequestBody Map<String, String> data, HttpSession session) {
        Map<String, String> map = new HashMap<>();
        ArticleEntity articleEntity = new ArticleEntity();
        articleEntity.setArtAgreeNum(0);
        articleEntity.setArtLikesNum(0);
        articleEntity.setArtReadNum(0);
        articleEntity.setArtAddrProvince(data.get("artAddrProvince").trim());
        articleEntity.setArtAddrCity(data.get("artAddrCity").trim());
        articleEntity.setArtUserId(Integer.parseInt(data.get("userId").trim()));
        articleEntity.setArtContent(data.get("content").trim());
        GetDate getDate = new GetDate();
        java.sql.Date time = null;
        time = getDate.getNetworkTime("http://www.baidu.com");
        if (time == null)
            time = new java.sql.Date(new java.util.Date().getTime());
        articleEntity.setArtPostTime(time);
        articleEntity.setArtTitle(data.get("artTitle").trim());
        List list = ImgUtil.getImageSrc(data.get("content").trim());
        String picturePath = null;
        if (list.size() > 0) picturePath = StringUtil.listToString(list, ',');
        else picturePath = "images/1482598428903086856.png";
        articleEntity.setArtTitlePic(picturePath);
        ArticleEntity article = articleRepository.saveAndFlush(articleEntity);
        //更新经验和等级
        UserEntity userEntity=(UserEntity)session.getAttribute("currentUser");
        userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),2);
        session.setAttribute("currentUser",userEntity);
        session.setAttribute("currentUser",userEntity);
        session.setAttribute("referArtId", article.getArtId());
        map.put("msg", "success");
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }


    @RequestMapping(value = "/refer", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> refer(@RequestBody Map<String, String> data, HttpSession session) {
        Map<String, String> map = new HashMap<>();
        ReferEntity referEntity = new ReferEntity();
        referEntity.setReferArtId(Integer.parseInt(data.get("artId").trim()));
        referEntity.setReferResId(Integer.parseInt(data.get("resId").trim()));
        referRepository.saveAndFlush(referEntity);
        //更新经验和等级
        UserEntity userEntity=(UserEntity)session.getAttribute("currentUser");
        userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),5);
        session.setAttribute("currentUser",userEntity);

        //餐馆提及数量加一
        restaurantService.updateResReferNum(1, referEntity.getReferResId());
        List<RestaurantEntity> restaurantEntityList = (List<RestaurantEntity>) session.getAttribute("referResList");
        if (restaurantEntityList == null)
            restaurantEntityList = new ArrayList<>();
        restaurantEntityList.add(restaurantService.findByResId(Integer.parseInt(data.get("resId").trim())));
        session.setAttribute("referResList", restaurantEntityList);
        map.put("msg", "success");
        RestaurantEntity restaurantEntity = restaurantService.findByResId(referEntity.getReferResId());
        map.put("resId", Integer.toString(restaurantEntity.getResId()));
        map.put("resAddrCity", restaurantEntity.getResAddrCity());
        map.put("resAddrStreet", restaurantEntity.getResAddrStreet());
        map.put("resScore", Double.toString(restaurantEntity.getResScore()));
        map.put("resName", restaurantEntity.getResName());
        map.put("resPic", restaurantEntity.getResPic());
        map.put("resReferNum", Integer.toString(restaurantEntity.getResReferNum()));
        map.put("resAverageCost", Integer.toString(restaurantEntity.getResAverageCost()));
        map.put("resStyle", restaurantEntity.getResStyle());
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }

    @RequestMapping(value = "/cancelRefer", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> cancelRefer(@RequestBody Map<String, String> data, HttpSession session) {
        Map<String, String> map = new HashMap<>();
        ReferEntity referEntity = new ReferEntity();
        referEntity.setReferArtId(Integer.parseInt(data.get("artId").trim()));
        referEntity.setReferResId(Integer.parseInt(data.get("resId").trim()));
        try {
            referRepository.delete(referEntity);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //餐馆提及数量减一
        restaurantService.updateResReferNum(-1, referEntity.getReferResId());
        RestaurantEntity restaurantEntity = restaurantService.findByResId(referEntity.getReferResId());
        //更新经验和等级
        UserEntity userEntity=(UserEntity)session.getAttribute("currentUser");
        userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),-5);
        session.setAttribute("currentUser",userEntity);

        //在session中减去当前restaurant
        List<RestaurantEntity> restaurantEntityList = (List<RestaurantEntity>) session.getAttribute("referResList");
        try {
            if (restaurantEntityList.size() > 0) {
                int i = 0;
                while (restaurantEntityList.get(i).getResId() != referEntity.getReferResId()) {
                    i++;
                    if(i==restaurantEntityList.size()) {
                        break;
                    }
                }
                if (i < restaurantEntityList.size()) {
                    if (restaurantEntityList.get(i).getResId() == referEntity.getReferResId())
                        restaurantEntityList.remove(i);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("referResList", restaurantEntityList);
        map.put("msg", "success");
        map.put("resId", Integer.toString(restaurantEntity.getResId()));
        map.put("resAddrCity", restaurantEntity.getResAddrCity());
        map.put("resAddrStreet", restaurantEntity.getResAddrStreet());
        map.put("resScore", Double.toString(restaurantEntity.getResScore()));
        map.put("resName", restaurantEntity.getResName());
        map.put("resPic", restaurantEntity.getResPic());
        map.put("resReferNum", Integer.toString(restaurantEntity.getResReferNum()));
        map.put("resAverageCost", Integer.toString(restaurantEntity.getResAverageCost()));
        map.put("resStyle", restaurantEntity.getResStyle());
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }
}
