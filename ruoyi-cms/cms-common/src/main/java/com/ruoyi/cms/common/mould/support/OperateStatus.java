package com.ruoyi.cms.common.mould.support;
public class OperateStatus {
    private OperateStatusEnum code;
    private String msg;
    private  Object data;
    public enum  OperateStatusEnum {
        FAIL,
        SUCCESS,
        WARN;
    }
    private OperateStatus(final OperateStatusEnum code, final String msg, final Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static OperateStatus  ok( final Object data){
        return new OperateStatus(OperateStatusEnum.SUCCESS,null,data);
    }
    public static OperateStatus  ok(){
        return new OperateStatus(OperateStatusEnum.SUCCESS,null,null);
    }
    public static OperateStatus  fail(final String msg, final Object data){
        return new OperateStatus(OperateStatusEnum.FAIL,msg,data);
    }
    public static OperateStatus  fail(final String msg){
        return new OperateStatus(OperateStatusEnum.FAIL,msg,null);
    }
    public static OperateStatus  fail(){
        return new OperateStatus(OperateStatusEnum.FAIL,null,null);
    }
    public static OperateStatus  warn(final String msg, final Object data){
        return new OperateStatus(OperateStatusEnum.WARN,msg,data);
    }
    public static OperateStatus  warn(final String msg){
        return new OperateStatus(OperateStatusEnum.WARN,msg,null);
    }
    public static OperateStatus  warn(){
        return new OperateStatus(OperateStatusEnum.WARN,null,null);
    }

}
