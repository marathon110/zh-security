package net.zhenghao.zh.file.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 文件管理
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年2月01日 上午9:57:54
 * SysFileEntity.java
 */
public class SysFileEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 文件id
	 */
	private Long fileId;
	
	/**
	 * 对应文档id
	 */
	private Long docId;
	
	/**
	 * 文件MD5值（做秒传）
	 */
	private String fileMd;
	
	/**
	 * 文件类型 1：图片，2：文档,3：视频，4：种子，5：音乐，6：其他，负数进入回收站
	 */
	private Integer fileType;
	
	/**
	 * 文件展示名（原文件名）
	 */
	private String fileShow;
	
	/**
	 * 文件上传后名称
	 */
	private String fileName;
	
	/**
	 * 文件上传路径
	 */
	private String filePath;
	
	/**
	 * 文件大小(单位B)
	 */
	private Long fileSize;
	
	/**
	 * 文件大小页面展示
	 */
	private String fileSizeFormat;
	
	/**
	 * 文件后缀名
	 */
	private String fileExt;
	
	/**
	 * 文件上传服务器ip
	 */
	private String fileIp;
	
	/**
	 * 文件所在服务器磁盘位置
	 */
	private String fileAddress;
	
	/**
	 * 上传类型，1：普通上传，2：MD5匹配秒传
	 */
	private Integer uploadType;

	/**
	 * 描述
	 */
	private String remark;
	
	/**
	 * 创建人id
	 */
	private Long userIdCreate;
	
	/**
	 * 创建时间
	 */
	private Date gmtCreate;
	
	/**
	 * 修改时间
	 */
	private Date gmtModified;
	
	
	public SysFileEntity() {
		super();
	}
	
	public void setFileId(Long fileId) {
		this.fileId = fileId;
	}
	
	public Long getFileId() {
		return fileId;
	}
	
	public void setDocId(Long docId) {
		this.docId = docId;
	}
	
	public Long getDocId() {
		return docId;
	}
	
	public void setFileMd(String fileMd) {
		this.fileMd = fileMd;
	}
	
	public String getFileMd() {
		return fileMd;
	}
	
	public void setFileType(Integer fileType) {
		this.fileType = fileType;
	}
	
	public Integer getFileType() {
		return fileType;
	}
	
	public void setFileShow(String fileShow) {
		this.fileShow = fileShow;
	}
	
	public String getFileShow() {
		return fileShow;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public String getFilePath() {
		return filePath;
	}
	
	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}
	
	public Long getFileSize() {
		return fileSize;
	}
	
	public void setFileSizeFormat(String fileSizeFormat) {
		this.fileSizeFormat = fileSizeFormat;
	}
	
	public String getFileSizeFormat() {
		return fileSizeFormat;
	}
	
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}
	
	public String getFileExt() {
		return fileExt;
	}
	
	public void setFileIp(String fileIp) {
		this.fileIp = fileIp;
	}
	
	public String getFileIp() {
		return fileIp;
	}
	
	public void setFileAddress(String fileAddress) {
		this.fileAddress = fileAddress;
	}
	
	public String getFileAddress() {
		return fileAddress;
	}
	
	public Integer getUploadType() {
		return uploadType;
	}

	public void setUploadType(Integer uploadType) {
		this.uploadType = uploadType;
	}
	
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String getRemark() {
		return remark;
	}
	
	public void setUserIdCreate(Long userIdCreate) {
		this.userIdCreate = userIdCreate;
	}
	
	public Long getUserIdCreate() {
		return userIdCreate;
	}
	
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	
	public Date getGmtCreate() {
		return gmtCreate;
	}
	
	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
	
	public Date getGmtModified() {
		return gmtModified;
	}
	
}