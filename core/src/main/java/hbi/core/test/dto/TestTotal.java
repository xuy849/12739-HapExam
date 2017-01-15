package hbi.core.test.dto;

import com.hand.hap.mybatis.annotation.Condition;

import java.util.Date;

/**
 * Created by xuy849 on 2017/1/12.
 */
public class TestTotal {
    /*
    查询条件
     */
    //公司编号
    //@Condition(operator = "=")
    private String companyNumber;

    //客户编号
    //@Condition(operator = "=")
    private String customerNumber;

    //销售订单号
    //@Condition(operator = "LIKE")
    private String orderNumber;

    //物料编码
    //@Condition(operator = "=")
    private String itemCode;

    //订单状态
    //@Condition(operator = "=")
    private String orderStatus;

    /*
    返回数据
     */
    //销售订单号

    //公司名称
    private String companyName;

    //客户名称
    private String customerName;

    //订单日期
    private Date orderDate;

    //订单状态

    //订单总金额
    private Long orderPrice;
}
