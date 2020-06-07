package com.notification;

public class Notification 
{
	int nid;
	String nDetails="";
	String startDate="";
	String endDate="";
	String deleteStatus="N";
	String linkPath="";
	String linkStatus="N";
	/**
	 * @return the nid
	 */
	public int getNid() {
		return nid;
	}
	/**
	 * @param nid the nid to set
	 */
	public void setNid(int nid) {
		this.nid = nid;
	}
	/**
	 * @return the nDetails
	 */
	public String getnDetails() {
		return nDetails;
	}
	/**
	 * @param nDetails the nDetails to set
	 */
	public void setnDetails(String nDetails) {
		this.nDetails = nDetails;
	}
	/**
	 * @return the startDate
	 */
	public String getStartDate() {
		return startDate;
	}
	/**
	 * @param startDate the startDate to set
	 */
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	/**
	 * @return the endDate
	 */
	public String getEndDate() {
		return endDate;
	}
	/**
	 * @param endDate the endDate to set
	 */
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	/**
	 * @return the deleteStatus
	 */
	public String getDeleteStatus() {
		return deleteStatus;
	}
	/**
	 * @param deleteStatus the deleteStatus to set
	 */
	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}
	/**
	 * @return the linkPath
	 */
	public String getLinkPath() {
		return linkPath;
	}
	/**
	 * @param linkPath the linkPath to set
	 */
	public void setLinkPath(String linkPath) {
		this.linkPath = linkPath;
	}
	/**
	 * @return the linkStatus
	 */
	public String getLinkStatus() {
		return linkStatus;
	}
	/**
	 * @param linkStatus the linkStatus to set
	 */
	public void setLinkStatus(String linkStatus) {
		this.linkStatus = linkStatus;
	}
	
	
	
}
