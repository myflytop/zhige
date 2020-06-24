package com.ruoyi.blog.annotation;


import com.ruoyi.blog.mould.enums.BlogBusinessType;
import com.ruoyi.blog.mould.enums.BlogOperatorType;

import java.lang.annotation.*;

/**
 * 内容前台操作
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface BlogLog
{
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
