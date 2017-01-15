package hbi.core.test.dto;

import com.hand.hap.mybatis.annotation.Condition;
import com.hand.hap.system.dto.BaseDTO;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by xuy849 on 2017/1/11.
 */
@Table(name="hap_om_order_headers")
public class TestOrderHeader extends BaseDTO{
    @Id
    @Column
    @GeneratedValue(
            generator = "IDENTITY"
    )
    private Long headerId;

    @Column(name="ORDER_NUMBER")
    @Condition(operator = "LIKE")
    private String orderNumber;

    @Column(name="COMPANY_ID")
    private Long companyId;

    @Column(name="ORDER_DATE")
    private Date orderDate;

    @Column(name="ORDER_STATUS")
    @Condition(operator = "LIKE")
    private String orderStatus;

    @Column(name="CUSTOMER_ID")
    private Long customerId;

    @Column(name="OBJECT_VERSION_NUMBER")
    private Long objectVersionNumber;

    @Column(name="REQUEST_ID")
    private Long requestId;

    @Column(name="PROGRAM_ID")
    private Long programId;

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

    @Transient  //订单金额
    private Long mySum;

    public Long getHeaderId() {
        return headerId;
    }

    public void setHeaderId(Long headerId) {
        this.headerId = headerId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    @Override
    public Long getObjectVersionNumber() {
        return objectVersionNumber;
    }

    @Override
    public void setObjectVersionNumber(Long objectVersionNumber) {
        this.objectVersionNumber = objectVersionNumber;
    }

    @Override
    public Long getRequestId() {
        return requestId;
    }

    @Override
    public void setRequestId(Long requestId) {
        this.requestId = requestId;
    }

    @Override
    public Long getProgramId() {
        return programId;
    }

    @Override
    public void setProgramId(Long programId) {
        this.programId = programId;
    }

    @Override
    public Date getCreationDate() {
        return creationDate;
    }

    @Override
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Override
    public Long getCreatedBy() {
        return createdBy;
    }

    public Long getMySum() {
        return mySum;
    }

    public void setMySum(Long mySum) {
        this.mySum = mySum;
    }

    @Override

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public Long getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    @Override
    public void setLastUpdatedBy(Long lastUpdatedBy) {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    @Override
    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    @Override
    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    @Override
    public Long getLastUpdateLogin() {
        return lastUpdateLogin;
    }

    @Override
    public void setLastUpdateLogin(Long lastUpdateLogin) {
        this.lastUpdateLogin = lastUpdateLogin;
    }
}
