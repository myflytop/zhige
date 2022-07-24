package com.oly.cms.hand.model.enums;

public enum RecordTableEnum {
    LIKE_RECORD("cms_like_record"), COLLECT_RECORD("cms_collect_record"),
    NASTY_RECORD("cms_nasty_record"), SHARE_RECORD("cms_share_record"), SCORE_RECORD("cms_score_record");

    public String getValue() {
        return value;
    }

    private String value;

    RecordTableEnum(String value) {
        this.value = value;
    }

}
