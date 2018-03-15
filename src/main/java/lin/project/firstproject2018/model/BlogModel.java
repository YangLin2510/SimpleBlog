package lin.project.firstproject2018.model;

import java.util.Date;

public class BlogModel {

	private Long id;
	private String title;
	private String blogText;
	private Long authorUserId;
	private Date createTime;
	private Date lastUpdateTime;
	private Integer viewCount;
	private Integer commentCount;
	private String blogTagCode;
	private String blogType;
	private String authorUserName;
	private String blogTypeName;
	
	public String getAuthorUserName() {
		return authorUserName;
	}
	public void setAuthorUserName(String authorUserName) {
		this.authorUserName = authorUserName;
	}
	public String getBlogTypeName() {
		return blogTypeName;
	}
	public void setBlogTypeName(String blogTypeName) {
		this.blogTypeName = blogTypeName;
	}
	public String getBlogTagCode() {
		return blogTagCode;
	}
	public void setBlogTagCode(String blogTagCode) {
		this.blogTagCode = blogTagCode;
	}
	public String getBlogType() {
		return blogType;
	}
	public void setBlogType(String blogType) {
		this.blogType = blogType;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBlogText() {
		return blogText;
	}
	public void setBlogText(String blogText) {
		this.blogText = blogText;
	}
	public Long getAuthorUserId() {
		return authorUserId;
	}
	public void setAuthorUserId(Long authorUserId) {
		this.authorUserId = authorUserId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public Integer getViewCount() {
		return viewCount;
	}
	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}
	public Integer getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}
	
	



}
