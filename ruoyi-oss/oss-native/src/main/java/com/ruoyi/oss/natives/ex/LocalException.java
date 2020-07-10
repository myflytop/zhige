package com.ruoyi.oss.natives.ex;

public class LocalException extends Exception {
    public LocalException(String message) {
        super(message);
    }

    public LocalException(String message, Throwable cause) {
        super(message, cause);
    }
}
