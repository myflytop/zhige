package com.oly.common.model.enums;

/**
 * 通用配置参数
 */
public enum OlyConfigCommonEnum {
   OLY_CMS_PREIFX("oly.cms."), OLY_WBE_PREIFX("oly.web."), OLY_MAIL_PREIFX("oly.mail."), OLY_OSS_PREIFX("oly.oss."),OLY_THEME_PREFIX("oly.theme."),OLY_TAO_PREFIX("oly.tao."),SYS_PREFIX("sys.");

   private String value;

   OlyConfigCommonEnum(String value) {
      this.value = value;
   }

   public String getValue() {
      return value;
   }

}
