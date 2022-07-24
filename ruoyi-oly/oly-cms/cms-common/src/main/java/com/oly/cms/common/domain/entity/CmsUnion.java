package com.oly.cms.common.domain.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 联盟推广
 * 
 * @author zg
 * @date 2022-05-30
 */
public class CmsUnion extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 商品id */
    @Excel(name = "商品id")
    private String shopId;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String shopName;

    /** 商品主图 */
    @Excel(name = "商品主图")
    private String shopImg;

    /** 商品详情页链接地址 */
    @Excel(name = "商品详情页链接地址")
    private String shopIndex;

    /** 店铺名称 */
    @Excel(name = "店铺名称")
    private String homeName;

    /** 商品价格(单位：元) */
    @Excel(name = "商品价格(单位：元)")
    private BigDecimal shopPrice;

    /** 商品月销量 */
    @Excel(name = "商品月销量")
    private Long shopSales;

    /** 收入比率(%) */
    @Excel(name = "收入比率(%)")
    private Long incomeRatio;

    /** 佣金 */
    @Excel(name = "佣金")
    private BigDecimal commission;

    /** 卖家旺旺 */
    @Excel(name = "卖家旺旺")
    private String wangName;

    /** 淘宝客短链接(300天内有效) */
    @Excel(name = "淘宝客短链接(300天内有效)")
    private String sortUrl;

    /** 淘宝客链接 */
    @Excel(name = "淘宝客链接")
    private String taokeUrl;

    /** 优惠券总量 */
    @Excel(name = "优惠券总量")
    private Long couponCount;

    /** 优惠券剩余量 */
    @Excel(name = "优惠券剩余量")
    private Long couponNum;

    /** 优惠券面额 */
    @Excel(name = "优惠券面额")
    private BigDecimal couponPrice;

    /** 优惠券开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "优惠券开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date couponStartTime;

    /** 优惠券结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "优惠券结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date couponEndTime;

    /** 优惠券链接 */
    @Excel(name = "优惠券链接")
    private String couponUrl;

    /** 优惠券淘口令(30天内有效) */
    @Excel(name = "优惠券淘口令(30天内有效)")
    private String couponCode;

    /** 优惠券短链接(300天内有效) */
    @Excel(name = "优惠券短链接(300天内有效)")
    private String couponSortUrl;

    /** 是否为营销计划商品 */
    @Excel(name = "是否为营销计划商品")
    private String marketIs;

    /** 拼团人数 */
    @Excel(name = "拼团人数")
    private Long groupNum;

    /** 拼团价 */
    @Excel(name = "拼团价")
    private BigDecimal groupPrice;

    /** 团队佣金比例 */
    @Excel(name = "团队佣金比例")
    private BigDecimal groupCommission;

    /** 拼团开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "拼团开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date groupStartTime;

    /** 拼团结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "拼团结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date groupEndTime;

    /** 商品状态 */
    @Excel(name = "商品状态")
    private Integer visible;

    /** 内容描述 */
    @Excel(name = "内容描述")
    private String shopContent;

    /** 联盟来源 */
    @Excel(name = "联盟来源")
    private String unionType;

    /* 关联标签 */
    private String tags;

    /* 关联分类 */
    private String cats;

    public void setShopId(String shopId) {

        this.shopId = shopId;
    }

    @NotBlank(message = "商品ID不能为空")
    public String getShopId() {
        return shopId;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    @NotBlank(message = "商品名不能为空")
    public String getShopName() {
        return shopName;
    }

    public void setShopImg(String shopImg) {
        this.shopImg = shopImg;
    }

    public String getShopImg() {
        return shopImg;
    }

    public void setShopIndex(String shopIndex) {
        this.shopIndex = shopIndex;
    }

    @NotBlank(message = "商品页不能为空")
    public String getShopIndex() {
        return shopIndex;
    }

    public void setHomeName(String homeName) {
        this.homeName = homeName;
    }

    public String getHomeName() {
        return homeName;
    }

    public void setShopPrice(BigDecimal shopPrice) {
        this.shopPrice = shopPrice;
    }

    public BigDecimal getShopPrice() {
        return shopPrice;
    }

    public void setShopSales(Long shopSales) {
        this.shopSales = shopSales;
    }

    public Long getShopSales() {
        return shopSales;
    }

    public void setIncomeRatio(Long incomeRatio) {
        this.incomeRatio = incomeRatio;
    }

    public Long getIncomeRatio() {
        return incomeRatio;
    }

    public void setCommission(BigDecimal commission) {
        this.commission = commission;
    }

    public BigDecimal getCommission() {
        return commission;
    }

    public void setWangName(String wangName) {
        this.wangName = wangName;
    }

    public String getWangName() {
        return wangName;
    }

    public void setSortUrl(String sortUrl) {
        this.sortUrl = sortUrl;
    }

    public String getSortUrl() {
        return sortUrl;
    }

    public void setTaokeUrl(String taokeUrl) {
        this.taokeUrl = taokeUrl;
    }

    @NotBlank(message = "推广链接不能为空")
    public String getTaokeUrl() {
        return taokeUrl;
    }

    public void setCouponCount(Long couponCount) {
        this.couponCount = couponCount;
    }

    public Long getCouponCount() {
        return couponCount;
    }

    public void setCouponNum(Long couponNum) {
        this.couponNum = couponNum;
    }

    public Long getCouponNum() {
        return couponNum;
    }

    public void setCouponPrice(BigDecimal couponPrice) {
        this.couponPrice = couponPrice;
    }

    public BigDecimal getCouponPrice() {
        return couponPrice;
    }

    public void setCouponStartTime(Date couponStartTime) {
        this.couponStartTime = couponStartTime;
    }

    public Date getCouponStartTime() {
        return couponStartTime;
    }

    public void setCouponEndTime(Date couponEndTime) {
        this.couponEndTime = couponEndTime;
    }

    public Date getCouponEndTime() {
        return couponEndTime;
    }

    /**
     * @return the visible
     */
    public Integer getVisible() {
        return visible;
    }

    /**
     * @param visible the visible to set
     */
    public void setVisible(Integer visible) {
        this.visible = visible;
    }

    public void setCouponUrl(String couponUrl) {
        this.couponUrl = couponUrl;
    }

    public String getCouponUrl() {
        return couponUrl;
    }

    public void setCouponCode(String couponCode) {
        this.couponCode = couponCode;
    }

    public String getCouponCode() {
        return couponCode;
    }

    public void setCouponSortUrl(String couponSortUrl) {
        this.couponSortUrl = couponSortUrl;
    }

    public String getCouponSortUrl() {
        return couponSortUrl;
    }

    public void setMarketIs(String marketIs) {
        this.marketIs = marketIs;
    }

    public String getMarketIs() {
        return marketIs;
    }

    public void setGroupNum(Long groupNum) {
        this.groupNum = groupNum;
    }

    public Long getGroupNum() {
        return groupNum;
    }

    public void setGroupPrice(BigDecimal groupPrice) {
        this.groupPrice = groupPrice;
    }

    public BigDecimal getGroupPrice() {
        return groupPrice;
    }

    public void setGroupCommission(BigDecimal groupCommission) {
        this.groupCommission = groupCommission;
    }

    public BigDecimal getGroupCommission() {
        return groupCommission;
    }

    public void setGroupStartTime(Date groupStartTime) {
        this.groupStartTime = groupStartTime;
    }

    public Date getGroupStartTime() {
        return groupStartTime;
    }

    public void setGroupEndTime(Date groupEndTime) {
        this.groupEndTime = groupEndTime;
    }

    public Date getGroupEndTime() {
        return groupEndTime;
    }

    public void setShopContent(String shopContent) {
        this.shopContent = shopContent;
    }

    public String getShopContent() {
        return shopContent;
    }

    /**
     * @return the unionType
     */
    public String getUnionType() {
        return unionType;
    }

    /**
     * @param unionType the unionType to set
     */
    public void setUnionType(String unionType) {
        this.unionType = unionType;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getCats() {
        return cats;
    }

    public void setCats(String cats) {
        this.cats = cats;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("shopId", getShopId())
                .append("shopName", getShopName()).append("shopImg", getShopImg()).append("shopIndex", getShopIndex())
                .append("homeName", getHomeName()).append("shopPrice", getShopPrice())
                .append("shopSales", getShopSales()).append("incomeRatio", getIncomeRatio())
                .append("commission", getCommission()).append("wangName", getWangName()).append("sortUrl", getSortUrl())
                .append("taokeUrl", getTaokeUrl()).append("couponCount", getCouponCount())
                .append("couponNum", getCouponNum()).append("couponPrice", getCouponPrice())
                .append("couponStartTime", getCouponStartTime()).append("couponEndTime", getCouponEndTime())
                .append("couponUrl", getCouponUrl()).append("couponCode", getCouponCode())
                .append("couponSortUrl", getCouponSortUrl()).append("marketIs", getMarketIs())
                .append("groupNum", getGroupNum()).append("groupPrice", getGroupPrice())
                .append("groupCommission", getGroupCommission()).append("groupStartTime", getGroupStartTime())
                .append("groupEndTime", getGroupEndTime()).append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime()).append("remark", getRemark()).append("visible", getVisible())
                .append("shopContent", getShopContent()).append("unionType", getUnionType())
                .append("cats", getCats()).append("tags", getTags()).toString();
    }
}
