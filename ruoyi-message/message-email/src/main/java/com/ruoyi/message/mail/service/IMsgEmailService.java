package com.ruoyi.message.mail.service;

import com.ruoyi.message.mail.domain.MailUsedEnums;
import com.ruoyi.message.mail.domain.MsgEmail;

import javax.mail.MessagingException;
import java.util.List;
import java.util.Map;

/**
 * 邮件记录Service接口
 * 
 * @author ruoyi
 * @date 2020-03-17
 */
public interface IMsgEmailService
{
    /**
     * 查询邮件记录
     * 
     * @param mailId 邮件记录ID
     * @return 邮件记录
     */
    public MsgEmail selectMsgEmailById(Long mailId);

    /**
     * 查询邮件记录列表
     * 
     * @param msgEmail 邮件记录
     * @return 邮件记录集合
     */
    public List<MsgEmail> selectMsgEmailList(MsgEmail msgEmail);

    /**
     * 新增邮件记录
     * 
     * @param msgEmail 邮件记录
     * @return 结果
     */
    public int insertMsgEmail(MsgEmail msgEmail);

    /**
     * 修改邮件记录
     * 
     * @param msgEmail 邮件记录
     * @return 结果
     */
    public int updateMsgEmail(MsgEmail msgEmail);

    /**
     * 批量删除邮件记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMsgEmailByIds(String ids);

    /**
     * 删除邮件记录信息
     * 
     * @param mailId 邮件记录ID
     * @return 结果
     */
    public int deleteMsgEmailById(Long mailId);

    /**
     * 发送简单邮件
     *
     * @param to      发送地址
     * @param subject 主题
     * @param content 内容
     * @param attachFilePath 附件路径
     * @param cc  抄送 多个逗号隔开
     * @param bcc 密送 多个逗号隔开
     */
    void sendTextMail(String to, String subject, String content, String attachFilePath, String cc, String bcc, MailUsedEnums mailUsedEnums);

    /**
     * 发送模板邮件
     *
     * @param to      发送地址
     * @param subject 主题
     * @param content 内容
     * @param attachFilePath 附件路径
     * @param cc  抄送 多个逗号隔开
     * @param bcc 密送 多个逗号隔开
     */
    void sendTemplateMail(String to, String subject, Map<String, Object> content, String attachFilePath,String cc,String bcc, MailUsedEnums mailUsedEnums);

    /**
     * 发送纯邮件
     *
     * @param to      发送地址
     * @param subject 主题
     * @param content 内容
     * @param attachFilePath 附件路径
     * @param cc  抄送 多个逗号隔开
     * @param bcc 密送 多个逗号隔开
     */
    void sendHtmlMail(String to, String subject,String content, String attachFilePath,String cc,String bcc, MailUsedEnums mailUsedEnums);

    /**
     * 测试连接
     */
    void testConnection() ;
}
