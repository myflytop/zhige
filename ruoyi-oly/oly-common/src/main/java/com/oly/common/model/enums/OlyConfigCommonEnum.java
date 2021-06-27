package com.oly.common.model.enums;

/**
 * 通用配置参数前缀
 */
public enum OlyConfigCommonEnum {
   OLY_CMS_PREIFX("oly.cms."),OLY_COMMENT_PREIFX("oly.comment."), OLY_WBE_PREIFX("oly.web."), OLY_MAIL_PREIFX("oly.mail."), OLY_OSS_PREIFX("oly.oss."),OLY_THEME_PREFIX("oly.web.theme."),OLY_TAO_PREFIX("oly.tao."),SYS_PREFIX("sys."),OLY_APP_PREFIX("oly.app.");

   private String value;

   OlyConfigCommonEnum(String value) {
      this.value = value;
   }

   public String getValue() {
      return value;
   }

}
