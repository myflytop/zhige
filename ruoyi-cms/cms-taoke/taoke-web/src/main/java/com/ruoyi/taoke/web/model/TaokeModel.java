package com.ruoyi.taoke.web.model;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 淘客对象 cms_taoke
 *
 * @author ruoyi
 * @date 2020-05-07
 */
public class TaokeModel extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 商品id
     */

    private String shopId;

    /**
     * 商品名字
     */
    private String shopName;

    /**
     * 商品主图
     */
    private String shopImg;

    /**
     * 商品主页
     */
    private String shopIndex;

    /**
     * 店铺名字
     */
    private String homeName;

    /**
     * 商品价格
     */
    private Double shopPrice;

    /**
     * 商品月销量
     */
    private Long shopSales;

    /**
     * 收入比例
     */
    private Long incomeRatio;

    /**
     * 佣金
     */
    private Double commission;

    /**
     * 商家旺旺名
     */
    private String wangName;

    /**
     * 淘宝客短链接
     */
    private String sortUrl;

    /**
     * 淘宝客长链接
     */
    private String taokeUrl;

    /**
     * 优惠券总量
     */
    private Long couponCount;

    /**
     * 优惠券剩余量
     */
    private Long couponNum;

    /**
     * 优惠券价值
     */
    private Double couponPrice;

    /**
     * 优惠券开始时间
     */
    @Excel(name = "优惠券开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date couponStartTime;

    /**
     * 优惠券结束时间
     */
    @Excel(name = "优惠券结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date couponEndTime;

    /**
     * 优惠券领取地址
     */
    private String couponUrl;

    /**
     * 优惠券淘口
     */
    private String couponCode;

    /**
     * 优惠券领取短链
     */
    private String couponSortUrl;

    /**
     * 是否为营销
     */
    private String marketIs;

    /**
     * 拼团人数
     */
    private Long groupNum;

    /**
     * 拼团价
     */
    private Double groupPrice;

    /**
     * 团队佣金比例
     */
    private Double groupCommission;

    /**
     * 拼团开始时间
     */
    private Date groupStartTime;

    /**
     * 拼团结束时间
     */
    private Date groupEndTime;

    /**
     * 商品状态
     */
    private Byte shopFettle;

    /**
     * 内容描述
     */
    private String shopContent;

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

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

    public String getShopIndex() {
        return shopIndex;
    }

    public void setHomeName(String homeName) {
        this.homeName = homeName;
    }

    public String getHomeName() {
        return homeName;
    }

    public void setShopPrice(Double shopPrice) {
        this.shopPrice = shopPrice;
    }

    public Double getShopPrice() {
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

    public void setCommission(Double commission) {
        this.commission = commission;
    }

    public Double getCommission() {
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

    public void setCouponPrice(Double couponPrice) {
        this.couponPrice = couponPrice;
    }

    public Double getCouponPrice() {
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

    public void setGroupPrice(Double groupPrice) {
        this.groupPrice = groupPrice;
    }

    public Double getGroupPrice() {
        return groupPrice;
    }

    public void setGroupCommission(Double groupCommission) {
        this.groupCommission = groupCommission;
    }

    public Double getGroupCommission() {
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

    public void setShopFettle(Byte shopFettle) {
        this.shopFettle = shopFettle;
    }

    public Byte getShopFettle() {
        return shopFettle;
    }

    public void setShopContent(String shopContent) {
        this.shopContent = shopContent;
    }

    public String getShopContent() {
        return shopContent;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("shopId", getShopId())
                .append("shopName", getShopName())
                .append("shopImg", getShopImg())
                .append("shopIndex", getShopIndex())
                .append("homeName", getHomeName())
                .append("shopPrice", getShopPrice())
                .append("shopSales", getShopSales())
                .append("incomeRatio", getIncomeRatio())
                .append("commission", getCommission())
                .append("wangName", getWangName())
                .append("sortUrl", getSortUrl())
                .append("taokeUrl", getTaokeUrl())
                .append("couponCount", getCouponCount())
                .append("couponNum", getCouponNum())
                .append("couponPrice", getCouponPrice())
                .append("couponStartTime", getCouponStartTime())
                .append("couponEndTime", getCouponEndTime())
                .append("couponUrl", getCouponUrl())
                .append("couponCode", getCouponCode())
                .append("couponSortUrl", getCouponSortUrl())
                .append("marketIs", getMarketIs())
                .append("groupNum", getGroupNum())
                .append("groupPrice", getGroupPrice())
                .append("groupCommission", getGroupCommission())
                .append("groupStartTime", getGroupStartTime())
                .append("groupEndTime", getGroupEndTime())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .append("shopFettle", getShopFettle())
                .append("shopContent", getShopContent())
                .toString();
    }
}
