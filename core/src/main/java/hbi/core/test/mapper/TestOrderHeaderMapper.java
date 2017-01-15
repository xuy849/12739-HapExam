package hbi.core.test.mapper;

import com.hand.hap.mybatis.common.Mapper;
import hbi.core.test.dto.TestOrderHeader;

import java.util.List;

/**
 * Created by xuy849 on 2017/1/12.
 */
public interface TestOrderHeaderMapper extends Mapper<TestOrderHeader>{

    //查询订单状态种类
    public List<TestOrderHeader> selectOrderState();

    //订单汇总查询界面

}
