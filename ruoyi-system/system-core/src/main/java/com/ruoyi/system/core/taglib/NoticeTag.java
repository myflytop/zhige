package com.ruoyi.system.core.taglib;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.system.core.domain.SysNotice;
import com.ruoyi.system.core.service.ISysNoticeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service("noticeTag")
@CacheConfig(cacheNames = Constants.SYS_NOTICE_KEY)
public class NoticeTag {

    @Autowired
    private ISysNoticeService noticeService;

    @Cacheable(keyGenerator = "myKeyGenerator")
    public List<SysNotice> listNotice(int pageNum, int pageSize) {
        SysNotice notice = new SysNotice();
        notice.setStatus("0");
        PageHelper.startPage(pageNum, pageSize);

        return noticeService.selectNoticeList(notice);
    }

}
