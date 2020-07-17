package com.ruoyi.cms.system.model.po;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class CmsTheme implements Serializable {

	private static final long serialVersionUID = 1L;
    //唯一
	private Integer themeId;
    //主题名字
    private String themeName;
    //唯一 文件夹名字
    private String folder;
    //作者
    private String themeAuthor;
    //上传时间
    private String themeUpdate;
    //更新时间
    private Date createTime;
    //主题信息
    private String themeInfo;
    //主题版本
    private String themeVersion;
    //是否启用
    private Byte themeEnabled;
    //联系方式
    private String themeTouch;
    //上传者
    private Long createBy;

    public String getFolder() {
        return this.folder;
    }

    public void setFolder(final String folder) {
        this.folder = folder;
    }

    public Integer getThemeId() {
        return themeId;
    }

    public void setThemeId(Integer themeId) {
        this.themeId = themeId;
    }

    public String getThemeName() {
        return themeName;
    }

    public void setThemeName(String themeName) {
        this.themeName = themeName == null ? null : themeName.trim();
    }

    public String getThemeAuthor() {
        return themeAuthor;
    }

    public void setThemeAuthor(String themeAuthor) {
        this.themeAuthor = themeAuthor == null ? null : themeAuthor.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getThemeInfo() {
        return themeInfo;
    }

    public void setThemeInfo(String themeInfo) {
        this.themeInfo = themeInfo == null ? null : themeInfo.trim();
    }

    public Byte getThemeEnabled() {
        return themeEnabled;
    }

    public void setThemeEnabled(Byte themeEnabled) {
        this.themeEnabled = themeEnabled;
    }

    public String getThemeTouch() {
        return themeTouch;
    }

    public void setThemeTouch(String themeTouch) {
        this.themeTouch = themeTouch == null ? null : themeTouch.trim();
    }

    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }

	public String getThemeUpdate() {
		return themeUpdate;
	}

	public void setThemeUpdate(String themeUpdate) {
		this.themeUpdate = themeUpdate;
	}

	public String getThemeVersion() {
		return themeVersion;
	}

	public void setThemeVersion(String themeVersion) {
		this.themeVersion = themeVersion;
	}

    @Override
    public String toString() {
        return "CmsTheme{" +
                "themeId=" + themeId +
                ", themeName='" + themeName + '\'' +
                ", themeAuthor='" + themeAuthor + '\'' +
                ", themeUpdate='" + themeUpdate + '\'' +
                ", createTime=" + createTime +
                ", themeInfo='" + themeInfo + '\'' +
                ", themeVersion='" + themeVersion + '\'' +
                ", themeEnabled=" + themeEnabled +
                ", themeTouch='" + themeTouch + '\'' +
                ", createBy=" + createBy +
                ", folder=" + folder+
                '}';
    }
}