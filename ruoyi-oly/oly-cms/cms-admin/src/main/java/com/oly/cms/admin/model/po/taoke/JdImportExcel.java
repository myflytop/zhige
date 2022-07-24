package com.oly.cms.admin.model.po.taoke;

import java.math.BigDecimal;

import com.oly.cms.common.domain.entity.CmsUnion;
import com.ruoyi.common.annotation.Excel;

public class JdImportExcel extends CmsUnion {
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

    /**
     * @return the shopId
     */
    public String getShopId() {
        return shopId;
    }

    /**
     * @param shopId the shopId to set
     */
    public void setShopId(String shopId) {
        this.shopId = shopId;
    }

    /**
     * @return the shopName
     */
    public String getShopName() {
        return shopName;
    }

    /**
     * @param shopName the shopName to set
     */
    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    /**
     * @return the shopImg
     */
    public String getShopImg() {
        return shopImg;
    }

    /**
     * @param shopImg the shopImg to set
     */
    public void setShopImg(String shopImg) {
        this.shopImg = shopImg;
    }

    /**
     * @return the shopIndex
     */
    public String getShopIndex() {
        return shopIndex;
    }

    /**
     * @param shopIndex the shopIndex to set
     */
    public void setShopIndex(String shopIndex) {
        this.shopIndex = shopIndex;
    }

    /**
     * @return the shopSales
     */
    public Long getShopSales() {
        return shopSales;
    }

    /**
     * @param shopSales the shopSales to set
     */
    public void setShopSales(Long shopSales) {
        this.shopSales = shopSales;
    }

    /**
     * @return the shopPrice
     */
    public BigDecimal getShopPrice() {
        return shopPrice;
    }

    /**
     * @param shopPrice the shopPrice to set
     */
    public void setShopPrice(BigDecimal shopPrice) {
        this.shopPrice = shopPrice;
    }

    /**
     * @return the incomeRatio
     */
    public Long getIncomeRatio() {
        return incomeRatio;
    }

    /**
     * @param incomeRatio the incomeRatio to set
     */
    public void setIncomeRatio(Long incomeRatio) {
        this.incomeRatio = incomeRatio;
    }

    /**
     * @return the commission
     */
    public BigDecimal getCommission() {
        return commission;
    }

    /**
     * @param commission the commission to set
     */
    public void setCommission(BigDecimal commission) {
        this.commission = commission;
    }

    /**
     * @return the taokeUrl
     */
    public String getTaokeUrl() {
        return taokeUrl;
    }

    /**
     * @param taokeUrl the taokeUrl to set
     */
    public void setTaokeUrl(String taokeUrl) {
        this.taokeUrl = taokeUrl;
    }

    /**
     * @return the couponUrl
     */
    public String getCouponUrl() {
        return couponUrl;
    }

    /**
     * @param couponUrl the couponUrl to set
     */
    public void setCouponUrl(String couponUrl) {
        this.couponUrl = couponUrl;
    }

    // 以上京东

}
