package hbi.core.test.dto;

import com.hand.hap.mybatis.annotation.Condition;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by xuy849 on 2017/1/11.
 */
@Table(name="hap_ar_customers")
public class TestCustomer {

    @Id
    @Column
    @GeneratedValue(
            generator = "IDENTITY"
    )
    private Long customerId;

    @Column(name="CUSTOMER_NUMBER")
    @Condition(operator = "LIKE")
    private String customerNumber;

    @Column(name="CUSTOMER_NAME")
    @Condition(operator = "LIKE")
    private String customerName;

    @Column(name="COMPANY_ID")
    private Long  companyId;

    @Column(name="ENABLED_FLAG")
    private String enabledFlag;

    @Column(name="CREATION_DATE")
    private Date creationDate;

    @Column(name="CREATED_BY")
    private Long createdBy;

    @Column(name="LAST_UPDATED_BY")
    private Long lastUpdatedBy;

    @Column(name="LAST_UPDATE_DATE")
    private Date lastUpdateDate;

    @Column(name="LAST_UPDATE_LOGIN")
    private Long lastUpdateLogin;

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getCustomerNumber() {
        return customerNumber;
    }

    public void setCustomerNumber(String customerNumber) {
        this.customerNumber = customerNumber;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public String getEnabledFlag() {
        return enabledFlag;
    }

    public void setEnabledFlag(String enabledFlag) {
        this.enabledFlag = enabledFlag;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public Long getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(Long lastUpdatedBy) {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public Long getLastUpdateLogin() {
        return lastUpdateLogin;
    }

    public void setLastUpdateLogin(Long lastUpdateLogin) {
        this.lastUpdateLogin = lastUpdateLogin;
    }

}
