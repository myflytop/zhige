package com.oly.framework.event;

import org.springframework.context.ApplicationEvent;

public  abstract class AbstrictAddEvent extends ApplicationEvent {
    
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private final long id;
    public AbstrictAddEvent(Object source,long id) {       
        super(source);
        this.id=id;
      
    }
    public long getId() {
        return id;
    }
}
