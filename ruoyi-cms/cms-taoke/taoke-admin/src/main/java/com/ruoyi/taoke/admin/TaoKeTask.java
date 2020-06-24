package com.ruoyi.taoke.admin;

import com.ruoyi.taoke.admin.service.impl.CmsTaokeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component("taoKeTask")
public class TaoKeTask {

    @Autowired
    private CmsTaokeServiceImpl cmsTaoKeService;
    /**
     * @param time 时间形如 2020-05-14 01:23:07
     */
    public void onTimeShelves(String time)throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = simpleDateFormat.parse(time);
        long ts = date.getTime();
        cmsTaoKeService.onTimeShelves(ts);
    }
    /**
     * 定时下架
     */
    public void onTimeShelves(){
        cmsTaoKeService.onTimeShelves(System.currentTimeMillis());
    }



}
