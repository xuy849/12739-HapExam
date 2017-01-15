package hbi.core.test.mapper;

import hbi.core.test.dto.TestCustom01;
import hbi.core.test.dto.TestCustomer;

import java.util.List;

/**
 * Created by xuy849 on 2017/1/11.
 */
public interface TestCustom01Mapper {
    //
    //根据主人ID、客户编码查询客户信息
    public List<TestCustom01> selectCustomer(TestCustom01 testCustom01);

}
