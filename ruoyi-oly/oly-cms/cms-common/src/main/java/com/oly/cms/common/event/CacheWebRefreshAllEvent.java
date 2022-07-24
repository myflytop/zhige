package com.oly.cms.common.event;

/**
 * 刷新网页缓存
 */
public class CacheWebRefreshAllEvent extends AbstrictRefreshEvent {

    private static final long serialVersionUID = 1L;

    public CacheWebRefreshAllEvent(Object source, String keyPrefix) {
        super(source, keyPrefix);
    }

}
