package com.ruoyi.oss.api;

import java.util.List;

public class OssResult {
    private int code;
    private String msg;
    private ResultData data;
    private List<ResultData> datas;
    public void setDatas(List<ResultData> datas) {
        this.datas = datas;
    }

    public List<ResultData> getDatas() {
        return datas;
    }

    private   OssResult(int code, String msg, ResultData data,List<ResultData> datas) {
        this.code = code;
        this.msg = msg;
        this.data = data;
        this.datas = datas;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ResultData getData() {
        return data;
    }

    public void setData(ResultData data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "OssResult{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                ", datas=" + datas +
                '}';
    }

    public  static OssResult ok(String msg,ResultData data){
        return new OssResult(200,msg,data,null);
    }
    public  static OssResult error(String msg,ResultData data){
        return new OssResult(500,msg,data,null);
    }
    public  static OssResult listOk(String msg,List<ResultData> datas){
        return new OssResult(200,msg,null,datas);
    }
}
