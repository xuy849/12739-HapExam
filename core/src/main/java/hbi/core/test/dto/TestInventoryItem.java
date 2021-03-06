package hbi.core.test.dto;

import com.hand.hap.mybatis.annotation.Condition;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by xuy849 on 2017/1/12.
 * 物料
 */
@Table(name="hap_inv_inventory_items")
public class TestInventoryItem {
    @Id
    @Column
    @GeneratedValue(
            generator = "IDENTITY"
    )
    private Long inventoryItemId;

    @Column(name="ITEM_CODE")
    @Condition(operator = "LIKE")
    private String itemCode;

    @Condition(operator = "LIKE")
    @Column(name="ITEM_UOM")
    private String itemUom;

    @Condition(operator = "LIKE")
    @Column(name="ITEM_DESCRIPTION")
    private String itemDescription;

    @Column(name="ORDER_FLAG")
    private String orderFlag;

    @Column(name="START_ACTIVE_DATE")
    private Date startActiveDate;

    @Column(name="END_ACTIVE_DATE")
    private Date endActiveDate;

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

    public Long getInventoryItemId() {
        return inventoryItemId;
    }

    public void setInventoryItemId(Long inventoryItemId) {
        this.inventoryItemId = inventoryItemId;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public String getItemUom() {
        return itemUom;
    }

    public void setItemUom(String itemUom) {
        this.itemUom = itemUom;
    }

    public String getItemDescription() {
        return itemDescription;
    }

    public void setItemDescription(String itemDescription) {
        this.itemDescription = itemDescription;
    }

    public String getOrderFlag() {
        return orderFlag;
    }

    public void setOrderFlag(String orderFlag) {
        this.orderFlag = orderFlag;
    }

    public Date getStartActiveDate() {
        return startActiveDate;
    }

    public void setStartActiveDate(Date startActiveDate) {
        this.startActiveDate = startActiveDate;
    }

    public Date getEndActiveDate() {
        return endActiveDate;
    }

    public void setEndActiveDate(Date endActiveDate) {
        this.endActiveDate = endActiveDate;
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
