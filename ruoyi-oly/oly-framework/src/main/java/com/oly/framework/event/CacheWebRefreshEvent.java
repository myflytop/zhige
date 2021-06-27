package com.oly.framework.event;


/**
 * 刷新网页缓存
 */
public class CacheWebRefreshEvent extends AbstrictRefreshEvent {

    private static final long serialVersionUID = 1L;

    public CacheWebRefreshEvent(Object source,String keyPrefix) {
        super(source,keyPrefix);
    }

    
    
}
