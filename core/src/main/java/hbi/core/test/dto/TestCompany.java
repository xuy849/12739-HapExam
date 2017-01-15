package hbi.core.test.dto;

import com.hand.hap.mybatis.annotation.Condition;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by xuy849 on 2017/1/11.
 */
@Table(name="hap_org_companys")
public class TestCompany {

    @Id
    @Column
    @GeneratedValue(
            generator = "IDENTITY"
    )
    private Long companyId;

    @Column(name = "COMPANY_NUMBER")
    @Condition(operator = "LIKE")
    private String companyNumber;

    @Column(name="COMPANY_NAME")
    @Condition(operator = "LIKE")
    private String companyName;

    @Column(name="ENABLED_FLAG")
    @Condition(operator = "LIKE")
    private String enabledFlag;

    @Column(name="CREATION_DATE")
    @Condition(operator="=")
    private Date creationDate;

    @Column(name="CREATED_BY")
    @Condition(operator="=")
    private Long createdBy;

    @Column(name="LAST_UPDATED_BY")
    @Condition(operator="=")
    private Long lastUpdatedBy;


    @Column(name="LAST_UPDATE_DATE")
    @Condition(operator="=")
    private Date lastUpdateDate;

    @Column(name="LAST_UPDATE_LOGIN")
    @Condition(operator="=")
    private Long lastUpdateLogin;

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public String getCompanyNumber() {
        return companyNumber;
    }

    public void setCompanyNumber(String companyNumber) {
        this.companyNumber = companyNumber;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
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
