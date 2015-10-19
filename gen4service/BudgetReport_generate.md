##在sqlmap/sqlmap-config.xml文件中加一行

```
<sqlMap resource="config/sqlmap/BudgetReport/BudgetReport.xml" />
```

##创建sqlmap文件  config/sqlmap/BudgetReport/BudgetReport.xml

```sql
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd">
<sqlMap namespace="BudgetReport">

    <typeAlias alias="BudgetYearReportDisplayBean" type="com.dianping.ba.finance.budget.api.beans.BudgetYearReportDisplayBean"/>
    <resultMap id="budgetReportData" class="BudgetYearReportDisplayBean">
            <result property="budgetYear" column="BudgetYear"/>
            <result property="budgetTypeId" column="BudgetTypeId"/>
            <result property="budgetTypeNo" column="BudgetTypeNo"/>
            <result property="budgetTypeName" column="BudgetTypeName"/>
            <result property="costDepartmentId" column="CostDepartmentId"/>
            <result property="costDepartmentName" column="CostDepartmentName"/>
            <result property="budgetOwnerNo" column="BudgetOwnerNo"/>
            <result property="budgetOwnerName" column="BudgetOwnerName"/>
            <result property="budgetStatus" column="BudgetStatus"/>
            <result property="budgetStatusName" column="BudgetStatusName"/>
            <result property="budgetPlanId" column="BudgetPlanId"/>
            <result property="budgetPlanNo" column="BudgetPlanNo"/>
            <result property="strategyId" column="StrategyId"/>
            <result property="strategyPeriodType" column="StrategyPeriodType"/>
            <result property="strategyPeriodTypeName" column="StrategyPeriodTypeName"/>
            <result property="yearTotalAmount" column="YearTotalAmount"/>
            <result property="yearAvailableAmount" column="YearAvailableAmount"/>
            <result property="yearUsedAmount" column="YearUsedAmount"/>
            <result property="yearFrozenAmount" column="YearFrozenAmount"/>
            <result property="quarterTotalAmount1" column="QuarterTotalAmount1"/>
            <result property="quarterAvailableAmount1" column="QuarterAvailableAmount1"/>
            <result property="quarterUsedAmount1" column="QuarterUsedAmount1"/>
            <result property="quarterFrozenAmount1" column="QuarterFrozenAmount1"/>
            <result property="quarterTotalAmount2" column="QuarterTotalAmount2"/>
            <result property="quarterAvailableAmount2" column="QuarterAvailableAmount2"/>
            <result property="quarterUsedAmount2" column="QuarterUsedAmount2"/>
            <result property="quarterFrozenAmount2" column="QuarterFrozenAmount2"/>
            <result property="quarterTotalAmount3" column="QuarterTotalAmount3"/>
            <result property="quarterAvailableAmount3" column="QuarterAvailableAmount3"/>
            <result property="quarterUsedAmount3" column="QuarterUsedAmount3"/>
            <result property="quarterFrozenAmount3" column="QuarterFrozenAmount3"/>
            <result property="quarterTotalAmount4" column="QuarterTotalAmount4"/>
            <result property="quarterAvailableAmount4" column="QuarterAvailableAmount4"/>
            <result property="quarterUsedAmount4" column="QuarterUsedAmount4"/>
            <result property="quarterFrozenAmount4" column="QuarterFrozenAmount4"/>
            <result property="monthTotalAmount1" column="MonthTotalAmount1"/>
            <result property="monthAvailableAmount1" column="MonthAvailableAmount1"/>
            <result property="monthUsedAmount1" column="MonthUsedAmount1"/>
            <result property="monthFrozenAmount1" column="MonthFrozenAmount1"/>
            <result property="monthTotalAmount2" column="MonthTotalAmount2"/>
            <result property="monthAvailableAmount2" column="MonthAvailableAmount2"/>
            <result property="monthUsedAmount2" column="MonthUsedAmount2"/>
            <result property="monthFrozenAmount2" column="MonthFrozenAmount2"/>
            <result property="monthTotalAmount3" column="MonthTotalAmount3"/>
            <result property="monthAvailableAmount3" column="MonthAvailableAmount3"/>
            <result property="monthUsedAmount3" column="MonthUsedAmount3"/>
            <result property="monthFrozenAmount3" column="MonthFrozenAmount3"/>
            <result property="monthTotalAmount4" column="MonthTotalAmount4"/>
            <result property="monthAvailableAmount4" column="MonthAvailableAmount4"/>
            <result property="monthUsedAmount4" column="MonthUsedAmount4"/>
            <result property="monthFrozenAmount4" column="MonthFrozenAmount4"/>
            <result property="monthTotalAmount5" column="MonthTotalAmount5"/>
            <result property="monthAvailableAmount5" column="MonthAvailableAmount5"/>
            <result property="monthUsedAmount5" column="MonthUsedAmount5"/>
            <result property="monthFrozenAmount5" column="MonthFrozenAmount5"/>
            <result property="monthTotalAmount6" column="MonthTotalAmount6"/>
            <result property="monthAvailableAmount6" column="MonthAvailableAmount6"/>
            <result property="monthUsedAmount6" column="MonthUsedAmount6"/>
            <result property="monthFrozenAmount6" column="MonthFrozenAmount6"/>
            <result property="monthTotalAmount7" column="MonthTotalAmount7"/>
            <result property="monthAvailableAmount7" column="MonthAvailableAmount7"/>
            <result property="monthUsedAmount7" column="MonthUsedAmount7"/>
            <result property="monthFrozenAmount7" column="MonthFrozenAmount7"/>
            <result property="monthTotalAmount8" column="MonthTotalAmount8"/>
            <result property="monthAvailableAmount8" column="MonthAvailableAmount8"/>
            <result property="monthUsedAmount8" column="MonthUsedAmount8"/>
            <result property="monthFrozenAmount8" column="MonthFrozenAmount8"/>
            <result property="monthTotalAmount9" column="MonthTotalAmount9"/>
            <result property="monthAvailableAmount9" column="MonthAvailableAmount9"/>
            <result property="monthUsedAmount9" column="MonthUsedAmount9"/>
            <result property="monthFrozenAmount9" column="MonthFrozenAmount9"/>
            <result property="monthTotalAmount10" column="MonthTotalAmount10"/>
            <result property="monthAvailableAmount10" column="MonthAvailableAmount10"/>
            <result property="monthUsedAmount10" column="MonthUsedAmount10"/>
            <result property="monthFrozenAmount10" column="MonthFrozenAmount10"/>
            <result property="monthTotalAmount11" column="MonthTotalAmount11"/>
            <result property="monthAvailableAmount11" column="MonthAvailableAmount11"/>
            <result property="monthUsedAmount11" column="MonthUsedAmount11"/>
            <result property="monthFrozenAmount11" column="MonthFrozenAmount11"/>
            <result property="monthTotalAmount12" column="MonthTotalAmount12"/>
            <result property="monthAvailableAmount12" column="MonthAvailableAmount12"/>
            <result property="monthUsedAmount12" column="MonthUsedAmount12"/>
            <result property="monthFrozenAmount12" column="MonthFrozenAmount12"/>
            </resultMap>

    <insert id="insertBudgetReport" parameterClass="map">
        <![CDATA[
            INSERT INTO FC_BudgetBaseInfo (
            BudgetYear,
            BudgetTypeId,
            BudgetTypeNo,
            BudgetTypeName,
            CostDepartmentId,
            CostDepartmentName,
            BudgetOwnerNo,
            BudgetOwnerName,
            BudgetStatus,
            BudgetStatusName,
            BudgetPlanId,
            BudgetPlanNo,
            StrategyId,
            StrategyPeriodType,
            StrategyPeriodTypeName,
            YearTotalAmount,
            YearAvailableAmount,
            YearUsedAmount,
            YearFrozenAmount,
            QuarterTotalAmount1,
            QuarterAvailableAmount1,
            QuarterUsedAmount1,
            QuarterFrozenAmount1,
            QuarterTotalAmount2,
            QuarterAvailableAmount2,
            QuarterUsedAmount2,
            QuarterFrozenAmount2,
            QuarterTotalAmount3,
            QuarterAvailableAmount3,
            QuarterUsedAmount3,
            QuarterFrozenAmount3,
            QuarterTotalAmount4,
            QuarterAvailableAmount4,
            QuarterUsedAmount4,
            QuarterFrozenAmount4,
            MonthTotalAmount1,
            MonthAvailableAmount1,
            MonthUsedAmount1,
            MonthFrozenAmount1,
            MonthTotalAmount2,
            MonthAvailableAmount2,
            MonthUsedAmount2,
            MonthFrozenAmount2,
            MonthTotalAmount3,
            MonthAvailableAmount3,
            MonthUsedAmount3,
            MonthFrozenAmount3,
            MonthTotalAmount4,
            MonthAvailableAmount4,
            MonthUsedAmount4,
            MonthFrozenAmount4,
            MonthTotalAmount5,
            MonthAvailableAmount5,
            MonthUsedAmount5,
            MonthFrozenAmount5,
            MonthTotalAmount6,
            MonthAvailableAmount6,
            MonthUsedAmount6,
            MonthFrozenAmount6,
            MonthTotalAmount7,
            MonthAvailableAmount7,
            MonthUsedAmount7,
            MonthFrozenAmount7,
            MonthTotalAmount8,
            MonthAvailableAmount8,
            MonthUsedAmount8,
            MonthFrozenAmount8,
            MonthTotalAmount9,
            MonthAvailableAmount9,
            MonthUsedAmount9,
            MonthFrozenAmount9,
            MonthTotalAmount10,
            MonthAvailableAmount10,
            MonthUsedAmount10,
            MonthFrozenAmount10,
            MonthTotalAmount11,
            MonthAvailableAmount11,
            MonthUsedAmount11,
            MonthFrozenAmount11,
            MonthTotalAmount12,
            MonthAvailableAmount12,
            MonthUsedAmount12,
            MonthFrozenAmount12
            ) VALUES (
            #data.budgetYear#,
            #data.budgetTypeId#,
            #data.budgetTypeNo#,
            #data.budgetTypeName#,
            #data.costDepartmentId#,
            #data.costDepartmentName#,
            #data.budgetOwnerNo#,
            #data.budgetOwnerName#,
            #data.budgetStatus#,
            #data.budgetStatusName#,
            #data.budgetPlanId#,
            #data.budgetPlanNo#,
            #data.strategyId#,
            #data.strategyPeriodType#,
            #data.strategyPeriodTypeName#,
            #data.yearTotalAmount#,
            #data.yearAvailableAmount#,
            #data.yearUsedAmount#,
            #data.yearFrozenAmount#,
            #data.quarterTotalAmount1#,
            #data.quarterAvailableAmount1#,
            #data.quarterUsedAmount1#,
            #data.quarterFrozenAmount1#,
            #data.quarterTotalAmount2#,
            #data.quarterAvailableAmount2#,
            #data.quarterUsedAmount2#,
            #data.quarterFrozenAmount2#,
            #data.quarterTotalAmount3#,
            #data.quarterAvailableAmount3#,
            #data.quarterUsedAmount3#,
            #data.quarterFrozenAmount3#,
            #data.quarterTotalAmount4#,
            #data.quarterAvailableAmount4#,
            #data.quarterUsedAmount4#,
            #data.quarterFrozenAmount4#,
            #data.monthTotalAmount1#,
            #data.monthAvailableAmount1#,
            #data.monthUsedAmount1#,
            #data.monthFrozenAmount1#,
            #data.monthTotalAmount2#,
            #data.monthAvailableAmount2#,
            #data.monthUsedAmount2#,
            #data.monthFrozenAmount2#,
            #data.monthTotalAmount3#,
            #data.monthAvailableAmount3#,
            #data.monthUsedAmount3#,
            #data.monthFrozenAmount3#,
            #data.monthTotalAmount4#,
            #data.monthAvailableAmount4#,
            #data.monthUsedAmount4#,
            #data.monthFrozenAmount4#,
            #data.monthTotalAmount5#,
            #data.monthAvailableAmount5#,
            #data.monthUsedAmount5#,
            #data.monthFrozenAmount5#,
            #data.monthTotalAmount6#,
            #data.monthAvailableAmount6#,
            #data.monthUsedAmount6#,
            #data.monthFrozenAmount6#,
            #data.monthTotalAmount7#,
            #data.monthAvailableAmount7#,
            #data.monthUsedAmount7#,
            #data.monthFrozenAmount7#,
            #data.monthTotalAmount8#,
            #data.monthAvailableAmount8#,
            #data.monthUsedAmount8#,
            #data.monthFrozenAmount8#,
            #data.monthTotalAmount9#,
            #data.monthAvailableAmount9#,
            #data.monthUsedAmount9#,
            #data.monthFrozenAmount9#,
            #data.monthTotalAmount10#,
            #data.monthAvailableAmount10#,
            #data.monthUsedAmount10#,
            #data.monthFrozenAmount10#,
            #data.monthTotalAmount11#,
            #data.monthAvailableAmount11#,
            #data.monthUsedAmount11#,
            #data.monthFrozenAmount11#,
            #data.monthTotalAmount12#,
            #data.monthAvailableAmount12#,
            #data.monthUsedAmount12#,
            #data.monthFrozenAmount12#
            )
        ]]>
    <selectKey resultClass="java.lang.Integer" keyProperty="id">
        <![CDATA[
            SELECT @@IDENTITY AS id
        ]]>
    </selectKey>
    </insert>

    <select id="loadBudgetReportById" resultMap="budgetReportData" parameterClass="map">
        SELECT
        BudgetYear,
        BudgetTypeId,
        BudgetTypeNo,
        BudgetTypeName,
        CostDepartmentId,
        CostDepartmentName,
        BudgetOwnerNo,
        BudgetOwnerName,
        BudgetStatus,
        BudgetStatusName,
        BudgetPlanId,
        BudgetPlanNo,
        StrategyId,
        StrategyPeriodType,
        StrategyPeriodTypeName,
        YearTotalAmount,
        YearAvailableAmount,
        YearUsedAmount,
        YearFrozenAmount,
        QuarterTotalAmount1,
        QuarterAvailableAmount1,
        QuarterUsedAmount1,
        QuarterFrozenAmount1,
        QuarterTotalAmount2,
        QuarterAvailableAmount2,
        QuarterUsedAmount2,
        QuarterFrozenAmount2,
        QuarterTotalAmount3,
        QuarterAvailableAmount3,
        QuarterUsedAmount3,
        QuarterFrozenAmount3,
        QuarterTotalAmount4,
        QuarterAvailableAmount4,
        QuarterUsedAmount4,
        QuarterFrozenAmount4,
        MonthTotalAmount1,
        MonthAvailableAmount1,
        MonthUsedAmount1,
        MonthFrozenAmount1,
        MonthTotalAmount2,
        MonthAvailableAmount2,
        MonthUsedAmount2,
        MonthFrozenAmount2,
        MonthTotalAmount3,
        MonthAvailableAmount3,
        MonthUsedAmount3,
        MonthFrozenAmount3,
        MonthTotalAmount4,
        MonthAvailableAmount4,
        MonthUsedAmount4,
        MonthFrozenAmount4,
        MonthTotalAmount5,
        MonthAvailableAmount5,
        MonthUsedAmount5,
        MonthFrozenAmount5,
        MonthTotalAmount6,
        MonthAvailableAmount6,
        MonthUsedAmount6,
        MonthFrozenAmount6,
        MonthTotalAmount7,
        MonthAvailableAmount7,
        MonthUsedAmount7,
        MonthFrozenAmount7,
        MonthTotalAmount8,
        MonthAvailableAmount8,
        MonthUsedAmount8,
        MonthFrozenAmount8,
        MonthTotalAmount9,
        MonthAvailableAmount9,
        MonthUsedAmount9,
        MonthFrozenAmount9,
        MonthTotalAmount10,
        MonthAvailableAmount10,
        MonthUsedAmount10,
        MonthFrozenAmount10,
        MonthTotalAmount11,
        MonthAvailableAmount11,
        MonthUsedAmount11,
        MonthFrozenAmount11,
        MonthTotalAmount12,
        MonthAvailableAmount12,
        MonthUsedAmount12,
        MonthFrozenAmount12
        FROM FC_BudgetBaseInfo
        WHERE Id = #id#
    </select>

    <delete id="deleteBudgetReportById" parameterClass="map">
        DELETE
        FROM FC_BudgetBaseInfo
        WHERE Id = #id#
    </delete>
    
     <select id="paginationBudgetReport" resultMap="budgetReportData" parameterClass="map">
        SELECT
        BudgetYear as BudgetYear,
        BudgetTypeId as BudgetTypeId,
        BudgetTypeNo as BudgetTypeNo,
        BudgetTypeName as BudgetTypeName,
        CostDepartmentId as CostDepartmentId,
        CostDepartmentName as CostDepartmentName,
        BudgetOwnerNo as BudgetOwnerNo,
        BudgetOwnerName as BudgetOwnerName,
        BudgetStatus as BudgetStatus,
        BudgetStatusName as BudgetStatusName,
        BudgetPlanId as BudgetPlanId,
        BudgetPlanNo as BudgetPlanNo,
        StrategyId as StrategyId,
        StrategyPeriodType as StrategyPeriodType,
        StrategyPeriodTypeName as StrategyPeriodTypeName,
        YearTotalAmount as YearTotalAmount,
        YearAvailableAmount as YearAvailableAmount,
        YearUsedAmount as YearUsedAmount,
        YearFrozenAmount as YearFrozenAmount,
        QuarterTotalAmount1 as QuarterTotalAmount1,
        QuarterAvailableAmount1 as QuarterAvailableAmount1,
        QuarterUsedAmount1 as QuarterUsedAmount1,
        QuarterFrozenAmount1 as QuarterFrozenAmount1,
        QuarterTotalAmount2 as QuarterTotalAmount2,
        QuarterAvailableAmount2 as QuarterAvailableAmount2,
        QuarterUsedAmount2 as QuarterUsedAmount2,
        QuarterFrozenAmount2 as QuarterFrozenAmount2,
        QuarterTotalAmount3 as QuarterTotalAmount3,
        QuarterAvailableAmount3 as QuarterAvailableAmount3,
        QuarterUsedAmount3 as QuarterUsedAmount3,
        QuarterFrozenAmount3 as QuarterFrozenAmount3,
        QuarterTotalAmount4 as QuarterTotalAmount4,
        QuarterAvailableAmount4 as QuarterAvailableAmount4,
        QuarterUsedAmount4 as QuarterUsedAmount4,
        QuarterFrozenAmount4 as QuarterFrozenAmount4,
        MonthTotalAmount1 as MonthTotalAmount1,
        MonthAvailableAmount1 as MonthAvailableAmount1,
        MonthUsedAmount1 as MonthUsedAmount1,
        MonthFrozenAmount1 as MonthFrozenAmount1,
        MonthTotalAmount2 as MonthTotalAmount2,
        MonthAvailableAmount2 as MonthAvailableAmount2,
        MonthUsedAmount2 as MonthUsedAmount2,
        MonthFrozenAmount2 as MonthFrozenAmount2,
        MonthTotalAmount3 as MonthTotalAmount3,
        MonthAvailableAmount3 as MonthAvailableAmount3,
        MonthUsedAmount3 as MonthUsedAmount3,
        MonthFrozenAmount3 as MonthFrozenAmount3,
        MonthTotalAmount4 as MonthTotalAmount4,
        MonthAvailableAmount4 as MonthAvailableAmount4,
        MonthUsedAmount4 as MonthUsedAmount4,
        MonthFrozenAmount4 as MonthFrozenAmount4,
        MonthTotalAmount5 as MonthTotalAmount5,
        MonthAvailableAmount5 as MonthAvailableAmount5,
        MonthUsedAmount5 as MonthUsedAmount5,
        MonthFrozenAmount5 as MonthFrozenAmount5,
        MonthTotalAmount6 as MonthTotalAmount6,
        MonthAvailableAmount6 as MonthAvailableAmount6,
        MonthUsedAmount6 as MonthUsedAmount6,
        MonthFrozenAmount6 as MonthFrozenAmount6,
        MonthTotalAmount7 as MonthTotalAmount7,
        MonthAvailableAmount7 as MonthAvailableAmount7,
        MonthUsedAmount7 as MonthUsedAmount7,
        MonthFrozenAmount7 as MonthFrozenAmount7,
        MonthTotalAmount8 as MonthTotalAmount8,
        MonthAvailableAmount8 as MonthAvailableAmount8,
        MonthUsedAmount8 as MonthUsedAmount8,
        MonthFrozenAmount8 as MonthFrozenAmount8,
        MonthTotalAmount9 as MonthTotalAmount9,
        MonthAvailableAmount9 as MonthAvailableAmount9,
        MonthUsedAmount9 as MonthUsedAmount9,
        MonthFrozenAmount9 as MonthFrozenAmount9,
        MonthTotalAmount10 as MonthTotalAmount10,
        MonthAvailableAmount10 as MonthAvailableAmount10,
        MonthUsedAmount10 as MonthUsedAmount10,
        MonthFrozenAmount10 as MonthFrozenAmount10,
        MonthTotalAmount11 as MonthTotalAmount11,
        MonthAvailableAmount11 as MonthAvailableAmount11,
        MonthUsedAmount11 as MonthUsedAmount11,
        MonthFrozenAmount11 as MonthFrozenAmount11,
        MonthTotalAmount12 as MonthTotalAmount12,
        MonthAvailableAmount12 as MonthAvailableAmount12,
        MonthUsedAmount12 as MonthUsedAmount12,
        MonthFrozenAmount12 as MonthFrozenAmount12
        FROM FC_BudgetBaseInfo
        WHERE 1 = 1
        <isNotEqual property="searchBean.budgetTypeId" compareValue="0" prepend="and">
            BudgetTypeId  = #searchBean.budgetTypeId#
        </isNotEqual>
        <isNotEqual property="searchBean.costDepartmentId" compareValue="0" prepend="and">
            CostDepartmentId  = #searchBean.costDepartmentId#
        </isNotEqual>
        <isNotNull property="searchBean.budgetOwnerNo" prepend="and">
            BudgetOwnerNo  = #searchBean.budgetOwnerNo#
        </isNotNull>
        <isNotNull property="searchBean.exceedBudget" prepend="and">
            ExceedBudget  = #searchBean.exceedBudget#
        </isNotNull>
        <isNotNull property="searchBean.withExpenseType" prepend="and">
            WithExpenseType  = #searchBean.withExpenseType#
        </isNotNull>
        <isNotEqual property="searchBean.beginYear" compareValue="0" prepend="and">
            BeginYear  = #searchBean.beginYear#
        </isNotEqual>
        <isNotEqual property="searchBean.beginMonth" compareValue="0" prepend="and">
            BeginMonth  = #searchBean.beginMonth#
        </isNotEqual>
        <isNotEqual property="searchBean.endYear" compareValue="0" prepend="and">
            EndYear  = #searchBean.endYear#
        </isNotEqual>
        <isNotEqual property="searchBean.endMonth" compareValue="0" prepend="and">
            EndMonth  = #searchBean.endMonth#
        </isNotEqual>
        </select>

    <select id="paginationBudgetReport_COUNT" resultClass="java.lang.Integer" parameterClass="map">
        SELECT COUNT(1)
        FROM(
        SELECT 1
        FROM
        //TODO
         ) t
    </select>
    
    <select id="queryBudgetReport" resultMap="budgetReportData" parameterClass="map">
        //TODO same with paginate
    </select>

</sqlMap>
```

##创建Data对象： com.dianping.ba.finance.budget.api.beans.BudgetYearReportDisplayBean;
用IDE自动生成Setter和Getter

```java

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by yangyongli
 */
public class BudgetYearReportDisplayBean implements Serializable {
    private int budgetYear;
    private int budgetTypeId;
    private String budgetTypeNo;
    private String budgetTypeName;
    private int costDepartmentId;
    private String costDepartmentName;
    private String budgetOwnerNo;
    private String budgetOwnerName;
    private int budgetStatus;
    private String budgetStatusName;
    private int budgetPlanId;
    private String budgetPlanNo;
    private int strategyId;
    private int strategyPeriodType;
    private String strategyPeriodTypeName;
    private BigDecimal yearTotalAmount;
    private BigDecimal yearAvailableAmount;
    private BigDecimal yearUsedAmount;
    private BigDecimal yearFrozenAmount;
    private BigDecimal quarterTotalAmount1;
    private BigDecimal quarterAvailableAmount1;
    private BigDecimal quarterUsedAmount1;
    private BigDecimal quarterFrozenAmount1;
    private BigDecimal quarterTotalAmount2;
    private BigDecimal quarterAvailableAmount2;
    private BigDecimal quarterUsedAmount2;
    private BigDecimal quarterFrozenAmount2;
    private BigDecimal quarterTotalAmount3;
    private BigDecimal quarterAvailableAmount3;
    private BigDecimal quarterUsedAmount3;
    private BigDecimal quarterFrozenAmount3;
    private BigDecimal quarterTotalAmount4;
    private BigDecimal quarterAvailableAmount4;
    private BigDecimal quarterUsedAmount4;
    private BigDecimal quarterFrozenAmount4;
    private BigDecimal monthTotalAmount1;
    private BigDecimal monthAvailableAmount1;
    private BigDecimal monthUsedAmount1;
    private BigDecimal monthFrozenAmount1;
    private BigDecimal monthTotalAmount2;
    private BigDecimal monthAvailableAmount2;
    private BigDecimal monthUsedAmount2;
    private BigDecimal monthFrozenAmount2;
    private BigDecimal monthTotalAmount3;
    private BigDecimal monthAvailableAmount3;
    private BigDecimal monthUsedAmount3;
    private BigDecimal monthFrozenAmount3;
    private BigDecimal monthTotalAmount4;
    private BigDecimal monthAvailableAmount4;
    private BigDecimal monthUsedAmount4;
    private BigDecimal monthFrozenAmount4;
    private BigDecimal monthTotalAmount5;
    private BigDecimal monthAvailableAmount5;
    private BigDecimal monthUsedAmount5;
    private BigDecimal monthFrozenAmount5;
    private BigDecimal monthTotalAmount6;
    private BigDecimal monthAvailableAmount6;
    private BigDecimal monthUsedAmount6;
    private BigDecimal monthFrozenAmount6;
    private BigDecimal monthTotalAmount7;
    private BigDecimal monthAvailableAmount7;
    private BigDecimal monthUsedAmount7;
    private BigDecimal monthFrozenAmount7;
    private BigDecimal monthTotalAmount8;
    private BigDecimal monthAvailableAmount8;
    private BigDecimal monthUsedAmount8;
    private BigDecimal monthFrozenAmount8;
    private BigDecimal monthTotalAmount9;
    private BigDecimal monthAvailableAmount9;
    private BigDecimal monthUsedAmount9;
    private BigDecimal monthFrozenAmount9;
    private BigDecimal monthTotalAmount10;
    private BigDecimal monthAvailableAmount10;
    private BigDecimal monthUsedAmount10;
    private BigDecimal monthFrozenAmount10;
    private BigDecimal monthTotalAmount11;
    private BigDecimal monthAvailableAmount11;
    private BigDecimal monthUsedAmount11;
    private BigDecimal monthFrozenAmount11;
    private BigDecimal monthTotalAmount12;
    private BigDecimal monthAvailableAmount12;
    private BigDecimal monthUsedAmount12;
    private BigDecimal monthFrozenAmount12;
    

}
```

##创建SearchBean对象： com.dianping.ba.finance.budget.api.beans.BudgetReportSearchBean;
用IDE自动生成Setter和Getter

```java

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by yangyongli
 */
public class BudgetReportSearchBean implements Serializable {
    private int budgetTypeId;
    private int costDepartmentId;
    private String budgetOwnerNo;
    private boolean exceedBudget;
    private boolean withExpenseType;
    private int beginYear;
    private int beginMonth;
    private int endYear;
    private int endMonth;
    

}
```

##创建DAO接口: 

```java

import com.dianping.avatar.dao.GenericDao;
import com.dianping.avatar.dao.annotation.DAOAction;
import com.dianping.avatar.dao.annotation.DAOActionType;
import com.dianping.avatar.dao.annotation.DAOParam;
import com.dianping.ba.finance.budget.api.beans.BudgetYearReportDisplayBean;
import com.dianping.ba.finance.budget.api.beans.BudgetReportSearchBean; 

public interface BudgetReportDao extends GenericDao {

    @DAOAction(action = DAOActionType.INSERT)
    int insertBudgetReport(@DAOParam("data") BudgetYearReportDisplayBean data);

    @DAOAction(action = DAOActionType.LOAD)
    BudgetYearReportDisplayBean loadBudgetReportById(@DAOParam("id") int id);

    @DAOAction(action = DAOActionType.DELETE)
    int deleteBudgetReportById(@DAOParam("id") int id);
    
    /**
     * 分页查询
     * @param searchBean
     * @return
     */
    @DAOAction(action = DAOActionType.PAGE)
    PageModel paginationBudgetReport(@DAOParam("searchBean") BudgetReportSearchBean searchBean,
                                     @DAOParam("page") int page,
                                     @DAOParam("max") int max);

    /**
     * 列表查询
     * @param searchBean
     * @return
     */
    @DAOAction(action = DAOActionType.QUERY)
    List<dataBeanName> queryBudgetReport(@DAOParam("searchBean") BudgetReportSearchBean  searchBean);

    
}
```

##创建DAOTest:

```java

import com.dianping.ba.finance.budget.api.beans.BudgetYearReportDisplayBean;
import com.dianping.ba.finance.budget.api.beans.BudgetReportSearchBean;
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
public class BudgetReportDaoTest {

    @Autowired
    private BudgetReportDao budgetReportDao;

    @Test
    public void testInsertLoadDelete() throws Exception {
        BudgetYearReportDisplayBean data = new BudgetYearReportDisplayBean();
        data.setBudgetYear("");
        data.setBudgetTypeId("");
        data.setBudgetTypeNo("");
        data.setBudgetTypeName("");
        data.setCostDepartmentId("");
        data.setCostDepartmentName("");
        data.setBudgetOwnerNo("");
        data.setBudgetOwnerName("");
        data.setBudgetStatus("");
        data.setBudgetStatusName("");
        data.setBudgetPlanId("");
        data.setBudgetPlanNo("");
        data.setStrategyId("");
        data.setStrategyPeriodType("");
        data.setStrategyPeriodTypeName("");
        data.setYearTotalAmount("");
        data.setYearAvailableAmount("");
        data.setYearUsedAmount("");
        data.setYearFrozenAmount("");
        data.setQuarterTotalAmount1("");
        data.setQuarterAvailableAmount1("");
        data.setQuarterUsedAmount1("");
        data.setQuarterFrozenAmount1("");
        data.setQuarterTotalAmount2("");
        data.setQuarterAvailableAmount2("");
        data.setQuarterUsedAmount2("");
        data.setQuarterFrozenAmount2("");
        data.setQuarterTotalAmount3("");
        data.setQuarterAvailableAmount3("");
        data.setQuarterUsedAmount3("");
        data.setQuarterFrozenAmount3("");
        data.setQuarterTotalAmount4("");
        data.setQuarterAvailableAmount4("");
        data.setQuarterUsedAmount4("");
        data.setQuarterFrozenAmount4("");
        data.setMonthTotalAmount1("");
        data.setMonthAvailableAmount1("");
        data.setMonthUsedAmount1("");
        data.setMonthFrozenAmount1("");
        data.setMonthTotalAmount2("");
        data.setMonthAvailableAmount2("");
        data.setMonthUsedAmount2("");
        data.setMonthFrozenAmount2("");
        data.setMonthTotalAmount3("");
        data.setMonthAvailableAmount3("");
        data.setMonthUsedAmount3("");
        data.setMonthFrozenAmount3("");
        data.setMonthTotalAmount4("");
        data.setMonthAvailableAmount4("");
        data.setMonthUsedAmount4("");
        data.setMonthFrozenAmount4("");
        data.setMonthTotalAmount5("");
        data.setMonthAvailableAmount5("");
        data.setMonthUsedAmount5("");
        data.setMonthFrozenAmount5("");
        data.setMonthTotalAmount6("");
        data.setMonthAvailableAmount6("");
        data.setMonthUsedAmount6("");
        data.setMonthFrozenAmount6("");
        data.setMonthTotalAmount7("");
        data.setMonthAvailableAmount7("");
        data.setMonthUsedAmount7("");
        data.setMonthFrozenAmount7("");
        data.setMonthTotalAmount8("");
        data.setMonthAvailableAmount8("");
        data.setMonthUsedAmount8("");
        data.setMonthFrozenAmount8("");
        data.setMonthTotalAmount9("");
        data.setMonthAvailableAmount9("");
        data.setMonthUsedAmount9("");
        data.setMonthFrozenAmount9("");
        data.setMonthTotalAmount10("");
        data.setMonthAvailableAmount10("");
        data.setMonthUsedAmount10("");
        data.setMonthFrozenAmount10("");
        data.setMonthTotalAmount11("");
        data.setMonthAvailableAmount11("");
        data.setMonthUsedAmount11("");
        data.setMonthFrozenAmount11("");
        data.setMonthTotalAmount12("");
        data.setMonthAvailableAmount12("");
        data.setMonthUsedAmount12("");
        data.setMonthFrozenAmount12("");
        
        int id = budgetReportDao.insertBudgetReport(data);
        Assert.assertTrue(id > 0);

        BudgetYearReportDisplayBean value = budgetReportDao.loadBudgetReportById(id);
        Assert.assertNotNull(value);

        budgetReportDao.deleteBudgetReportById(id);
    }
    
    @Test
    public void testPaginate() throws Exception {
        BudgetReportSearchBean searchBean = new BudgetReportSearchBean();
        
        PageModel pageModel = budgetReportDao.paginationBudgetReport(searchBean, 1, 10);
        Assert.assertNotNull(pageModel);
     
    }
    
    @Test
    public void testQuery() throws Exception {
        BudgetReportSearchBean searchBean = new BudgetReportSearchBean();
        
        List<BudgetYearReportDisplayBean> list = budgetReportDao.queryBudgetReport(searchBean);
        Assert.assertNotNull(list);
     
    }
}

```

## 在appcontext-dao-fs.xml中加入

```xml
    <bean id="budgetReportDao" parent="parentDao">
        <property name="proxyInterfaces" value="com.dianping.ba.finance.budget.biz.dao.BudgetReportDao" />
        <property name="target">
            <bean parent="fsMain.daoRealizeTarget">
                <constructor-arg value="BudgetReport" />
            </bean>
        </property>
    </bean>
```

## 创建Service接口

```java
import com.dianping.ba.finance.budget.api.beans.BudgetYearReportDisplayBean;
import com.dianping.ba.finance.budget.api.beans.BudgetReportSearchBean;

import java.util.List;

/**
 * Created by yangyongli
 */
public interface BudgetReportService {

    int insertBudgetReport(BudgetYearReportDisplayBean data);

    BudgetYearReportDisplayBean loadBudgetReportById(int id);

    int deleteBudgetReportById(int id);
    
    /**
     * 分页查询
     * @param searchBean
     * @return
     */
    @DAOAction(action = DAOActionType.PAGE)
    PageModel paginationBudgetReport(BudgetReportSearchBean searchBean, int page, int pageSize);

    /**
     * 列表查询
     * @param searchBean
     * @return
     */
    List<dataBeanName> queryBudgetReport(BudgetReportSearchBean  searchBean);

}
```

## 创建ServiceObject

```
import com.dianping.ba.finance.budget.api.BudgetReportService;
import com.dianping.ba.finance.budget.api.beans.BudgetYearReportDisplayBean;
import com.dianping.ba.finance.budget.api.beans.BudgetReportSearchBean;
import com.dianping.ba.finance.budget.biz.dao.BudgetReportDao;
import com.dianping.finance.common.aop.annotation.Log;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yangyongli
 */
public class BudgetReportServiceObject implements BudgetReportService {
    @Autowired
    BudgetReportDao budgetReportDao;

    @Override
    @Log(logBefore = true, logAfter = true)
    public int insertBudgetReport(BudgetYearReportDisplayBean data) {
        return budgetReportDao.insertBudgetReport(data);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public BudgetYearReportDisplayBean loadBudgetReportById(int id) {
        return budgetReportDao.loadBudgetReportById(id);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public int deleteBudgetReportById(int id) {
        return budgetReportDao.deleteBudgetReportById(id);
    }
    
    @Override
    @Log(logBefore = true, logAfter = true)
    public PageModel paginationBudgetReport(BudgetReportSearchBean searchBean, int page, int pageSize){
        PageModel pageModel = budgetReportDao.paginationBudgetReport(searchBean, page, pageSize);
        if(null == pageModel){
            pageModel = createEmptyPageModel(page, pageSize);
        }
        return pageModel;
    }
    
    @Override
    @Log(logBefore = true, logAfter = true)
    public List<dataBeanName> queryBudgetReport(BudgetReportSearchBean  searchBean){
    	 List<dataBeanName> list = budgetReportDao.queryBudgetReport(searchBean);
    	 if(null == list){
    	     list = Collections.EMPTY_LIST;
    	 }
    	 return list;
    }
    
    private PageModel createEmptyPageModel(int page, int pageSize) {
        PageModel pageModel = new PageModel();
        pageModel.setRecords(new ArrayList());
        pageModel.setPage(page);
        pageModel.setPageSize(pageSize);
        return pageModel;
    }
}
```

## 配置Service

在biz的appcontext-service.xml中加入

```xml
    <bean id="budgetReportService" class="com.dianping.ba.finance.budget.biz.impl.BudgetReportServiceObject">
    </bean>
```

在service的appcontext-service.xml中加入

```xml
<entry key="http://service.dianping.com/budgetService/BudgetReportService_1.0.0" value-ref="budgetReportService"/>
```

在调用该Service的项目appcontext-client.xml中加入

```xml
    <bean id="budgetReportService" class="com.dianping.dpsf.spring.ProxyBeanFactory" init-method="init">
        <property name="serviceName" value="http://service.dianping.com/budgetService/BudgetReportService_1.0.0" />
        <property name="iface" value="com.dianping.ba.finance.budget.api.BudgetReportService" />
        <property name="serialize" value="hessian" />
        <property name="callMethod" value="sync" />
        <property name="timeoutRetry" value="true"/>
    </bean>
```
