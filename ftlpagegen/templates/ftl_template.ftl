<!DOCTYPE html>

<html class="theme">
<head>
    <link rel="stylesheet" href="/css/pc.css" type="text/css">
    <title>{{ title }}</title>
</head>
<body>

<div class="ex-modal" style=" display: none; " id="msg-container">
    <div class="ex-modal-dialog">
        <div class="ex-modal-content">
            <div class="ex-modal-header">
                <button type="button"  class="close" data-dismiss="ex-modal">
                    <span aria-hidden="true">&times;</span></button>
                <span class="ex-modal-title" style="font-size: 16px; font-weight: bold;">提示</span>
            </div>
            <div class="ex-modal-body">
            </div>
            <div class="ex-modal-footer">
                <button type="button" class="btn-primary-small" id="msg-confirm">确认</button>
            </div>
        </div>
    </div>
</div>

<div class="ex-modal" style=" display: none; " id="delete-msg-container">
    <div class="ex-modal-dialog">
        <div class="ex-modal-content">
            <div class="ex-modal-header">
                <button type="button"  class="close" data-dismiss="ex-modal">
                    <span aria-hidden="true">&times;</span></button>
                <span class="ex-modal-title" style="font-size: 16px; font-weight: bold;">删除</span>
            </div>
            <div class="ex-modal-body">
                你确定要删除吗?
            </div>
            <div class="ex-modal-footer">
                <button type="button" class="btn-primary-small" id="delete-msg-confirm">确认</button>
            </div>
        </div>
    </div>
</div>

<div class="ex-modal" style=" display: none;width: 500px; " id="update-msg-container">
    <div class="ex-modal-dialog">
        <div class="ex-modal-content">
            <div class="ex-modal-header">
                <button type="button"  class="close" data-dismiss="ex-modal">
                    <span aria-hidden="true">&times;</span></button>
                <span id="manage-role-container-title" class="ex-modal-title" style="font-size: 16px; font-weight: bold;">接口人</span>
            </div>
            <div class="ex-modal-body">
                <div class="">
                    <div id="manage-message" class="control-group" style="display: none; color: lightcoral; text-align: center;">

                    </div>
                    <div class="control-group">
                        <label class="label-form" style="width:16%;text-align:right;">{{  }}:</label>

                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="ex-modal-footer">
                <button type="button" class="btn-primary-small" id="manage-role-confirm">确认</button>
            </div>
        </div>
    </div>
</div>


<script id="NoRowsTemplate" type="text/x-jquery-tmpl">
    <tr class="empty-body">
    <td colspan="5">没有查询到任何记录</td>
    </tr>
</script>

<script id="list_model" type="text/x-jquery-tmpl">
{{each(i,record) records}}
    <tr class="item-body {{if i%2==1}}even{{else}}odd{{/if}}" recordId="{{= record.id}}" roleId="{{= record.roleId}}"
     cityId="{{= record.cityId}}" roleName="{{= record.roleName}}" cityName="{{= record.cityName}}"
     workNo="{{= record.workNo}}" workName="{{= record.workName}}">
        <td class="fs tb-item">{{= record.roleName}}</td>
        <td class="fs tb-item auto-break">{{= record.cityName}}</td>
        <td class="fs tb-item auto-break">{{= record.workNo}}/{{= record.workName}}</td>
        <td class="fs tb-item auto-break">
        <a class="edit_role action-link" href="javascript:void(0)">编辑</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a class="delete_role action-link" href="javascript:void(0)">删除</a>
        </td>
    </tr>
 {{/each}}
</script>

<#include "/WEB-INF/pages/common/menu.ftl">

<div class="right-main">
    <div class="right">
        <div class="content">
            <div class="navigation">首页 > 系统管理 > 角色管理</div>
            <div class="box" style="width: 100%;float:left;min-height:750px;">
                <div id="search-area" style="">
                    <div style="min-height:40px;">
                        <span class="block-title" style="float:left;">查询条件</span>
                        <div id="collapse-search-handler" style="float:left;position:relative;top:2px;margin-left:10px;">
                            <div id="expand-search-div"  style="display: none;"><span style="float:left;">展开</span><span class="icon-chevron-down"  style="float:left;margin-left:2px;"></span></div>
                            <div id="collapse-search-div"><span  style="float:left;">收起</span><span class="icon-chevron-up"  style="float:left;margin-left:2px;"></span></div>
                        </div>
                    </div>
                    <div class="block search-box" style="min-height:120px;" id="search-div">
                        <div style="width: 100%;margin-top:10px;margin-bottom:10px;">
                            <label class="label-form" style="width:8%;text-align:right;">角色类型:</label>
                            <select id="q-role-type" name="roletype" class="txt-ex-form form_value"  style="width:38%;margin-left: 10px;">
                            <#if isSystemRoleManager>
                                <option value="0">全部</option>
                            </#if>
                            <#if isInvoiceHandlerManager || isSystemRoleManager>
                                <option value="1">发票接口人</option>
                            </#if>
                            <#if isFinanceAcceperManager || isSystemRoleManager>
                                <option value="2">发票签收人</option>
                            </#if>
                            <#if isFinanceClassaAuditerManager || isSystemRoleManager>
                                <option value="3">财务一级审批</option>
                            </#if>
                            <#if isFinanceClassbAuditerManager || isSystemRoleManager>
                                <option value="4">财务二级审批</option>
                            </#if>
                            <#if isSystemRoleManager>
                                <option value="5">财务系统管理员</option>
                                <option value="11">发票接口人管理员</option>
                                <option value="12">发票签收人管理员</option>
                                <option value="13">财务一级审批人管理员</option>
                                <option value="14">财务二级审批人管理员</option>
                                <option value="15">超级角色管理员</option>
                            </#if>
                            </select>

                                <input id="q-city-id" name="CityId" type="text" placeholder="如：上海" class="txt-ex-form autocomplete"
                                       style="width:41%;margin-left: 10px;background:url(/img/query.png) #EDF1F2 no-repeat 98%;float:right;margin-right:3%;"
                                       suggest-url="/expense/citySuggest?allowAll=true">
                                <label class="label-form" style="width:5%;text-align:right;float:right;margin-top:8px;">城市:</label>
                        </div>
                        <div style="width: 100%;margin-top:10px;margin-bottom:10px;">
                            <label class="label-form" style="width:8%;text-align:right;">接口人:</label>
                            <input type="text" id="q-work-no" name="workId" autocomplete="off" style="width:38%;margin-left: 10px;margin-right:3%;"
                                   class="txt-ex-form  autocomplete" placeholder="请输入名字或工号" suggest-url="/expense/realNameSuggest">
                            <div style="width:50%;display:inline;">
                            </div>
                        </div>
                        <div class="search-button-section">
                            <button id="search-btn" class="btn-normal btn-normal-search" style="margin-right: 20px">
                                <span>查询</span>
                            </button>
                        </div>
                    </div>
                </div>

                <div style="height:10px;"></div>


                <div>
                    <span class="block-title">角色列表</span>

                    <button id="add-btn" class="btn-normal btn-normal-add" >
                        <span>增加</span>
                    </button>
                </div>
                <div class="body strip">
                    <div class="block">
                        <table width="100%" style="border-spacing: initial;">
                            <thead>
                            <tr style="" class="item-head">
                                <th width="4%" style="display:none;" class="select-all-th"><input type="checkbox" class="select-all" id="select-all"></th>
                                <th id="request-role-th" style="width: 20%;">角色</th>
                                <th id="request-city-th" style="width: 20%;">城市</th>
                                <th id="request-contact-th" style="width: 40%;">接口人</th>
                                <th id="request-action-th">操作</th>
                            </tr>
                            </thead>
                            <tbody id="role_list" namespace="pageModel" page_size="10" style="text-align:center;"
                                   table_url="/pc/expense/rolelist">
                            </tbody>
                        </table>
                    </div>
                <#include "/WEB-INF/pages/common/paging.ftl">
                </div>
            </div>
        </div>
    </div>

    <div class="ac-list"></div>
    <!--内容 end-->
    <script>
        // 加载入口模块
        seajs.use("roleconfig");
    </script>
</body>
</html>
