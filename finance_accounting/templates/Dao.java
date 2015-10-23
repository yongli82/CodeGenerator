package {{ project_package }}.biz.dao;

import com.dianping.avatar.dao.GenericDao;
import com.dianping.avatar.dao.annotation.DAOAction;
import com.dianping.avatar.dao.annotation.DAOActionType;
import com.dianping.avatar.dao.annotation.DAOParam;
import {{ project_package }}.api.datas.{{ data_name }}Data;

/**
 * Created by {{ author }}
 */
public interface {{ data_name }}Dao extends GenericDao {

    {% if monthly %}
    @DAOAction(action = DAOActionType.INSERT)
    int insert{{ data_name }}(@DAOParam("yearMonth")String yearMonth, @DAOParam("data") {{ data_name }}Data data);

    @DAOAction(action = DAOActionType.LOAD)
    {{ data_name }}Data load{{ data_name }}ById(@DAOParam("yearMonth")String yearMonth, @DAOParam("id") int id);

    @DAOAction(action = DAOActionType.DELETE)
    int delete{{ data_name }}ById(@DAOParam("yearMonth")String yearMonth, @DAOParam("id") int id);

    {% else %}
    @DAOAction(action = DAOActionType.INSERT)
    int insert{{ data_name }}(@DAOParam("data") {{ data_name }}Data data);

    @DAOAction(action = DAOActionType.LOAD)
    {{ data_name }}Data load{{ data_name }}ById(@DAOParam("id") int id);

    @DAOAction(action = DAOActionType.DELETE)
    int delete{{ data_name }}ById(@DAOParam("id") int id);
    {% endif %}
}
