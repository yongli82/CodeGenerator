package {{ project_package }}.biz.impl;

import com.dianping.avatar.log.AvatarLogger;
import com.dianping.avatar.log.AvatarLoggerFactory;
import {{ project_package }}.api.{{ data_name}}Service;
import {{ project_package }}.api.datas.{{ data_name}}Data;
import {{ project_package }}.api.beans.{{ data_name}}SearchBean;
import {{ project_package }}.biz.dao.{{ data_name}}Dao;
import com.dianping.finance.common.aop.annotation.Log;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import com.dianping.core.type.PageModel;

/**
 * Created by {{ author }}
 */
public class {{ data_name }}ServiceObject implements {{ data_name}}Service {
    private static final AvatarLogger logger = AvatarLoggerFactory.getLogger({{ data_name }}ServiceObject.class);

    @Autowired
    {{ data_name}}Dao {{ data_name|lower0 }}Dao;

    @Override
    @Log(logBefore = true, logAfter = true)
    public int insert{{ data_name }}({% if monthly -%}String yearMonth, {% endif %}{{ data_name }}Data data){
        return {{ data_name|lower0 }}Dao.insert{{ data_name }}({% if monthly -%}yearMonth, {% endif %}data);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public {{ data_name }}Data load{{ data_name }}ById({% if monthly -%}String yearMonth, {% endif %}int id){
        return {{ data_name|lower0 }}Dao.load{{ data_name }}ById({% if monthly -%}yearMonth, {% endif %}id);
    }
    
    @Override
    @Log(logBefore = true, logAfter = true)
    public int delete{{ data_name }}ById({% if monthly -%}String yearMonth, {% endif %}int id){
        return {{ data_name|lower0 }}Dao.delete{{ data_name }}ById({% if monthly -%}yearMonth, {% endif %}id);
    }
    
    @Override
    @Log(logBefore = true, logAfter = true)
    public int update{{ data_name }}ById({% if monthly %}String yearMonth, {% endif %}{{ data_name }}Data data){
        return {{ data_name|lower0 }}Dao.update{{ data_name }}ById({% if monthly %}yearMonth, {% endif %}data);
    }
    
    @Override
    @Log(logBefore = true, logAfter = true)
    public int update{{ data_name }}BySearchBean({% if monthly %}String yearMonth, {% endif %}{{ data_name }}SearchBean searchBean, {{ data_name }}Data data){
        return {{ data_name|lower0 }}Dao.update{{ data_name }}BySearchBean({% if monthly %}yearMonth, {% endif %}searchBean, data);
    }
    
    @Override
    @Log(logBefore = true, logAfter = true)
    public PageModel paginate{{ data_name }}({% if monthly %}String yearMonth, {% endif %}{{ data_name }}SearchBean searchBean, int page, int pageSize){
         return {{ data_name|lower0 }}Dao.paginate{{ data_name }}({% if monthly %}yearMonth, {% endif %}searchBean, page, pageSize);
    }
    @Override
    @Log(logBefore = true, logAfter = true)                         
    public List<{{ data_name }}Data> query{{ data_name }}({% if monthly %}String yearMonth, {% endif %}{{ data_name }}SearchBean searchBean){
        return {{ data_name|lower0 }}Dao.query{{ data_name }}({% if monthly %}yearMonth, {% endif %}searchBean);
    }
}

