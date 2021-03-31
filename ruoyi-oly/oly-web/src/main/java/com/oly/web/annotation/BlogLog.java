package com.oly.web.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.oly.web.mould.enums.BlogBusinessType;
import com.oly.web.mould.enums.BlogOperatorType;

/**
 * 内容前台操作
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface BlogLog {
    /**
     * 模块
     */
    public String title() default "";

    /**
     * 功能
     */
    public BlogBusinessType businessType() default BlogBusinessType.OTHER;

    /**
     * 操作人类别
     */
    public BlogOperatorType operatorType() default BlogOperatorType.USER;

    /**
     * 是否保存请求的参数
     */
    public boolean isSaveRequestData() default true;
}
