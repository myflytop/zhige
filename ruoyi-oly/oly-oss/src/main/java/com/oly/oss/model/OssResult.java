package com.oly.oss.model;

import java.util.List;

import com.oly.oss.domain.OlyOss;

public class OssResult {
    private int code;
    private String msg;
    private OlyOss data;
    private List<OlyOss> datas;

    public void setDatas(List<OlyOss> datas) {
        this.datas = datas;
    }

    public List<OlyOss> getDatas() {
        return datas;
    }

    private OssResult(int code, String msg, OlyOss data, List<OlyOss> datas) {
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

    public OlyOss getData() {
        return data;
    }

    public void setData(OlyOss data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "OssResult{" + "code=" + code + ", msg='" + msg + '\'' + ", data=" + data + ", datas=" + datas + '}';
    }

    public static OssResult ok(String msg, OlyOss data) {
        return new OssResult(200, msg, data, null);
    }

    public static OssResult error(String msg, OlyOss data) {
        return new OssResult(500, msg, data, null);
    }

    public static OssResult listOk(String msg, List<OlyOss> datas) {
        return new OssResult(200, msg, null, datas);
    }
}
