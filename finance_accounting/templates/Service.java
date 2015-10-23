package {{ project_package }}.api;

import {{ project_package }}.api.datas.{{ data_name}}Data;
import {{ project_package }}.api.beans.{{ data_name}}SearchBean;

import java.util.List;
import com.dianping.core.type.PageModel;

/**
 * Created by {{ author }}
 */
public interface {{ data_name }}Service {
    
    int insert{{ data_name }}({% if monthly -%}String yearMonth, {% endif %}{{ data_name }}Data data);

    {{ data_name }}Data load{{ data_name }}ById({% if monthly -%}String yearMonth, {% endif %}int id);

    int delete{{ data_name }}ById({% if monthly -%}String yearMonth, {% endif %}int id);
    
    int update{{ data_name }}ById({% if monthly %}String yearMonth, {% endif %}{{ data_name }}Data data);
    
    int update{{ data_name }}BySearchBean({% if monthly %}String yearMonth, {% endif %}{{ data_name }}SearchBean searchBean, {{ data_name }}Data data);
    
    PageModel paginate{{ data_name }}({% if monthly %}String yearMonth, {% endif %}{{ data_name }}SearchBean searchBean,
                                  int page,
                                  int pageSize);
                                  
    List<{{ data_name }}Data> query{{ data_name }}({% if monthly %}String yearMonth, {% endif %}{{ data_name }}SearchBean searchBean);
}

