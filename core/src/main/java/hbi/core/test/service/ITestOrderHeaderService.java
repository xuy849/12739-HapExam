package hbi.core.test.service;

import com.hand.hap.system.service.IBaseService;
import hbi.core.test.dto.TestOrderHeader;

import java.util.List;

/**
 * Created by xuy849 on 2017/1/12.
 */
public interface ITestOrderHeaderService extends IBaseService<TestOrderHeader> {

    //查询订单状态种类
    public List<String> selectOrderStateCategory();

}
