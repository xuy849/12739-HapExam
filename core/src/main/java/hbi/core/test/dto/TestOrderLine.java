package hbi.core.test.dto;

import com.hand.hap.system.dto.BaseDTO;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by xuy849 on 2017/1/15.
 */
@Table(name="hap_om_order_lines")
public class TestOrderLine extends BaseDTO {
    @Id
    @Column
    @GeneratedValue(
            generator = "IDENTITY"
    )
    private Long lineId;

    @Column(name="HEADER_ID")
    private Long headId;

    @Column(name="LINE_NUMBER")
    private Long lineNumber;

    @Column(name="INVENTORY_ITEM_ID")
    private Long inventoryItemId;

    @Column(name="ORDERD_QUANTITY")
    private Long orderdQuantity;

    @Column(name="ORDER_QUANTITY_UOM")
    private String orderQuantityUom;

    @Column(name="UNIT_SELLING_PRICE")
    private Long unitSellingPrice;

    @Column(name="DESCRIPTION")
    private String description;

    @Column(name="COMPANY_ID")
    private Long companyId;

    @Column(name="ADDITION1")
    private String addition1;

    @Column(name="ADDITION2")
    private String addition2;

    @Column(name="ADDITION3")
    private String addition3;

    @Column(name="ADDITION4")
    private String addition4;

    @Column(name="ADDITION5")
    private String addition5;

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

    public Long getLineId() {
        return lineId;
    }

    public void setLineId(Long lineId) {
        this.lineId = lineId;
    }

    public Long getHeadId() {
        return headId;
    }

    @Override
    public Long getLastUpdateLogin() {
        return lastUpdateLogin;
    }

    @Override
    public void setLastUpdateLogin(Long lastUpdateLogin) {
        this.lastUpdateLogin = lastUpdateLogin;
    }

    public void setHeadId(Long headId) {
        this.headId = headId;
    }

    public Long getLineNumber() {
        return lineNumber;
    }

    public void setLineNumber(Long lineNumber) {
        this.lineNumber = lineNumber;
    }

    public Long getInventoryItemId() {
        return inventoryItemId;
    }

    public void setInventoryItemId(Long inventoryItemId) {
        this.inventoryItemId = inventoryItemId;
    }

    public Long getOrderdQuantity() {
        return orderdQuantity;
    }

    public void setOrderdQuantity(Long orderdQuantity) {
        this.orderdQuantity = orderdQuantity;
    }

    public String getOrderQuantityUom() {
        return orderQuantityUom;
    }

    public void setOrderQuantityUom(String orderQuantityUom) {
        this.orderQuantityUom = orderQuantityUom;
    }

    public Long getUnitSellingPrice() {
        return unitSellingPrice;
    }

    public void setUnitSellingPrice(Long unitSellingPrice) {
        this.unitSellingPrice = unitSellingPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public String getAddition1() {
        return addition1;
    }

    public void setAddition1(String addition1) {
        this.addition1 = addition1;
    }

    public String getAddition2() {
        return addition2;
    }

    public void setAddition2(String addition2) {
        this.addition2 = addition2;
    }

    public String getAddition3() {
        return addition3;
    }

    public void setAddition3(String addition3) {
        this.addition3 = addition3;
    }

    public String getAddition4() {
        return addition4;
    }

    public void setAddition4(String addition4) {
        this.addition4 = addition4;
    }

    public String getAddition5() {
        return addition5;
    }

    public void setAddition5(String addition5) {
        this.addition5 = addition5;
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

}