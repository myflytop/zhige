package com.oly.cms.common.model.enums;

/**
 * 通用配置参数前缀
 */
public enum OlyConfigCommonEnums {
   OLY_CMS_PREFIX("oly.cms."), OLY_COMMENT_PREFIX("oly.comment."), OLY_WBE_PREFIX("oly.web."),
   OLY_MAIL_PREFIX("oly.mail."), OLY_OSS_PREFIX("oly.oss."), OLY_THEME_PREFIX("oly.theme."), OLY_TAO_PREFIX("oly.tao."),
   SYS_PREFIX("sys."), OLY_APP_PREFIX("oly.app.");

   private String value;

   OlyConfigCommonEnums(String value) {
      this.value = value;
   }

   public String getValue() {
      return value;
   }

}
