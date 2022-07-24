package com.oly.cms.common.event;

import org.springframework.context.ApplicationEvent;

/**
 * 刷新事件
 */
public abstract class AbstrictRefreshEvent extends ApplicationEvent {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String keyPrefix;

    public AbstrictRefreshEvent(Object source, String keyPrefix) {
        super(source);
        this.keyPrefix = keyPrefix;

    }

    public String getKeyPrefix() {
        return keyPrefix;
    }
}
