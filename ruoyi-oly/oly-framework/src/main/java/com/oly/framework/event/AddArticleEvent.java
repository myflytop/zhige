package com.oly.framework.event;


public class AddArticleEvent extends AbstrictAddEvent {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    public AddArticleEvent(Object source,long articleId) {
        super(source,articleId);
    }
    
}
