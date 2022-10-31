package entity;

import java.time.LocalDate;

public class GroupAccount {
    private int groupId;
    private Account accountId;
    private LocalDate joinDate;

    public GroupAccount() {

    }

    public GroupAccount(int groupId, Account accountId, LocalDate joinDate) {
        this.groupId = groupId;
        this.accountId = accountId;
        this.joinDate = joinDate;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public Account getAccountId() {
        return accountId;
    }

    public void setAccountId(Account accountId) {
        this.accountId = accountId;
    }

    public LocalDate getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(LocalDate joinDate) {
        this.joinDate = joinDate;
    }
}
