package com.oly.oss.enums;

/**
 * 储存文件夹
 */
public enum OssDirEnum {
  IMAGE("image"), DOCUMENT("document"), COMMPRESS("commpress"), VIDEO("video"), MEDIA("media");

  private String dir;

  OssDirEnum(String dir) {
    this.dir = dir;
  }

  public String getDir() {
    return dir;
  }

}