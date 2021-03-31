package com.oly.framework.listener;

import com.oly.framework.event.AbstrictAddEvent;

import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
@Component
public class AddArticleEventListen {
    @EventListener
    protected void handleVisitEvent(AbstrictAddEvent event)  {   
       System.out.println(event.getId()+"11111111111111111111111111111111");
   
    }
    @EventListener
    protected void handleVisitEvent2(AbstrictAddEvent event)  {   
       System.out.println(event.getId()+"2222222222222222222222222222222");
   
    }
}
