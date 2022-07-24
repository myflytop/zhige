package com.oly.cms.common.listener;

import com.oly.cms.common.event.CacheWebRefreshAllEvent;
import com.oly.cms.common.utils.CacheWebUtils;

import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class CacheWebRefreshAllEventListen {

  @EventListener
  protected void handleVisitEvent(CacheWebRefreshAllEvent event) {
    CacheWebUtils.removeAll(event.getKeyPrefix());
  }

}
