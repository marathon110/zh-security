package net.zhenghao.zh.file.entity;
/**
 * 上传文件属性
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年2月8日 下午3:05:22
 * SysUploadEntity.java
 */
public class SysUploadEntity {

	/**
	 * 上传文件名
	 */
	private String fileName;
	
	/**
	 * 上传文件的MD5值
	 */
	private String fileMd5;
	
	/**
	 * 当前上传分片标号
	 */
	private String chunk;
	
	/**
	 * 上传文件分片总数
	 */
	private String chunkSize;
	
	/**
	 * 上传文件当前进度
	 */
	private String progress;
	
	/**
	 * 上传文件大小
	 */
	private Long fileSize;
	
	public SysUploadEntity() {
		super();
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileMd5() {
		return fileMd5;
	}

	public void setFileMd5(String fileMd5) {
		this.fileMd5 = fileMd5;
	}

	public String getChunk() {
		return chunk;
	}

	public void setChunk(String chunk) {
		this.chunk = chunk;
	}

	public String getChunkSize() {
		return chunkSize;
	}

	public void setChunkSize(String chunkSize) {
		this.chunkSize = chunkSize;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}
	
}
