package com.ruoyi.demo.exception;

import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class DemoExceptionHandler {
    /**
     * 演示模式异常
     */
    @ExceptionHandler(DemoModeException.class)
    public AjaxResult handleDemoModeException(DemoModeException e) {
        return AjaxResult.error("演示模式，不允许操作");
    }
}
