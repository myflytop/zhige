package com.oly.cms.system.model.po.taoke;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.oly.cms.system.model.CmsTaoke;
import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;
import java.util.Date;

public class JdImportExcel extends CmsTaoke {
    private static final long serialVersionUID = 1L;
    /**
     * 商品id
     */
    @Excel(name = "商品id")
    private String shopId;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String shopName;

    /** 商品主图链接 */
    @Excel(name = "商品主图链接")
    private String shopImg;

    /** 商品详情页URL */
    @Excel(name = "商品详情页URL")
    private String shopIndex;

    /** 月销 */
    @Excel(name = "月销")
    private Long shopSales;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal shopPrice;

    /** 佣金比例 */
    @Excel(name = "佣金比例")
    private Long incomeRatio;

    /** 佣金 */
    @Excel(name = "佣金")
    private BigDecimal commission;

    /** 联盟推广链接 */
    @Excel(name = "联盟推广链接")
    private String taokeUrl;

    /** 优惠券领取链接 */
    @Excel(name = "优惠券领取链接")
    private String couponUrl;

   // 以上京东


    /** 淘宝客短链接(300天内有效) */
    @Excel(name = "淘宝客短链接(300天内有效)")
    private String sortUrl;

    /** 店铺名称 */
    @Excel(name = "店铺名称")
    private String homeName;

    /** 卖家旺旺 */
    @Excel(name = "卖家旺旺")
    private String wangName;

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
    private Integer shopFettle;

    /** 内容描述 */
    @Excel(name = "内容描述")
    private String shopContent;

    /** 关联文章Id */
    @Excel(name = "关联文章Id")
    private Long articleId;

    /** 商品来源 */
    @Excel(name = "商品来源")
    private Byte taoType;

    public Byte getTaoType() {
        return taoType;
    }

    public void setTaoType(Byte taoType) {
        this.taoType = taoType;
    }

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

    public void setShopFettle(Integer shopFettle) {
        this.shopFettle = shopFettle;
    }

    public Integer getShopFettle() {
        return shopFettle;
    }

    public void setShopContent(String shopContent) {
        this.shopContent = shopContent;
    }

    public String getShopContent() {
        return shopContent;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public Long getArticleId() {
        return articleId;
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
                .append("updateTime", getUpdateTime()).append("remark", getRemark())
                .append("shopFettle", getShopFettle()).append("shopContent", getShopContent())
                .append("articleId", getArticleId()).append("taoType", getTaoType()).toString();
    }
}
