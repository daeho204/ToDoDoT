package com.smhrd.model;

/*USER_ID VARCHAR2(30) PRIMARY KEY,
USER_PW VARCHAR2(30) NOT NULL,
USER_NAME VARCHAR2(10) NOT NULL,
USER_ADDRESS VARCHAR2(80) NOT NULL,
USER_PHONE VARCHAR2(11) NOT NULL,
USER_EMAIL VARCHAR2(30) NOT NULL,
USER_ISBUSINESS NUMBER DEFAULT 0 NOT NULL,
USER_BNUM NUMBER UNIQUE
*/
public class UserVO {
	
	private String USER_ID;
	private String USER_PW;
	private String USER_NAME;
	private String USER_PHONE;
	private String USER_EMAIL;
	private String USER_ADDRESS;
	private int USER_ISBUSINESS;
	private int USER_BNUM;

}