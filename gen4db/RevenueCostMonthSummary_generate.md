##在sqlmap/sqlmap-config.xml文件中加一行

```
<sqlMap resource="config/sqlmap/RevenueCostMonthSummary/RevenueCostMonthSummary.xml" />
```

##创建sqlmap文件  config/sqlmap/RevenueCostMonthSummary/RevenueCostMonthSummary.xml

```sql
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd">
<sqlMap namespace="RevenueCostMonthSummary">

    <typeAlias alias="RevenueCostMonthSummaryData" type="com.dianping.ba.finance.budget.api.datas.RevenueCostMonthSummaryData"/>
    <resultMap id="revenueCostMonthSummaryData" class="RevenueCostMonthSummaryData">
            <result property="iD" column="ID"/>
            <result property="voucherMonth" column="VoucherMonth"/>
            <result property="customerID" column="CustomerID"/>
            <result property="customerName" column="CustomerName"/>
            <result property="shopID" column="ShopID"/>
            <result property="shopName" column="ShopName"/>
            <result property="dealGroupID" column="DealGroupID"/>
            <result property="dealID" column="DealID"/>
            <result property="receiptSettleMode" column="ReceiptSettleMode"/>
            <result property="dealName" column="DealName"/>
            <result property="categoryName" column="CategoryName"/>
            <result property="dealVersion" column="DealVersion"/>
            <result property="dealCost" column="DealCost"/>
            <result property="dealPrice" column="DealPrice"/>
            <result property="voucherCount" column="VoucherCount"/>
            <result property="revenueWithTax" column="RevenueWithTax"/>
            <result property="revenueWithoutTax" column="RevenueWithoutTax"/>
            <result property="revenueTax" column="RevenueTax"/>
            <result property="costWithTax" column="CostWithTax"/>
            <result property="costWithoutTax" column="CostWithoutTax"/>
            <result property="costTax" column="CostTax"/>
            <result property="status" column="Status"/>
            <result property="addTime" column="AddTime"/>
            <result property="updateTime" column="UpdateTime"/>
            <result property="memo" column="Memo"/>
            
        </resultMap>

    <insert id="insertRevenueCostMonthSummary" parameterClass="map">
        <![CDATA[
            INSERT INTO FC_RevenueCostMonthSummary (
            ID,
            VoucherMonth,
            CustomerID,
            CustomerName,
            ShopID,
            ShopName,
            DealGroupID,
            DealID,
            ReceiptSettleMode,
            DealName,
            CategoryName,
            DealVersion,
            DealCost,
            DealPrice,
            VoucherCount,
            RevenueWithTax,
            RevenueWithoutTax,
            RevenueTax,
            CostWithTax,
            CostWithoutTax,
            CostTax,
            Status,
            AddTime,
            UpdateTime,
            Memo
            ) VALUES (
            #data.iD#,
            #data.voucherMonth#,
            #data.customerID#,
            #data.customerName#,
            #data.shopID#,
            #data.shopName#,
            #data.dealGroupID#,
            #data.dealID#,
            #data.receiptSettleMode#,
            #data.dealName#,
            #data.categoryName#,
            #data.dealVersion#,
            #data.dealCost#,
            #data.dealPrice#,
            #data.voucherCount#,
            #data.revenueWithTax#,
            #data.revenueWithoutTax#,
            #data.revenueTax#,
            #data.costWithTax#,
            #data.costWithoutTax#,
            #data.costTax#,
            #data.status#,
            #data.addTime#,
            #data.updateTime#,
            #data.memo#
            )
        ]]>
    <selectKey resultClass="java.lang.Integer" keyProperty="id">
        <![CDATA[
            SELECT @@IDENTITY AS id
        ]]>
    </selectKey>
    </insert>

    <select id="loadRevenueCostMonthSummaryById" resultMap="revenueCostMonthSummaryData" parameterClass="map">
        SELECT
        ID,
        VoucherMonth,
        CustomerID,
        CustomerName,
        ShopID,
        ShopName,
        DealGroupID,
        DealID,
        ReceiptSettleMode,
        DealName,
        CategoryName,
        DealVersion,
        DealCost,
        DealPrice,
        VoucherCount,
        RevenueWithTax,
        RevenueWithoutTax,
        RevenueTax,
        CostWithTax,
        CostWithoutTax,
        CostTax,
        Status,
        AddTime,
        UpdateTime,
        Memo
        FROM FC_RevenueCostMonthSummary
        WHERE Id = #id#
    </select>

    <delete id="deleteRevenueCostMonthSummaryById" parameterClass="map">
        DELETE
        FROM FC_RevenueCostMonthSummary
        WHERE Id = #id#
    </delete>

</sqlMap>
```

##创建Data对象： com.dianping.ba.finance.budget.api.datas.RevenueCostMonthSummaryData
用IDE自动生成Setter和Getter

```java

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by yangyongli
 */
public class RevenueCostMonthSummaryData implements Serializable {
    private int iD;
    private int voucherMonth;
    private int customerID;
    private String customerName;
    private int shopID;
    private String shopName;
    private int dealGroupID;
    private int dealID;
    private int receiptSettleMode;
    private String dealName;
    private String categoryName;
    private int dealVersion;
    private BigDecimal dealCost;
    private BigDecimal dealPrice;
    private int voucherCount;
    private BigDecimal revenueWithTax;
    private BigDecimal revenueWithoutTax;
    private BigDecimal revenueTax;
    private BigDecimal costWithTax;
    private BigDecimal costWithoutTax;
    private BigDecimal costTax;
    private int status;
    private Date addTime;
    private Date updateTime;
    private String memo;
    

}
```

##创建DAO接口: 

```java

import com.dianping.avatar.dao.GenericDao;
import com.dianping.avatar.dao.annotation.DAOAction;
import com.dianping.avatar.dao.annotation.DAOActionType;
import com.dianping.avatar.dao.annotation.DAOParam;
import com.dianping.ba.finance.budget.api.datas.RevenueCostMonthSummaryData;

public interface RevenueCostMonthSummaryDao extends GenericDao {

    @DAOAction(action = DAOActionType.INSERT)
    int insertRevenueCostMonthSummary(@DAOParam("data") RevenueCostMonthSummaryData data);

    @DAOAction(action = DAOActionType.LOAD)
    RevenueCostMonthSummaryData loadRevenueCostMonthSummaryById(@DAOParam("id") int id);

    @DAOAction(action = DAOActionType.DELETE)
    int deleteRevenueCostMonthSummaryById(@DAOParam("id") int id);
}
```

##创建DAOTest:

```java
import com.dianping.ba.finance.budget.api.datas.RevenueCostMonthSummaryData ;
import junit.framework.Assert;
import org.apache.commons.collections.CollectionUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Arrays;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/config/spring/common/appcontext-*.xml",
        "classpath*:/config/spring/local/appcontext-*.xml"})
public class RevenueCostMonthSummaryDaoTest {

    @Autowired
    private RevenueCostMonthSummaryDao revenueCostMonthSummaryDao;

    @Test
    public void testInsertLoadDelete() throws Exception {
        RevenueCostMonthSummaryData data = new RevenueCostMonthSummaryData();
        data.setID("");
        data.setVoucherMonth("");
        data.setCustomerID("");
        data.setCustomerName("");
        data.setShopID("");
        data.setShopName("");
        data.setDealGroupID("");
        data.setDealID("");
        data.setReceiptSettleMode("");
        data.setDealName("");
        data.setCategoryName("");
        data.setDealVersion("");
        data.setDealCost("");
        data.setDealPrice("");
        data.setVoucherCount("");
        data.setRevenueWithTax("");
        data.setRevenueWithoutTax("");
        data.setRevenueTax("");
        data.setCostWithTax("");
        data.setCostWithoutTax("");
        data.setCostTax("");
        data.setStatus("");
        data.setAddTime("");
        data.setUpdateTime("");
        data.setMemo("");
        
        int id = revenueCostMonthSummaryDao.insertRevenueCostMonthSummary(data);
        Assert.assertTrue(id > 0);

        RevenueCostMonthSummaryData value = revenueCostMonthSummaryDao.loadRevenueCostMonthSummaryById(id);
        Assert.assertNotNull(value);

        revenueCostMonthSummaryDao.deleteRevenueCostMonthSummaryById(id);
    }
}

```

## 在appcontext-dao-fs.xml中加入

```xml
    <bean id="revenueCostMonthSummaryDao" parent="parentDao">
        <property name="proxyInterfaces" value="com.dianping.ba.finance.budget.biz.dao.RevenueCostMonthSummaryDao" />
        <property name="target">
            <bean parent="fsMain.daoRealizeTarget">
                <constructor-arg value="RevenueCostMonthSummary" />
            </bean>
        </property>
    </bean>
```

## 创建Service接口

```java
import com.dianping.ba.finance.budget.api.datas.RevenueCostMonthSummaryData;

import java.util.List;

/**
 * Created by yangyongli
 */
public interface RevenueCostMonthSummaryService {

    int insertRevenueCostMonthSummary(RevenueCostMonthSummaryData data);

    RevenueCostMonthSummaryData loadRevenueCostMonthSummaryById(int id);

    int deleteRevenueCostMonthSummaryById(int id);

}
```

## 创建ServiceObject

```
import com.dianping.ba.finance.budget.api.RevenueCostMonthSummaryService;
import com.dianping.ba.finance.budget.api.datas.RevenueCostMonthSummaryData;
import com.dianping.ba.finance.budget.biz.dao.RevenueCostMonthSummaryDao;
import com.dianping.finance.common.aop.annotation.Log;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yangyongli
 */
public class RevenueCostMonthSummaryServiceObject implements RevenueCostMonthSummaryService {
    @Autowired
    RevenueCostMonthSummaryDao RevenueCostMonthSummaryDao;

    @Override
    @Log(logBefore = true, logAfter = true)
    public int insertRevenueCostMonthSummary(RevenueCostMonthSummaryData data) {
        return RevenueCostMonthSummaryDao.insertRevenueCostMonthSummary(data);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public RevenueCostMonthSummaryData loadRevenueCostMonthSummaryById(int id) {
        return RevenueCostMonthSummaryDao.loadRevenueCostMonthSummaryById(id);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public int deleteRevenueCostMonthSummaryById(int id) {
        return RevenueCostMonthSummaryDao.deleteRevenueCostMonthSummaryById(id);
    }
}
```

## 配置Service

在biz的appcontext-service.xml中加入

```xml
    <bean id="revenueCostMonthSummaryService" class="com.dianping.ba.finance.budget.biz.impl.RevenueCostMonthSummaryServiceObject">
    </bean>
```

在service的appcontext-service.xml中加入

```xml
<entry key="http://service.dianping.com/budgetService/RevenueCostMonthSummaryService_1.0.0" value-ref="revenueCostMonthSummaryService"/>
```

在调用该Service的项目appcontext-client.xml中加入

```xml
    <bean id="revenueCostMonthSummaryService" class="com.dianping.dpsf.spring.ProxyBeanFactory" init-method="init">
        <property name="serviceName" value="http://service.dianping.com/budgetService/RevenueCostMonthSummaryService_1.0.0" />
        <property name="iface" value="com.dianping.ba.finance.budget.api.RevenueCostMonthSummaryService" />
        <property name="serialize" value="hessian" />
        <property name="callMethod" value="sync" />
        <property name="timeoutRetry" value="true"/>
    </bean>
```
