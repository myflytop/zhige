package com.oly.framework.listener;

import com.oly.framework.event.AbstrictRefreshEvent;
import com.ruoyi.common.utils.CacheWebUtils;
import com.ruoyi.common.utils.StringUtils;

import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class CacheWebRefreshEventListen {
  @EventListener
  protected void handleVisitEvent(AbstrictRefreshEvent event) {
    String keyPrefix = event.getKeyPrefix();
    if (StringUtils.isEmpty(keyPrefix)) {
      CacheWebUtils.removeAll(CacheWebUtils.CACHE_NAME);
    }
    else{
      CacheWebUtils.vagueDeleteKeys(keyPrefix);
    }
  }

}
