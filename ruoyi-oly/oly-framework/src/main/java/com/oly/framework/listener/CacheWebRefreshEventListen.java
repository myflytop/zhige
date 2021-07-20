package com.oly.framework.listener;

import com.oly.framework.event.AbstrictRefreshEvent;
import com.ruoyi.common.utils.CacheWebUtils;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class CacheWebRefreshEventListen {
  @EventListener
  protected void handleVisitEvent(AbstrictRefreshEvent event) {
      CacheWebUtils.removeAll(event.getKeyPrefix());
    
  }

}
