package {{ project_package }}.biz.dao;

import com.dianping.avatar.dao.GenericDao;
import com.dianping.avatar.dao.annotation.DAOAction;
import com.dianping.avatar.dao.annotation.DAOActionType;
import com.dianping.avatar.dao.annotation.DAOParam;
import {{ project_package }}.api.datas.{{ data_name }}Data;
import {{ project_package }}.api.beans.{{ data_name }}SearchBean;
import java.util.List;
import com.dianping.core.type.PageModel;

/**
 * Created by {{ author }}
 */
public interface {{ data_name }}Dao extends GenericDao {
    @DAOAction(action = DAOActionType.INSERT)
    int insert{{ data_name }}({% if monthly %}@DAOParam("yearMonth") String yearMonth, {% endif %}@DAOParam("data") {{ data_name }}Data data);

    @DAOAction(action = DAOActionType.LOAD)
    {{ data_name }}Data load{{ data_name }}ById({% if monthly %}@DAOParam("yearMonth") String yearMonth, {% endif %}@DAOParam("id") int id);

    @DAOAction(action = DAOActionType.DELETE)
    int delete{{ data_name }}ById({% if monthly %}@DAOParam("yearMonth") String yearMonth, {% endif %}@DAOParam("id") int id);
    
    @DAOAction(action = DAOActionType.UPDATE)
    int update{{ data_name }}ById({% if monthly %}@DAOParam("yearMonth") String yearMonth, {% endif %}@DAOParam("data") {{ data_name }}Data data);
    
    @DAOAction(action = DAOActionType.UPDATE)
    int update{{ data_name }}BySearchBean({% if monthly %}@DAOParam("yearMonth") String yearMonth, {% endif %}@DAOParam("searchBean") {{ data_name }}SearchBean searchBean, @DAOParam("data") {{ data_name }}Data data);
    
    @DAOAction(action = DAOActionType.PAGE)
    PageModel paginate{{ data_name }}({% if monthly %}@DAOParam("yearMonth") String yearMonth, {% endif %}@DAOParam("searchBean") {{ data_name }}SearchBean searchBean, @DAOParam("page") int page, @DAOParam("max") int max);
                                  
    @DAOAction(action = DAOActionType.QUERY)
    List<{{ data_name }}Data> query{{ data_name }}({% if monthly %}@DAOParam("yearMonth") String yearMonth, {% endif %}@DAOParam("searchBean") {{ data_name }}SearchBean searchBean);
}
