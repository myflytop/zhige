package com.oly.cms.general.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.oly.cms.general.model.enums.WebBusinessType;
import com.oly.cms.general.model.enums.WebOperatorType;

/**
 * 内容前台操作
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface WebLog {
    /**
     * 模块
     */
    public String title() default "";

    /**
     * 功能
     */
    public WebBusinessType businessType() default WebBusinessType.OTHER;

    /**
     * 操作人类别
     */
    public WebOperatorType operatorType() default WebOperatorType.USER;

    /**
     * 是否保存请求的参数
     */
    public boolean isSaveRequestData() default true;
}
