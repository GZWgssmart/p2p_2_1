package com.p2p.controller;

import com.p2p.common.UploadResult;
import com.p2p.utils.PathUtils;
import org.activiti.engine.impl.util.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/file")
public class UploadController {

    /**
     * MultipartFile接口能够接收由post请求上传的文件内容
     * @return
     */
    @PostMapping("upload")
    @ResponseBody
    public String upload(MultipartFile file) {
        String result = null;
        System.out.println(file.getName());
        System.out.println(file.getOriginalFilename());
        try {
            file.transferTo(new File(PathUtils.mkUploads(), file.getOriginalFilename()));
            Map<String,Object> map = new HashMap<String,Object>();
            Map<String,Object> map2 = new HashMap<String,Object>();
            map.put("code",0);//0表示成功，1失败
            map.put("msg","success");//提示消息
            map.put("data",map2);
            map2.put("src","/static/uploads/" + file.getOriginalFilename());//图片url
            map2.put("title",file.getOriginalFilename());//图片名称，这个会显示在输入框里
            result = new JSONObject(map).toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    @PostMapping("firist")
    @ResponseBody
    public UploadResult twoImg(MultipartFile file) {
        UploadResult a = null;
        try {
            file.transferTo(new File(PathUtils.mkUploads(), file.getOriginalFilename()));
            //0表示成功，1失败
            a = new UploadResult(0, "static/uploads/" + file.getOriginalFilename());
        } catch (IOException e) {
            a = new UploadResult(1, "失败");
        }
        return a;
    }

}
