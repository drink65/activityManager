package activityManagement.userModular.entity;

import java.util.Date;

public class User {
	private Integer id;
	private String userName; private String nickname; private String password; private Date registerDate; private String sex;
	private Date birthday;
	 
	private String phoneNum;

	public Integer getId() { return id;
	}

	public void setId(Integer id) { this.id = id;
	}

	public String getUserName() { return userName;
	}

	public void setUserName(String userName) { this.userName = userName;
	}

	public String getPassword() { return password;
	}

	public void setPassword(String password) { this.password = password;
	}

	public Date getRegisterDate() { return registerDate;
	}

	public void setRegisterDate(java.util.Date date) { this.registerDate = date;
	}

	public String getSex() { return sex;
	}

	public void setSex(String sex) { this.sex = sex;
	}

	public Date getBirthday() { return birthday;
	 
	}

	public void setBirthday(Date birthday) { this.birthday = birthday;
	}

	public String getPhoneNum() { return phoneNum;
	}

	public void setPhoneNum(String phoneNum) { this.phoneNum = phoneNum;
	}

	public String getNickname() { return nickname;
	}

	public void setNickname(String nickname) { this.nickname = nickname;
	}

}
