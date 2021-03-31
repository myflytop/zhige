package com.oly.mail.service;

import com.oly.mail.domain.MailUsedEnums;
import com.oly.mail.domain.OlyMail;
import java.util.List;
import java.util.Map;

/**
 * 邮件Service接口
 * 
 * @author hush
 * @date 2021-03-06
 */
public interface IOlyMailService {
        /**
         * 查询邮件
         * 
         * @param mailId 邮件ID
         * @return 邮件
         */
        public OlyMail selectOlyMailById(Long mailId);

        /**
         * 查询邮件列表
         * 
         * @param olyMail 邮件
         * @return 邮件集合
         */
        public List<OlyMail> selectOlyMailList(OlyMail olyMail);

        /**
         * 新增邮件
         * 
         * @param olyMail 邮件
         * @return 结果
         */
        public int insertOlyMail(OlyMail olyMail);

        /**
         * 修改邮件
         * 
         * @param olyMail 邮件
         * @return 结果
         */
        public int updateOlyMail(OlyMail olyMail);

        /**
         * 批量删除邮件
         * 
         * @param ids 需要删除的数据ID
         * @return 结果
         */
        public int deleteOlyMailByIds(String ids);

        /**
         * 删除邮件信息
         * 
         * @param mailId 邮件ID
         * @return 结果
         */
        public int deleteOlyMailById(Long mailId);

        /**
         * 发送简单邮件
         *
         * @param to             发送地址
         * @param subject        主题
         * @param content        内容
         * @param attachFilePath 附件路径
         * @param cc             抄送 多个逗号隔开
         * @param bcc            密送 多个逗号隔开
         */
        void sendTextMail(OlyMail olyMail);

        /**
         * 发送模板邮件
         *
         * @param to             发送地址
         * @param subject        主题
         * @param content        内容
         * @param attachFilePath 附件路径
         * @param cc             抄送 多个逗号隔开
         * @param bcc            密送 多个逗号隔开
         */
        void sendTemplateMail(OlyMail olyMail, Map<String, Object> content);

        /**
         * 发送纯邮件
         *
         * @param to             发送地址
         * @param subject        主题
         * @param content        内容
         * @param attachFilePath 附件路径
         * @param cc             抄送 多个逗号隔开
         * @param bcc            密送 多个逗号隔开
         */
        void sendHtmlMail(OlyMail olyMail);

        /**
         * 测试连接
         */
        void testConnection();

        public void send(OlyMail olyMail, Map<String, Object> content);
}
